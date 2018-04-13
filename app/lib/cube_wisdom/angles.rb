module CubeWisdom
  module Angles
    def self.angles(order_of_rotational_symmetry)
      angles = ['0']
      angles.push '90' if order_of_rotational_symmetry >= 2
      angles.concat ['180', '270'] if order_of_rotational_symmetry == 4
      angles
    end

    def self.other_angles(angle)
      angles - [angle]
    end

    def self.relevant_auf_corrections(solution, order_of_rotational_symmetry)
      alg = solution.algorithm
      auf_corrections = []
      other_angles(solution.angle).each do |angle|
        auf_correction = angle_to_auf(angle)
        auf_corrections.append(merge(auf_correction, alg))
      end
      auf_corrections
    end

    def self.angle_to_auf(angle)
      case angle
      when '0'
        ''
      when '90'
        'U'
      when '180'
        'U2'
      when '270'
        "U'"
      end
    end
  end
end
