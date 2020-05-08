require 'rails_helper'

RSpec.describe Recipe, type: :model do
	describe "name" do
		it "should be valid" do
			should validate_presence_of(:name)
		end

    it "should be unique" do
      create(:user)
      create(:recipe)
      should validate_uniqueness_of(:name).ignoring_case_sensitivity
    end

    it "should have a length between 3 and 35" do
      should validate_length_of(:name).is_at_least(3).is_at_most(35)
    end

    it "'capitalize_name' before save method should be working" do
			create(:user)
      create(:recipe, name: "tEsTinG caPiTalize")
      expect(Recipe.last.name).to eql("Testing capitalize")
    end
	end

  describe "description" do
    it "should be valid" do
			should validate_presence_of(:description)
		end

    it "should have a min length of 10" do
      should validate_length_of(:description).is_at_least(10)
    end
  end

	describe "user_id" do
		it "should be valid" do
			should validate_presence_of(:user_id)
		end
	end

	it "has created decrescent order" do
		create(:user)
	  create(:recipe)
	  create(:recipe, name: "Testing")
	  expect(Recipe.first.name).to eql("Testing")
	end

  describe "relationships" do
    it "should belong to user" do
      should belong_to(:user)
    end
  end
end
