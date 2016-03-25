require 'rails_helper'

RSpec.describe Algorithm, type: :model do
  describe '#name' do
    it "can't be nil" do
      algorithm = Algorithm.new(name: nil)
      algorithm.validate
      expect(algorithm.errors[:name]).to be_present
    end

    it "can't be empty" do
      algorithm = Algorithm.new(name: '')
      algorithm.validate
      expect(algorithm.errors[:name]).to be_present
    end

    it "can be an ordinary name" do
      algorithm = Algorithm.new(name: 'Joe')
      algorithm.validate
      expect(algorithm.errors[:name]).not_to be_present
    end

    it "has to be a unique name" do
      Algorithm.create(name: 'Gandalf')
      algorithm = Algorithm.new(name: 'Gandalf')
      algorithm.validate
      expect(algorithm.errors[:name]).to be_present
    end
  end
end
