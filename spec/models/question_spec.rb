require 'rails_helper'

RSpec.describe Question, type: :model do
    let(:question) {Question.create!(title:"My test title", body:"My test question", resolved:true)}

    describe "attributes" do
        it "has attributes" do
            expect(question).to have_attributes(title:"My test title", body:"My test question", resolved:true)
        end
    end
end
