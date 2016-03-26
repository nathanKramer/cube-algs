class Case < ActiveRecord::Base
  has_one :reflection
  has_many :algorithms
end