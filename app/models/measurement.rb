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
  validates :height, presence: { message: "cannot be blank, unless weight is filled out", :unless => :weight? },
                     numericality: { greater_than: 0, less_than_or_equal_to: 36, message: "must be between 0 and 3 feet. This is a baby tracker!", if: :height? }
  validates :weight, presence: { message: "cannot be blank, unless height is filled out", :unless => :height? },
                     numericality: { greater_than: 0, less_than_or_equal_to: 70, message: "must be between 0 and 70 pounds. This is a baby tracker!", if: :weight? }

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
