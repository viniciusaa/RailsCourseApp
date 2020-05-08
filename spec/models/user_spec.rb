require 'rails_helper'

RSpec.describe User, type: :model do
	describe "name" do
		it "should be valid" do
			should validate_presence_of(:name)
		end

    it "should be unique" do
      create(:user)
      should validate_uniqueness_of(:name).ignoring_case_sensitivity
    end

    it "should have a length between 3 and 35" do
      should validate_length_of(:name).is_at_least(3).is_at_most(35)
    end

    it "'capitalize_name' before save method should be working" do
      create(:user, name: "tEsTinG caPiTalize")
      expect(User.last.name).to eql("Testing Capitalize")
    end
	end

  describe "email" do
    it "should be valid" do
			should validate_presence_of(:email)
		end

    it "should be unique" do
      create(:user)
      should validate_uniqueness_of(:email).ignoring_case_sensitivity
    end

    it "should have a max length of 41" do
      should validate_length_of(:email).is_at_most(41)
    end

    it "should have a valid format" do
      should_not allow_value("example").for(:email)
    end

		it "'downcase_email' before save method should be working" do
      create(:user, email: "tEsTinG@GmAil.cOm")
      expect(User.last.email).to eql("testing@gmail.com")
    end
  end

  describe "relationships" do
    it "should have many articles" do
      should have_many(:recipes).dependent(:destroy)
    end
  end

  it "has created decrescent order" do
    create(:user)
    create(:user, name: "Testing")
    expect(User.first.name).to eql("Testing")
  end

  it "has secure password" do
    should have_secure_password
  end
end
