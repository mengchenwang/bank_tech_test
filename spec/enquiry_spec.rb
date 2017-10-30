require 'enquiry'

describe Enquiry do
  subject(:enquiry) { Enquiry.new }
  let(:account) { double(:account) }
  before do
    allow(account).to receive(:transaction_record).and_return([{date: "10/10/2017", credit: nil, debit: 100, balance: 100}])
  end

  describe '#print_statement' do
    it 'prints the correct format' do
      formated_statement = "Date || Credit || Debit || Balance\n" +
                           "10/10/2017 ||  || 100 || 100\n"
      expect{enquiry.print_statement(account)}.to output(formated_statement).to_stdout
    end
  end
end
