module ApplicationHelper
  def active_class(link_path)
    "active" if request.fullpath == link_path
  end

  def current_path
    request.fullpath
  end
end
