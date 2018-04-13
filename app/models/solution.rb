class Solution < ActiveRecord::Base
  extend FriendlyId
  friendly_id :algorithm
  belongs_to :case

  scope :for_angle, -> (angle) { where(angle: angle) }

  validates :algorithm, presence: true, uniqueness: {
    message: 'has already been used'
  }

  def similar_algorithms
    self.case.solutions.where.not(id: self.id)
  end
end
