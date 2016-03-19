class AddPaperclipWazatar < ActiveRecord::Migration
  def change
    add_attachment :wizards, :wazatar
  end
end
