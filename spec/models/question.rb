require 'spec_helper'

describe "Question" do
  let(:question) { Question.new }

  context "when no body is provided" do
    it "is not valid" do
      expect(question).to_not be_valid
    end
  end

  context "when body is provided" do
    before { question.body = "To be, or not to be?" }

    it "is valid" do
      expect(question).to be_valid
    end
  end
end
