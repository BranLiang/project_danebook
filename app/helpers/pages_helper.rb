module PagesHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def post_delete_link(post)
    if belongs_to_current_user?(post)
      link = link_to("Delete", post_path(post), method: "delete")
      link.html_safe
    end
  end

  def edit_profile_link
    if is_current_user?
      link = link_to("Edit Profile", edit_user_path(@user), class: "btn btn-primary")
      link.html_safe
    end
  end
end
