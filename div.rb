class Div
	attr_reader :content

	def initialize(content)
		@content = content
	end

	def start_tag
		"<div>"
	end

	def end_tag
		"</div>"
	end
	
	def render
		start_tag + content + end_tag
	end
end
