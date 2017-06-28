require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) {Question.create!(title: "A Title", body: "A question", resolved:true)}
  let(:answer) {Answer.create!(body: "An answer", question:question)}
  
  describe "Attributes" do
      it "should include body and question attributes" do
          expect(answer).to have_attributes(body: "An answer", question:question)
      end
  end
end
