require 'bank'

describe Bank do
  let(:transaction) { double(:transaction) }
  let(:enquiry) { double(:enquiry) }
  before do
    allow(transaction).to receive(:deposit)
    allow(transaction).to receive(:withdraw)
    allow(enquiry).to receive(:print_statement)
  end
  subject(:bank) { Bank.new(transaction, enquiry) }

  describe '#initialize' do
    it 'sets @transaction' do
      expect(bank.transaction).to eq(transaction)
    end

    it 'sets @enquiry' do
      expect(bank.enquiry).to eq(enquiry)
    end
  end

  describe '#deposit' do
    it 'calls the deposit method in @transaction' do
      expect(transaction).to receive(:deposit).with(1, 2)
      bank.deposit(1, 2)
    end
  end

  describe '#withdraw' do
    it 'calls the withdraw method in @transaction' do
      expect(transaction).to receive(:withdraw).with(1, 2)
      bank.withdraw(1, 2)
    end
  end

  describe '#print_statement' do
    it 'calls the print_statement method in @enquiry' do
      expect(enquiry).to receive(:print_statement).with(1)
      bank.print_statement(1)
    end
  end
end
