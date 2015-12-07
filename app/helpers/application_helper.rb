module ApplicationHelper
  # :reek:UtilityFunction
  def current_title(page_title)
    base_title = Settings.sitename

    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
