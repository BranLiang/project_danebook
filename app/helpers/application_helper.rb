module ApplicationHelper
  def active_class(link_path)
    "active" if request.fullpath == link_path
  end

  def current_path
    request.fullpath
  end

  def belongs_to_current_user?(staff)
    current_user.id == staff.user_id
  end

  def is_current_user?
    current_user == User.find_by_id(params[:id])
  end
end
