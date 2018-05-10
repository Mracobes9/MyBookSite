class CommentsController < ApplicationController
    before_action :correct_user, only: [:create, :edit,:update,:destroy,:index]
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
    end
    def update
        comment = Comment.find(params[:id])
        params[:is_moderate] = false if params[:is_moderate].nil?
        is_mod = params[:is_moderate]
        if comment.update_attributes(text: params[:text], is_moderate: false)
            flash[:notice] = "Комментарий сохранен"
        else
            flash[:alert] = "Произошла ошибка"
            render action: :edit 
        end
        
        redirect_back fallback_location: root_url
         
    end
    def destroy
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
end
