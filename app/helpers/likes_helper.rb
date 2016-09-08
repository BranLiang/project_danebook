module LikesHelper
  def likes_link(staff)
    if current_user.already_liked?(staff)
      link_to("Unlike", like_path(id: staff, type: staff.class), method: "delete").html_safe
    else
      link_to("Like", likes_path(id: staff, type: staff.class), method: "post").html_safe
    end
  end
end
