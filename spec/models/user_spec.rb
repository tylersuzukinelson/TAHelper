require 'spec_helper'

describe "User" do
  let(:user) do
    User.new(
      email: "bob@gmail.com",
      permissions: :student,
    )
  end

  context "when no email is provided" do
    before { user.email = nil }

    it "is not valid" do
      expect(user).to_not be_valid
    end
  end

  context "when email is provided" do
    context "and email is a blank string" do
      before { user.email = "" }

      it "is not valid" do
        expect(user).to_not be_valid
      end
    end

    context "and email is not blank" do
      it "is valid" do
        expect(user).to be_valid
      end

      context "and email is not unique" do
        it "is not valid" do
          User.create!(email: "bob@gmail.com", permissions: :student)
          expect(user).to_not be_valid
        end
      end
    end
  end

  context "when no permissions is provided" do
    before { user.permissions = nil }

    it "is not valid" do
      expect(user).to_not be_valid
    end
  end

  context "when permissions is provided" do
    context "and permissions are valid" do
      it "is valid" do
        expect(user).to be_valid
      end
    end

    context "and permissions are invalid" do
      it "is raises an ArgumentError" do
        expect{user.permissions = :wee}.to raise_error(ArgumentError)
      end
    end
  end
end
