require 'rails_helper'

RSpec.describe Answer, type: :model do
    let(:question) { Question.create(title: "Question Title", body: "Question body.", resolved: false) }
    let(:answer) { Answer.create(body: "Answer body.", question: question) }
    let(:answer1) { Answer.create(body: "Answer body.", question: question) }
    
    describe "attributes" do
        it "should have body attribute" do
            expect(answer).to have_attributes(body: "Answer body.")
        end
    end
end
