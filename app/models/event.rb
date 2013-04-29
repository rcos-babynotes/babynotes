# == Schema Information
#
# Table name: events
#
#  id                 :integer          not null, primary key
#  description        :text(255)
#  type               :string(255)
#  happened_at        :datetime
#  baby_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  event_type         :string(255)
#  title              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Event < ActiveRecord::Base

  # Accessible attributes
  # ========================================================
  attr_accessible :title, :description, :happened_at, :event_type, :image

  # Validations
  # ========================================================
  validates_presence_of :title, :description, :happened_at, :baby_id

  # Callbacks
  # ========================================================


  # Relationships
  # ========================================================
  belongs_to :baby
  has_attached_file :image, styles: { large: "1000x1000>", medium: "500x500>", small: "250x250>", thumb: "100x100>" }

  # Scopes
  # ========================================================

  # Static functions
  # ========================================================


  # Instance methods
  # ========================================================


end
