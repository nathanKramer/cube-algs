require 'rails_helper'

RSpec.describe Algorithm, type: :model do
  describe '#algorithm' do
    it "can't be nil" do
      algorithm = Algorithm.new(algorithm: nil)
      algorithm.validate
      expect(algorithm.errors[:algorithm]).to be_present
    end

    it "can't be empty" do
      algorithm = Algorithm.new(algorithm: '')
      algorithm.validate
      expect(algorithm.errors[:algorithm]).to be_present
    end

    it 'can be an ordinary algorithm' do
      algorithm = Algorithm.new(algorithm: "R U R'")
      algorithm.validate
      expect(algorithm.errors[:algorithm]).not_to be_present
    end

    it 'has to be a unique algorithm' do
      Algorithm.create(algorithm: "R U R'")
      algorithm = Algorithm.new(algorithm: "R U R'")
      algorithm.validate
      expect(algorithm.errors[:algorithm]).to be_present
    end
  end
end
