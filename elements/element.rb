class Element
	attr_reader :elements

	def initialize(*elements, attributes: {})
		@elements = elements
		@attributes = attributes
	end

	def add_elements(*new_elements)
		new_elements.each do |element|
			@elements.push(element)
		end
	end

	def render
		 opening_tag + rendered_elements + closing_tag
	end
	
	def rendered_elements
		elements.map do |element|
			if element.is_a? String
				element
			else
				element.render
			end
		end.join("")
	end
	
	def tag
		raise NotImplementedError
	end

	def opening_tag
		"<#{tag}>"
	end

	def closing_tag
		"</#{tag}>"
	end
end
