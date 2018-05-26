class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :edit,:update,:destroy,:index]
    before_action :admin_check, only: [:create]
    before_action :checkCommentOwner, only:[:update,:destroy,:edit]
    def create
      if Book.find(params[:book_id]).comments.create(user_id: current_user.id,text: params[:comment][:text],is_moderate: false)
        flash[:notice] = "Комментарий создан"
      end
        redirect_back fallback_location: root_url
    end
    def edit
        @comment = Comment.find(params[:id])
        @is_edit = true
    end
    def update
        comment = Book.find(params[:book_id]).comments.find(params[:id])
        is_mod = params[:comment].nil? ? false : params[:comment][:is_moderate]
        byebug
        if comment.update_attributes(text: params[:comment][:text], is_moderate: is_mod)
            flash[:notice] = "Комментарий сохранен"
        else
            flash[:alert] = "Произошла ошибка"
            render action: :edit
        end

        redirect_back fallback_location: root_url

    end
    def destroy
        if Book.find(params[:book_id]).comments.find(params[:id]).destroy
             flash[:notice] = "Комментарий удален"
        else
            flash[:alert] = "Произошла ошибка"
        end
        redirect_back fallback_location: root_url
    end

    def index
        if current_user.admin?
            @comments = Comment.all
        else
            @comments = current_user.comments
        end
        @comments = @comments.paginate(page:params[:page], per_page:10)
    end

    private


    def admin_check
      redirect_to root_url if current_user.admin?
    end
    def getCommentStatus
      current_user.admin ? params[:comment][:is_moderate] : false
    end
    def checkCommentOwner
      redirect_to root_url if !current_user.comments.include?(Comment.find(params[:id])) && !current_user.admin?
    end
end
