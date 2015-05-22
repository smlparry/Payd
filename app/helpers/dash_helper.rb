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

  def form_field(content, class_name = '')
    content_tag(:div, class: [ 'form-field', class_name ]) do
      content.html_safe
    end
  end

  def breadcrumbs
    url = request.original_fullpath
    crumbs = url.reverse.chomp('/').reverse.split('/')
    breadcrumbs = ""
    crumb_path = "/"
    crumbs.each do |crumb|
      crumb_path = crumb_path + crumb + '/'
      if crumb != crumbs[ crumbs.length - 1 ]
        breadcrumbs << '<a href="' + crumb_path + '">' + crumb.first.upcase + crumb[1..-1] + '</a><i class="ion-chevron-right breadcrumb"></i>'
      else
        breadcrumbs << crumb.first.upcase + crumb[1..-1]
      end
    end
    breadcrumbs.html_safe
  end

  def table_for(model)
    content_tag(:table) do
      content_tag(:tbody) do
        content_tag(:tr) do
          model.each do |m|
            content_tag(:td) do
              # m.send( show[0] )
              "hey"
            end
          end
        end
      end
    end
  end
end
