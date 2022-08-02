require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "Should validate that the password and password_confirmation are filled out" do
      @user = User.create(first_name: "Tyree", last_name: "Webber", email: "test@test.com", password: nil, password_confirmation: nil)
      expect(@user).to be_invalid
    end
    it "Should not create a new user if the password and password_confirmation do not match" do
      @user = User.create(first_name: "Tyree", last_name: "Webber", email: "test@test.com", password: "test123", password_confirmation: "nottest123")
      expect(@user).to be_invalid
    end
    it "Should verify the password is at least 5 characters long" do
      @user = User.create(first_name: "Tyree", last_name: "Webber", email: "test@test.com", password: "test", password_confirmation: "test")
      expect(@user).to be_invalid
    end
    it "Should validate that the email field is filled out" do
      @user = User.create(first_name: "Tyree", last_name: "Webber", email: nil, password: "test123", password_confirmation: "test123")
      expect(@user).to be_invalid
    end
    it "Should not create a new user if the email already exists in the database" do
      @user1 = User.create(first_name: "Tyree", last_name: "Webber", email: "test1@test.com", password: "test123", password_confirmation: "test123")
      expect(@user1).to be_valid
      @user2 = User.create(first_name: "Kendra", last_name: "Wagner", email: "test1@test.com", password: "test1234", password_confirmation: "test1234")
      expect(@user2).to be_invalid
    end
    it "Should validate that the first_name field was filled out" do
      @user = User.create(first_name: nil, last_name: "Webber", email: "test@test.com", password: "test123", password_confirmation: "test123")
      expect(@user).to be_invalid
    end
    it "Should validate that the last_name field was filled out" do
      @user = User.create(first_name: "Tyree", last_name: nil, email: "test@test.com", password: "test123", password_confirmation: "test123")
      expect(@user).to be_invalid
    end
    it "Should create a new user if all fields are filled out, and the email has not been used" do
      @user = User.create(first_name: "Tyree", last_name: "Webber", email: "test2@test.com", password: "test123", password_confirmation: "test123")
      expect(@user).to be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    it "Should return an instance of the user object if the email and password are correct" do
      @user = User.create(first_name: "Tyree", last_name: "Webber", email: "test@test.com", password: "test123", password_confirmation: "test123")
      expect(@user).to be_valid
      auth = User.authenticate_with_credentials(@user.email, "test123")
      expect(auth).to eq(@user)
    end
    it "Should return nil if the email is not in the user database" do
      @user = User.create(first_name: "Tyree", last_name: "Webber", email: "test3@test.com", password: "tester2", password_confirmation: "tester2")
      expect(@user).to be_valid
      auth = User.authenticate_with_credentials(@user.email, "test")
      expect(auth).to eq(nil)
    end
  end

end