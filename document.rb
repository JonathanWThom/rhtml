class Document < Element
	def opening_tag
		# TODO handle title and other header stuff
		"<!DOCTYPE><html><head><title>Title Goes Here</title></head><body>"
	end

	def closing_tag
		"</body></html>"
	end

	def render_to_file(path)
		File.open(path, "w") { |file| file.write(render) }
	end
end
