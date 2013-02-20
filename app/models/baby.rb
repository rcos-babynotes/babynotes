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

class Baby < ActiveRecord::Base
  
  # Accessible attributes
  # ========================================================
  attr_accessible :birth, :name

  # Validations
  # ========================================================
  validates_presence_of :birth, :name, :user_id

  # Callbacks
  # ========================================================


  # Relationships
  # ========================================================
  belongs_to :user
  has_many :events
  has_many :measurements

  # Scopes
  # ========================================================


  # Static functions
  # ========================================================


  # Instance methods
  # ========================================================

end
