module CommentsHelper
  def comment_delete_link(comment)
    if belongs_to_current_user?(comment)
      link = link_to("Delete", comment_path(comment), method: "delete")
      link.html_safe
    end
  end
end
