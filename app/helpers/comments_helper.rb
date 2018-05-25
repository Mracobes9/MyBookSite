module CommentsHelper
  def correct_user?(comment)
    user_signed_in? && (comment.user.id == current_user.id || current_user.admin)
  end
  def getCommentStatus(comment)
    !comment.is_moderate ? "unmoderate" : "moderate"
  end
  def getFIOAuthor(comment)
    "#{comment.user.second_name} #{comment.user.name}"
  end
end
