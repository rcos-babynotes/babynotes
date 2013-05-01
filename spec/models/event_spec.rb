# == Schema Information
#
# Table name: events
#
#  id                 :integer          not null, primary key
#  description        :text(255)
#  type               :string(255)
#  happened_at        :datetime
#  baby_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  event_type         :string(255)
#  title              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

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
