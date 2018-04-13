require 'rails_helper'

RSpec.describe Solution, type: :model do
  describe '#algorithm' do
    it "can't be nil" do
      solution = Solution.new(algorithm: nil)
      solution.validate
      expect(solution.errors[:algorithm]).to be_present
    end

    it "can't be empty" do
      solution = Solution.new(algorithm: '')
      solution.validate
      expect(solution.errors[:algorithm]).to be_present
    end

    it 'can be an ordinary algorithm' do
      solution = Solution.new(algorithm: "R U R'")
      solution.validate
      expect(solution.errors[:algorithm]).not_to be_present
    end

    it 'has to be a unique algorithm' do
      Solution.create(algorithm: "R U R'")
      solution = Solution.new(algorithm: "R U R'")
      solution.validate
      expect(solution.errors[:algorithm]).to be_present
    end
  end
end
