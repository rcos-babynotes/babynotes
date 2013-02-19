# == Schema Information
#
# Table name: babies
#
#  id         :integer          not null, primary key
#  birth      :datetime
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BabyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
