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

class Event < ActiveRecord::Base

  # Accessible attributes
  # ========================================================
  attr_accessible :description, :happened_at, :type

  # Validations
  # ========================================================
  validates_presence_of :description, :happened_at, :type

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
