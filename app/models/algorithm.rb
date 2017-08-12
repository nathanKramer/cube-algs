class Algorithm < ActiveRecord::Base
  belongs_to :case

  validates :algorithm, presence: true, uniqueness: {
    message: 'has already been used'
  }
end
