class CommentsController < ApplicationController
    def create
        user_id = current_user.id
        book_id = params[:format]
        text = params[:text]
        is_moderate = false
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
        if comment.update_attributes(text: params[:text], is_moderate: params[:is_moderate])
            flash[:notice] = "Комментарий сохранен"
        else
            flash[:alert] = "Произошла ошибка"
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
end
