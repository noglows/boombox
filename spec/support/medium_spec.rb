RSpec.shared_examples "a medium" do
  describe "model validations" do
    it "must have a name" do
      medium = described_class.new

      expect(medium).to be_invalid
    end
  end
end
