module ApplicationHelper
	def del_btn(text, path)
	  link_to text, path, data: {turbo_stream: '', turbo_method: 'delete'}, class: 'btn btn-sm btn-danger'
	end
end
