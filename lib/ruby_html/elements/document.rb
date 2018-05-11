module HTML
	class Document < Element
		attr_reader :header_elements

		def initialize(*elements, header_elements: [])
			@elements = elements
			@header_elements = header_elements.flatten
		end

		def opening_tag
			"<!DOCTYPE><html><head>#{rendered_header_elements}</head><body>"
		end

		def rendered_header_elements
			header_elements.map do |element|
				element.render
			end.join("")
		end

		def closing_tag
			"</body></html>"
		end

		def render_to_file(path)
			File.open(path, "w") { |file| file.write(render) }
		end

        def add_attribute(arg)
            raise NotImplementedError
        end
	end
end
