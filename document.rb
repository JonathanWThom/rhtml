class Document
	attr_reader :elements

	def initialize(elements)
		@elements = [elements].flatten
	end

	def render
		top = "<!DOCTYPE><html><head><title>Title Goes Here</title></head>"
		body = "<body>#{elements.map(&:render).join("")}</body>"
		footer = "</html>"
		top + body + footer
	end

	def render_to_file(path)
		File.open(path, "w") { |file| file.write(render) }
	end
end
