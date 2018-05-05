class Element
	attr_reader :elements, :attributes

	def initialize(*elements, attributes: {})
		@elements = elements
		@attributes = attributes
	end

	def add_elements(*new_elements)
		new_elements.each do |element|
			@elements.push(element)
		end
	end

	def add_attribute
		#TODO
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
		self.class.name.downcase
	end

	def opening_tag
		if rendered_attributes != ""
			"<#{tag} #{rendered_attributes}>"
		else
			"<#{tag}>"
		end
	end

	def closing_tag
		"</#{tag}>"
	end

	def rendered_attributes
		attributes.map do |k, v|
			"#{k}='#{v}'"
		end.join(" ")
	end
end
