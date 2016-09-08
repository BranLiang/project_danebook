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

  def is_current_user?
    current_user == User.find_by_id(params[:id])
  end

  def edit_profile_link
    if is_current_user?
      str = link_to("Edit Profile", edit_user_path(@user), class: "btn btn-primary")
      str.html_safe
    end
  end
end
