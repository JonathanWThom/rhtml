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
	
	context "when passed string content" do
		let(:object) { klass.new("Hello World") }

		it "can be created" do
			expect(object).to_not eq nil
		end

		describe "#render" do
			it "returns the correct string" do
				subject { object.render }
				tag = element.downcase
				rendered = "<#{tag}>Hello World</#{tag}>"
				is_expected.to eq rendered
			end
		end
	end

	it "can be created with another element as content" do
	end

	it "can be created with multiple elements as content" do
	end

	it "can be created with attributes" do
	end

	describe "#render" do
		it "returns the correct string" do
		end

		it "returns the correct string when passed a string argument" do
		end

		it "returns the correct string when it has attributes" do
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
