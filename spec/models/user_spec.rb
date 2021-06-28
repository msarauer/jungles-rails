require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it("should require a password") do
      @user = User.create({first_name: "Mitchel", last_name: "Sara", email: 'a@test.com'})
      puts "password error: ", @user.errors.full_messages
      expect(@user.errors.full_messages).to eq(["Password can't be blank"])
      expect(@user).to_not be_valid
    end

    it("should create a new user if passwords match") do
      @user = User.create({first_name: "Mitchel", last_name: "Sara", email: 'a@test.com', password: "asd", password_confirmation: "asd"})
      
      expect(@user).to be_valid
    end

    it("should not create a new user if the passwords do not match") do
      @user = User.create({first_name: "Mitchel", last_name: "Sara", email: 'as@test.com', password: "as", password_confirmation: "asd"})
      puts "password error2: ", @user.errors.full_messages
      expect(@user.errors.full_messages).to eq(["Password confirmation doesn't match Password"])
      expect(@user).to_not be_valid
    end

    it("should have case insenstive emails") do
      @user = User.create({first_name: "Mitchel", last_name: "Sara", email: "m@test.com", password: "asd", password_confirmation: "asd"})
      @user1 = User.create({first_name: "Mitchel", last_name: "Sara", email: "M@test.com", password: "asd", password_confirmation: "asd"})
      expect(@user1.errors.full_messages).to eq(["Email has already been taken"])
      expect(@user1).to_not be_valid
    end

    it("should require a first name") do
      @user = User.create({ last_name: "Sara", email: "m@test.com", password: "asd", password_confirmation: "asd"})
      puts "password error: ", @user.errors.full_messages
      expect(@user.errors.full_messages).to eq(["First name can't be blank"])
      expect(@user).to_not be_valid
    end

    it("should require a last name") do
      @user = User.create({ first_name: "Sara", email: "m@test.com", password: "asd", password_confirmation: "asd"})
      puts "password error: ", @user.errors.full_messages
      expect(@user.errors.full_messages).to eq(["Last name can't be blank"])
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
