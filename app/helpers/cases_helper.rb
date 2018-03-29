module CasesHelper
  def rotation_label(angle)
    if angle == '0'
      label = "No Rotation"
    else
      label = "#{angle}°"
    end
    label
  end
end
