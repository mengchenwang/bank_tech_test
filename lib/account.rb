class Account

  DEFAULT_OPENNING_BALANCE = 0

  attr_reader :balance, :transaction_record

  def initialize
    @balance = DEFAULT_OPENNING_BALANCE
    @transaction_record = []
  end

  def update_balance(amount)
    @balance += amount
  end

  def update_transaction_record(credit, debit)
    date = Time.now.strftime("%d/%m/%Y")
    @transaction_record << [date, credit, debit, @balance]
  end
end
