class Case < ActiveRecord::Base
  scope :oll, -> { where(case_type: 'oll') }
  scope :pll, -> { where(case_type: 'pll') }
  scope :f2l, -> { where(case_type: 'f2l') }
  belongs_to :category, foreign_key: :name
  has_one :reflection
  has_many :algorithms

  def angles
    @angles ||= CubeWisdom.angles(order_of_rotational_symmetry)
  end

  def solutions(angle: nil)
    return algorithms if angle.nil?
    solutions_for_angle(angle)
  end

  def to_s
    name = "##{self.id}"
    name += " #{self.nickname}" if self.nickname

    name
  end

  private

  def solutions_for_angle(angle)
    obvious_solutions = algorithms.for_angle(angle)
    solutions_with_auf = []
    obvious_solutions.each do |solution|
      solutions_with_auf += [CubeWisdom.relevant_aufs(solution, order_of_rotational_symmetry)]
    end

  end
end
