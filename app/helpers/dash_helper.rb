module DashHelper
  def current_tab(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : nil

    content_tag(:a, :href => link_path) do
      content_tag(:li, :class => class_name) do
        link_text
      end
    end
  end

  def grid_item(text, link, icon, color = '')
    content_tag(:div, class: ["grid-item"]) do
      content_tag(:a, href: link) do
        content_tag(:div, class: ["icon-button", color]) do
          html_str = '<i class="' + icon + '"></i><p>' + text + '</p>'
          html_str.html_safe
        end
      end
    end
  end
end
