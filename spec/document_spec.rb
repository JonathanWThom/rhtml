require "spec_helper"

RSpec.describe HTML::Document do
    it "can be created" do
        expect(HTML::Document.new).to_not eq nil
    end

    context "when passed an element" do
        let(:document) { HTML::Document.new(HTML::Div.new) }

        it "can be created" do
            expect(document).to_not eq nil
        end

        describe "#render" do
            it "renders the correct string" do
                rendered = "<!DOCTYPE><html><head></head><body><div></div></body></html>"
                expect(document.render).to eq rendered
            end
        end
    end

    context "when passed header_elements" do
         let(:document) { HTML::Document.new(header_elements: [HTML::Title.new("Title")]) }

         it "can be created" do
             expect(document).to_not eq nil
        end

        describe "#render" do
            it "renders the correct string" do
                rendered = "<!DOCTYPE><html><head><title>Title</title></head><body></body></html>"
                expect(document.render).to eq rendered
            end
        end

    end
end
