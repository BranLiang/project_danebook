module LikesHelper
  def likes_link(staff)
    if current_user.already_liked?(staff)
      link_to("Unlike", like_path(id: staff, type: staff.class), method: "delete").html_safe
    else
      link_to("Like", likes_path(id: staff, type: staff.class), method: "post").html_safe
    end
  end

  def likers_name(staff)
    if staff.likes_count == 0
      return []
    else
      names = staff.likes.map do |like|
        like.user.username
      end
      return names[0..2]
    end
  end
end
