# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  before do 
    @user = User.new( email: "test@testemail.com", name: "Foo Bar", password: "foobar", password_confirmation: "foobar")
  end

  subject{@user}

  it { should respond_to(:email) }
  it { should respond_to(:name) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = "" }

    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = "" }

    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 51 }

    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]

      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.com user-foor@bar.org A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn user@foo.COM]

      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end
  
  describe "when email address already exists on database" do
    before do
      user_with_same_email_address = @user.dup

      user_with_same_email_address.email = @user.email.upcase

      user_with_same_email_address.save
    end

    it {should_not be_valid}
  end

  describe "when password is not present" do
    before {@user.password = @user.password_confirmation = " "}

    it {should_not be_valid}
  end

  describe "when password and confirmation password don't match" do
    before {@user.password_confirmation = "mismatch"}

    it {should_not be_valid}
  end

  describe "when password confirmation is nil" do
    before {@user.password_confirmation = nil}

    it {should_not be_valid}
  end

end
