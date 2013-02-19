# == Schema Information
#
# Table name: measurements
#
#  id         :integer          not null, primary key
#  height     :float
#  weight     :float
#  baby_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MeasurementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
