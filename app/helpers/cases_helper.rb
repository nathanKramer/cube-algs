module CasesHelper
  def rotation_string(angle)
    if angle == 0
      label = "no rotation"
    else
      label = "#{angle}°"
    end
    label
  end

  def label_for_algorithm(algorithm)
    label = algorithm.algorithm
    if algorithm.case
      label = "Solution for #{algorithm.case.to_s}, (#{rotation_string(algorithm.angle)})" if algorithm.angle
    end
  end

  def rotation_class(angle)
    "angle_#{angle}"
  end
end
