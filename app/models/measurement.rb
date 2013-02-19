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
  validates_presence_of :height, :weight

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


end
