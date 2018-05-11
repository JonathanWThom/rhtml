require "spec_helper"
RSpec.shared_examples "HTML element" do |element|
	let(:klass) do
		Object.const_get("HTML::#{element}")
	end
	
		
  	it "can be created" do
		expect do
			klass.new
		end.to_not raise_error 
  	end
	
	context "when passed a string" do
		let(:el) { klass.new("Hello World") }
	
		it "can be created" do
			expect(el).to_not eq nil
		end

		it "returns the correct string" do
			tag = element.downcase
			rendered = "<#{tag}>Hello World</#{tag}>"
			expect(el.render).to eq rendered
		end
	end
	
	context "when passed another element as content" do
		let(:el) { klass.new(klass.new) }
	

		it "can be created" do
			expect(el).to_not eq nil
		end
		
		it "returns the correct string" do
		end
	end

	context "when passed multiple elements as content" do
		let(:el) { klass.new(klass.new, klass.new) }
	
		it "can be created" do
			expect(el).to_not eq nil
		end
		
		it "returns the correct string" do
		end
	end
	
	context "when passed attributes" do
		let(:el) { klass.new(klass.new, attributes: { "class": "red" }) }

		it "can be created" do
			expect(el).to_not eq nil 
		end

		it "returns the correct string" do
		end
	end

	describe "#add_attribute" do
		it "will append an attribute" do
		end
	end
end

HTML::ELEMENTS.each do |element|
	RSpec.describe "HTML::#{element}" do
		include_examples "HTML element", element
	end
end
