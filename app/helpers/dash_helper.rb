module DashHelper
	def current_tab(link_text, link_path)
		class_name = current_page?(link_path) ? 'active' : nil
		
		content_tag(:a, :href => link_path) do
		  	content_tag(:li, :class => class_name) do
		    	link_text
		  	end
		end
	end
end
