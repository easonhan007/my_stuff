module ApplicationHelper
	include Pagy::Frontend
	def del_btn(text, path)
	  link_to text, path, data: {turbo_stream: '', turbo_method: 'delete'}, class: 'bi bi-x-circle text-danger', onclick: 'return confirm("Are you sure to delete?")'
	end
end
