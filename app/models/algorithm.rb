class Algorithm < ActiveRecord::Base
  belongs_to :case

  scope :for_angle, -> (angle) { where(angle: angle) }

  validates :algorithm, presence: true, uniqueness: {
    message: 'has already been used'
  }
end
