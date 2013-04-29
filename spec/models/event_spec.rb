require 'spec_helper'

describe Event do

  before { @event = FactoryGirl.create(:event) }
  subject { @event }
  it { should be_valid }

  describe "attributes" do
    [:description,
     :happened_at,
     :event_type,
     :baby_id].each do |attribute|
      it { should respond_to(attribute) }
    end
  end

  describe "validations" do
    it { should validate_presence_of(:baby_id) }
    it { should validate_presence_of(:event_type) }
    it { should validate_presence_of(:happened_at) }
    it { should validate_presence_of(:description) }
  end

  describe "associations" do
    it { should belong_to(:baby) }
  end

end