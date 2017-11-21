require "calculator"

describe Calculator do
  let(:calc){Calculator.new}

  describe '#initialize' do

    it 'should give you a calculator' do
      expect(calc).to be_a(Calculator)
    end

    it 'shouldn\'t have anything in memory' do
      expect(calc.memory).to be_nil
    end
  end

  describe '#add' do

    it "should add 2 positive integers" do
      expect(calc.add(1,2)).to eq(3)
    end

    it "should add 2 positive floats" do
      expect(calc.add(1.5,2)).to eq(3.5)
    end

    it "should handle negatives correctly" do
      expect(calc.add(1,-2)).to eq(-1)
      expect(calc.add(-1,2)).to eq(1)
      expect(calc.add(1.5,-2.3)).to be_within(0.1).of(-0.8)
    end
  end

  describe '#subtract' do
    
    it "should subtract 2 positive integers" do
      expect(calc.subtract(2,1)).to eq(1)
    end

    it "should subtract 2 positive floats" do
      expect(calc.subtract(2.5,1.3)).to be_within(0.1).of(1.2)
    end

    it "should handle negatives correctly" do
      expect(calc.subtract(-1,-2)).to eq(1)
      expect(calc.add(-1.5,-2.3)).to be_within(0.1).of(-3.8)
    end
  end
end