# == Schema Information
#
# Table name: measurements
#
#  id                :integer          not null, primary key
#  height            :float
#  weight            :float
#  baby_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  happened_at       :datetime
#  height_percentile :integer
#  weight_percentile :integer
#

require 'spec_helper'

describe Measurement do

  before { @measurement = FactoryGirl.create(:measurement) }
  subject { @measurement }
  it { should be_valid }

  describe "attributes" do
    [:height,
     :weight].each do |attribute|
      it { should respond_to(attribute) }
    end
  end

  describe "validations" do
    before do
      @baby = @measurement.baby
      @missing_both = @baby.measurements.new
      @missing_height = @baby.measurements.new(weight: 12)
      @missing_weight = @baby.measurements.new(height: 15)
    end

    it { @missing_both.should_not be_valid }
    it { @missing_height.should be_valid }
    it { @missing_weight.should be_valid }
    it { should validate_presence_of(:baby_id) }
  end

  describe "associations" do
    it { should belong_to(:baby) }
  end

end
