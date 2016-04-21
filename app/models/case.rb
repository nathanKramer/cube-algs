class Case < ActiveRecord::Base
  scope :oll, -> { where(case_type: 'oll') }
  scope :pll, -> { where(case_type: 'pll') }
  scope :f2l, -> { where(case_type: 'f2l') }
  belongs_to :category, foreign_key: :name
  has_one :reflection
  has_many :algorithms
end
