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

class Measurement < ActiveRecord::Base

  # Accessible attributes
  # ========================================================
  attr_accessible :height, :weight

  # Validations
  # ========================================================
  validates_presence_of :baby_id
  validate :height_or_weight

  # Callbacks
  # ========================================================


  # Relationships
  # ========================================================
  belongs_to :baby

  # Scopes
  # ========================================================


  # Static functions
  # ========================================================


  # Instance methods
  # ========================================================

private
  def height_or_weight
    if height.blank? && weight.blank?
      errors.add(:height, "A height or a weight is required")
      return false
    end
  end
end
