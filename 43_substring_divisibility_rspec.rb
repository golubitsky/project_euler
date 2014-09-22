require "./43_substring_divisibility"

describe "digit tests" do
      let(:n) {1406357289}
  describe "#digit_test_234" do
    it "divisible by 2" do
      expect digit_test_234(1406357289).to be true
    end
  end
  describe "#digit_test_345" do
    it "divisible by 3" do
      expect digit_test_345(1406357289).to be true
    end
  end
  describe "#digit_test_456" do
    it "divisible by 5" do
      expect digit_test_456(1406357289).to be_true
    end
  end
  describe "#digit_test_567" do
    it "divisible by 7" do
      expect digit_test_567(n).to be_true
    end
  end
  describe "#digit_test_678" do
    it "divisible by 11" do
      expect digit_test_678(n).to be_true
    end
  end
  describe "#digit_test_789" do
    it "divisible by 13" do
      expect digit_test_789(n).to be_true
    end
  end
  describe "#digit_test_8910" do
    it "divisible by 17" do
      expect digit_test_8910(n).to be_true
    end
  end
end
