require 'rails_helper'

RSpec.describe Song, type: :model do

  before :each do
    @good_user = User.create(name: "Claire", password: "password")
    @excellent_user = User.create(name: "Claire the Magnificent", password: "betterpassword", voted_for: "[2]")
    @bad_user = User.create(name: nil)
  end

  describe "validations" do
    it "has a name" do
      expect(@good_user).to be_valid
      expect(@bad_user).to_not be_valid
    end
  end

  describe "model methods" do
    it "updates a user that hasn't voted with a new voted for song" do
      @good_user.update_voted_for("1")
      expect(@good_user.voted_for).to eq "[1]"
    end

    it "updates a user that has voted with another voted for song" do
      @excellent_user.update_voted_for("1")
      expect(@excellent_user.voted_for).to eq "[2, 1]"
    end
  end
end
