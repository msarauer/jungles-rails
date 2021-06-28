require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it("should require a password") do
      @user = User.create({email: 'a@test.com'})
      puts "password error: ", @user.errors.full_messages
      expect(@user.errors.full_messages).to eq(["Password can't be blank"])
      expect(@user).to_not be_valid
    end
    it("should create a new user if passwords match") do
      @user = User.create({email: 'a@test.com', password: "asd", password_confirmation: "asd"})
      
      expect(@user).to be_valid
    end

    it("should not create a new user if the passwords do not match") do
      @user = User.create({email: 'as@test.com', password: "as", password_confirmation: "asd"})
      puts "password error2: ", @user.errors.full_messages
      expect(@user.errors.full_messages).to eq(["Password confirmation doesn't match Password"])
      expect(@user).to_not be_valid
    end


  end
end


# create_table "users", force: :cascade do |t|
#   t.string   "first_name"
#   t.string   "last_name"
#   t.string   "email"
#   t.string   "password_digest"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
