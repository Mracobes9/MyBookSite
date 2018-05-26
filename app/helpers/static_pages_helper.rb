module StaticPagesHelper
  def correct_admin_user?
    !current_user.nil? && current_user.admin
  end
  def correct_user?(comment)
    user_signed_in? && (comment.user.id == current_user.id || current_user.admin)
  end
end
