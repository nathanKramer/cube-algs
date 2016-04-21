module ApplicationHelper
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'current' : ''

    content_tag(:li, class: class_name) do
      link_to link_text, link_path
    end
  end

  def bootstrap_nav_link(link_label, link_target, options = {})
    class_name = current_page?(link_target) ? 'active' : ''
    class_name << " #{options[:class]}" if options.key?(:class)

    content_tag(:span) do
      link_to link_label, link_target, class: class_name
    end
  end
end
