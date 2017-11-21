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

  describe '#multiply' do
    
    it "should multiply 2 positive integers" do
      expect(calc.multiply(2,3)).to eq(6)
    end

    it "should multiply 2 positive floats" do
      expect(calc.multiply(1.5,2.25)).to be_within(0.01).of(3.375)
    end

    it "should multiply 1 negative" do
      expect(calc.multiply(-2,3)).to eq(-6)
    end

    it "should multiply 2 negatives" do
      expect(calc.multiply(-2,-3)).to eq(6)
    end

  end

  describe '#divide' do
    
    it "should divide 2 positive integers, with no remainder" do
      expect(calc.divide(6,2)).to eq(3)
    end

    it "should divide 2 positive integers with a remainder as a float" do
      expect(calc.divide(3,2)).to be_within(0.1).of(1.5)
    end

    it "should divide floats" do
      expect(calc.divide(6.5,2)).to be_within(0.01).of(3.25)
    end

    it "should divide negatives" do
      expect(calc.divide(-6,2)).to eq(-3)
    end

    it "should raise ArgumentError if dividing by zero" do
      expect{calc.divide(6,0)}.to raise_error(ArgumentError)
    end

  end

  describe '#pow' do
    
    it "should raise positive integers to their power" do
      expect(calc.pow(2,2)).to eq(4)
    end

    it "should raise positive floats to their power" do
      expect(calc.pow(2.5,2)).to be_within(0.01).of(6.25)
    end

    it "should handle negatives" do
      expect(calc.pow(-2,2)).to eq(4)
      expect(calc.pow(2,-2)).to be_within(0.01).of(0.25)
    end

  end

  describe '#sqrt' do
    
    it "should provide correct square root for positive integer" do
      expect(calc.sqrt(4))
      expect(calc.sqrt(9))
    end

    it "should raise ArgumentError with negative number" do
      expect{calc.sqrt(-4)}.to raise_error(ArgumentError)
    end

    it "should provide correct 2 decimal root for positive floats" do
      expect(calc.sqrt(4.5)).to be_within(0.01).of(2.12)
    end

  end
end