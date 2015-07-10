module ApplicationHelper

  def full_title(base_title = '')
    title = "PLCOE of Books"
    if base_title.empty?
      title
    else
      "#{base_title} | #{title}"
    end
  end
end
