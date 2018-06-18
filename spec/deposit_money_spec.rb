require 'deposit_money'

describe DepositMoney do
  let(:ledger_instance_double) { spy :ledger_double, balance: 10 }
  let(:date) { Time.new.strftime("%d/%m/%Y %H:%M") }

  describe '#add' do
    it 'should take an amount as an argument' do
      expect(subject).to respond_to(:add).with(2).arguments
    end
    it 'should credit the Ledger Class' do
      subject.add(10, ledger_instance_double)
      expect(ledger_instance_double).to have_received(:credit).with(10, date)
    end
  end


end