module StaticPagesHelper
  def correct_user?
    !current_user.nil? && current_user.admin    
  end
end
