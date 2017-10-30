require 'account'

describe Account do
  subject(:batman) { Account.new }

  describe '#initialize' do
    it 'sets the balance to the Default openning balance' do
      expect(batman.balance).to eq described_class::DEFAULT_OPENNING_BALANCE
    end

    it 'sets the transaction record as an empty array' do
      expect(batman.transaction_record).to eq []
    end
  end

  describe '#update_balance' do
    it 'add 100 to the balance' do
      expect{batman.update_balance(100)}.to change{batman.balance}.by(100)
    end
  end

  describe '#update_transaction_record' do
    it 'add [date, 100, nil, 100] to the transaction record' do
      expect{batman.update_transaction_record(100, nil)}.to change{batman.transaction_record}.to([{date: Time.now.strftime("%d/%m/%Y"), credit: 100, debit: nil, balance: 0}])
    end
  end
end
