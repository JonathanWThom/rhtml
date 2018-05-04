class Div
	attr_reader :elements

	def initialize(elements)
		@elements = [elements].flatten
	end

	def start_tag
		"<div>"
	end

	def end_tag
		"</div>"
	end
	
	def render
		# TODO: NEED TO HANDLE NON ELEMENT CONTENT TOO
		start_tag + rendered_elements + end_tag
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
end
