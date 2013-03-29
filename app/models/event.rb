# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  description :text(255)
#  type        :string(255)
#  happened_at :datetime
#  baby_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  event_type  :string(255)
#  title       :string(255)
#

class Event < ActiveRecord::Base

  # Accessible attributes
  # ========================================================
  attr_accessible :title, :description, :happened_at, :event_type

  # Validations
  # ========================================================
  validates_presence_of :title, :description, :happened_at, :baby_id

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
