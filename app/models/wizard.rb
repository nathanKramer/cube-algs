class Wizard < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_attached_file :wazatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :wazatar, content_type: /\Aimage\/.*\Z/
end
