module ApplicationHelper

  def full_title(page_title)
    base_title = 'HWinv'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
