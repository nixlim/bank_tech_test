require 'bank'

describe Bank do
  let(:subject){described_class.new(depositor_double)}
  let(:depositor_double) {spy :depositor_double}

  describe '#deposit' do
    it 'should respond to #deposit method' do
      expect(subject).to respond_to(:deposit)
    end

    it 'should take an amount to be deposited' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end

    it 'should call Depositor Class on deposit' do
      subject.deposit(10)
      expect(depositor_double).to have_received(:add).with(10)
    end
  end

  
end