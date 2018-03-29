class Case < ActiveRecord::Base
  scope :oll, -> { where(case_type: 'oll') }
  scope :pll, -> { where(case_type: 'pll') }
  scope :f2l, -> { where(case_type: 'f2l') }
  belongs_to :category, foreign_key: :name
  has_one :reflection
  has_many :algorithms

  def angles
    angles = ['0']
    angles.push '90' if self.order_of_rotational_symmetry >= 2
    angles.concat ['180', '270'] if self.order_of_rotational_symmetry == 4
    angles
  end
end
