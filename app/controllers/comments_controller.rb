class CommentsController < ApplicationController
    before_action :correct_user, only: [:create, :edit,:update,:destroy,:index]
    before_action :admin_check, only: [:create]
    def create
        user_id = current_user.id
        book_id = params[:id]
        text = params[:text]
        current_user.admin ? is_moderate = params[:comment][:is_moderate] : is_moderate=false
        comment = Comment.new(user_id: user_id, book_id: book_id, text: text, is_moderate: is_moderate)
        if comment.save
            flash[:notice] = "Комментарий создан"
        else
            flash[:alert] = "Произошла ошибка"
        end
        redirect_back fallback_location: root_url
    end
    def edit
        @comment = Comment.find(params[:id])
        redirect_to root_url unless current_user.comments.include?(@comment)|| current_user.admin?
    end
    def update
        comment = Comment.find(params[:id])
        redirect_to root_url unless current_user.comments.include?(comment) || current_user.admin?

        if params[:comment].nil?
            is_mod = false
        else
            is_mod = params[:comment][:is_moderate]
        end
        if comment.update_attributes(text: params[:text], is_moderate: is_mod)
            flash[:notice] = "Комментарий сохранен"
        else
            flash[:alert] = "Произошла ошибка"
            render action: :edit
        end

        redirect_back fallback_location: root_url

    end
    def destroy
         redirect_to root_url unless current_user.comments.include?(Comment.find(params[:id]))|| current_user.admin?
        if Comment.find(params[:id]).destroy
             flash[:notice] = "Комментарий удален"
        else
            flash[:alert] = "Произошла ошибка"
        end
        redirect_back fallback_location: root_url
    end

    def index
        if current_user.admin
            @comments = Comment.all.paginate(page:params[:page], per_page:10)
        else
            @comments = current_user.comments.paginate(page: params[:page], per_page: 10)
        end

    end

    private

    def correct_user
        redirect_to root_url if current_user.nil?
        #redirect_to root_url if current_user.id != Comment.find(params[:id]).user_id && !current_user.admin?
    end
    def admin_check
      redirect_to root_url if current_user.admin?      
    end
end
