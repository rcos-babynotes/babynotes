require 'spec_helper'

describe Baby do

  before { @baby = FactoryGirl.create(:baby) }
  subject { @baby }
  it { should be_valid }

  describe "attributes" do
    [:birth,
     :name,
     :user_id,
     :user].each do |attribute|
      it { should respond_to(attribute) }
    end
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:birth) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:gender) }
    it { should allow_value("03/05/1994").for(:birth) }
    it { should_not allow_value("not_a_date").for(:birth) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:events) }
    it { should have_many(:measurements) }
  end

end