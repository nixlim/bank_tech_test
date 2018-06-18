require 'bank'

describe Bank do

  describe '#deposit' do
    it 'should respond to #deposit method' do
      expect(subject).to respond_to(:deposit)
    end

    it 'should take an amount to be deposited' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end
  end

  
end