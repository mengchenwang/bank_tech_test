require 'transaction'

describe Transaction do
  subject(:transaction) { Transaction.new }
  let(:account) { double(:account) }
  before do
    allow(account).to receive(:update_balance)
    allow(account).to receive(:update_transaction_record)
    allow(account).to receive(:balance).and_return(110)
  end

  describe '#deposit' do
    it 'calls account to update balance' do
      expect(account).to receive(:update_balance).with(100)
      transaction.deposit(account, 100)
    end

    it 'calls account to update transaction_record' do
      expect(account).to receive(:update_transaction_record).with(100, nil)
      transaction.deposit(account, 100)
    end

    it 'raises an error when the deposit amount equals or less than 0' do
      expect{transaction.deposit(account, 0)}.to raise_error("deposit amount has to be greater than 0")
    end
  end

  describe '#withdraw' do
    it 'calls account to update balance' do
      expect(account).to receive(:update_balance).with(-100)
      transaction.withdraw(account, 100)
    end

    it 'calls account to update transaction_record' do
      expect(account).to receive(:update_transaction_record).with(nil, 100)
      transaction.withdraw(account, 100)
    end

    it 'raises an error when the deposit amount equals or less than 0' do
      expect{transaction.withdraw(account, 0)}.to raise_error("withdrawal amount has to be greater than 0")
    end

    it 'raises an error when the withdrawal would leave a minus balance' do
      allow(account).to receive(:balance).and_return(99)
      expect{transaction.withdraw(account, 100)}.to raise_error("balance too low - please change your withdrawal amount")
    end
  end
end
