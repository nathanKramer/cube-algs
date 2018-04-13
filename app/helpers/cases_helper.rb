module CasesHelper
  def rotation_string(angle)
    if angle == 0
      label = "no rotation"
    else
      label = "#{angle}°"
    end
    label
  end

  def case_image(case_record, angle: nil, html_class: nil)
    angle_class = rotation_class(angle) if angle
    html_class = [html_class, angle_class].compact.join(' ').presence
    link_to image_tag(case_record.diagram, class: html_class), case_path(case_record)
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
