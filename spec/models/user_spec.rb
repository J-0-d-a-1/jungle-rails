require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create new user' do
      @user = User.new(first_name: 'Bob', last_name: 'Example', email: 'bob@example.com', password: 'bobbob', password_confirmation: 'bobbob')

      @user.save!

      expect(@user).to be_present
    end

    it 'should not create new user when password and password_confirmation are not the same' do
      @user = User.new(first_name: 'Bob', last_name: 'Example', email: 'bob@example.com', password: 'bobbob', password_confirmation: 'notbobbob')

      @user.valid?

      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'should not create new user when password is nil' do
      @user = User.new(first_name: 'Bob', last_name: 'Example', email: 'bob@example.com', password: nil, password_confirmation: 'bobbob')

      @user.valid?

      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'should not create new user when password_confirmation is nil' do
      @user = User.new(first_name: 'Bob', last_name: 'Example', email: 'bob@example.com', password: 'bobbob', password_confirmation: nil)

      @user.valid?

      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'should not creat new user when email already exists (not case sensitive)' do
      @existUser = User.create(first_name: 'Bob', last_name: 'Example', email: 'BOB@example.com', password: 'bobbob', password_confirmation: 'bobbob')

      @newUser = User.new(first_name: 'Bob2', last_name: 'Example2', email: 'bob@example.COM', password: 'bob2', password_confirmation: 'bob2')

      @newUser.valid?

      expect(@newUser).not_to be_valid
      expect(@newUser.errors.full_messages).to include("Email has already been taken")    
    end

    it "should not create new user when email is blank" do
      @user = User.new(first_name: 'Bob', last_name: 'Example', email: nil, password: 'bobbob', password_confirmation: 'bobbob')

      @user.valid?
      
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "should not create new user when first name is blank" do
      @user = User.new(first_name: nil, last_name: 'Example', email: 'bob@example.com', password: 'bobbob', password_confirmation: 'bobbob')

      @user.valid?
      
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "should not create new user when last name is blank" do
      @user = User.new(first_name: 'Bob', last_name: nil, email: 'bob@example.com', password: 'bobbob', password_confirmation: 'bobbob')

      @user.valid?
      
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    
  end

  describe 'Password Validations' do
    it 'should not create new user when the length of password is less than 4' do
       @user = User.new(first_name: 'Bob', last_name: 'Example', email: 'bob@example.com', password: 'bob', password_confirmation: 'bob')

       @user.valid?

       expect(@user).not_to be_valid
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end
  
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate with a few space before and/or after email address' do 
      @user = User.create(first_name: 'Bob', last_name: 'Example', email: 'example@domain.com', password: 'bobbob', password_confirmation: 'bobbob')

      @logged_in_user = User.authenticate_with_credentials(' example@domain.com ', 'bobbob')

      expect(@logged_in_user).to eq(@user)
    end
  end

end
