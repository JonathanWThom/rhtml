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

	it "can be created with string content" do
	end

	it "can be created with another element as content" do
	end

	it "can be created with multiple elements as content" do
	end

	it "can be created with attributes" do
	end

	describe "#render" do
		it "returns a string" do
		end

		it "returns the correct string" do
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
