module ApplicationHelper
	def nav_link(link_text, link_path, options={})
		class_name = current_page?(link_path) ? 'active' : ''
		class_name = class_name + ' sub-menu'
		content_tag(:li, :class => class_name) do
			link_to link_text, link_path, options
		end
	end
end
