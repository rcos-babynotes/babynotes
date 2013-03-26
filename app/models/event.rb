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
#  event_type  :string(255)
#

class Event < ActiveRecord::Base

  # Accessible attributes
  # ========================================================
  attr_accessible :description, :happened_at, :event_type

  # Validations
  # ========================================================
  validates_presence_of :description, :happened_at, :baby_id

  # Callbacks
  # ========================================================


  # Relationships
  # ========================================================
  belongs_to :baby

  # Scopes
  # ========================================================
  default_scope order: 'events.happened_at'

  # Static functions
  # ========================================================


  # Instance methods
  # ========================================================


end
