require 'rails_helper'

RSpec.describe Wizard, type: :model do
  describe '#name' do
    it "can't be nil" do
      wizard = Wizard.new(name: nil)
      wizard.validate
      expect(wizard.errors[:name]).to be_present
    end

    it "can't be empty" do
      wizard = Wizard.new(name: '')
      wizard.validate
      expect(wizard.errors[:name]).to be_present
    end

    it "can be an ordinary name" do
      wizard = Wizard.new(name: 'Joe')
      wizard.validate
      expect(wizard.errors[:name]).not_to be_present
    end

    it "has to be a unique name" do
      Wizard.create(name: 'Gandalf')
      wizard = Wizard.new(name: 'Gandalf')
      wizard.validate
      expect(wizard.errors[:name]).to be_present
    end
  end
end
