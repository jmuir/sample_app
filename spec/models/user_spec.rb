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
    @user = User.new( email: "test@testemail.com", name: "Foo Bar" )
  end

  subject{@user}

  it { should respond_to(:email) }
  it { should respond_to(:name) }

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

end
