# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  description :string(255)
#  type        :string(255)
#  happened_at :datetime
#  baby_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
