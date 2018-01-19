require 'spec_helper'

describe "Question" do
  let(:user) do
    User.create(
      email: "bob@gmail.com",
      permissions: :admin,
    )
  end
  let(:question) do
    Question.new(
      body: "To be, or not to be?",
      user: user,
    )
  end

  context "when no body is provided" do
    before { question.body = nil }

    it "is not valid" do
      expect(question).to_not be_valid
    end
  end

  context "when body is provided" do
    it "is valid" do
      expect(question).to be_valid
    end
  end

  context "when no user is provided" do
    before { question.user = nil }

    it "is not valid" do
      expect(question).to_not be_valid
    end
  end

  context "when user is provided" do
    it "is valid" do
      expect(question).to be_valid
    end
  end
end
