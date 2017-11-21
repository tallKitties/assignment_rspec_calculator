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
end