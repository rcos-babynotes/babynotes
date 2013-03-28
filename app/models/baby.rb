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
  attr_accessible :birth, :birth_date, :birth_time, :name
  attr_accessor :birth_date, :birth_time

  # Validations
  # ========================================================
  validates :birth, presence: true
  validates :name, presence: true
  validates :user_id, presence: true

  # Callbacks
  # ========================================================
  before_validation :concatenate_dates
  before_save :clear_dates

  # Relationships
  # ========================================================
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :measurements, dependent: :destroy

  # Scopes
  # ========================================================


  # Static functions
  # ========================================================


  # Instance methods
  # ========================================================


  # Virtual attributes
  # ========================================================
  def birth_date
    if @birth_date.present?
      @birth_date
    elsif birth.present?
      birth.to_date.to_s
    end
  end

  def birth_time
    if @birth_time.present?
      @birth_time
    elsif birth.present?
      birth.strftime('%I:%M%p')
    end
  end

private
  def concatenate_dates
    self.birth = "#{self.birth_date} #{self.birth_time}"
  end

  def clear_dates
    birth_date = birth_time = nil
  end
end
