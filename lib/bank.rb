require_relative 'transaction'
require_relative 'enquiry'

class Bank

  attr_reader :transaction, :enquiry

  def initialize(transaction = Transaction.new,
                 enquiry = Enquiry.new)
    @transaction = transaction
    @enquiry = enquiry
  end

  def deposit(account, amount)
    @transaction.deposit(account, amount)
  end

  def withdraw(account, amount)
    @transaction.withdraw(account, amount)
  end

  def print_statement(account)
    @enquiry.print_statement(account)
  end
end
