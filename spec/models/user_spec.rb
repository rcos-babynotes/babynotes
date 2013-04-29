require 'spec_helper'

describe User do

  before { @user = FactoryGirl.create(:user) }
  subject { @user }
  it { should be_valid }

  describe "attributes" do
    [:email,
     :password,
     :password_confirmation].each do |attribute|
      it { should respond_to(attribute) }
    end
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe "associations" do
    it { should have_many(:babies) }
  end

end