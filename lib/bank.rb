require_relative 'transaction'
require_relative 'statement'

class Bank
  def initialize(transaction = Transaction.new,
                 statement = Statement.new)
    @transaction = transaction
    @statement = statement
  end

  def deposit(account, amopunt)
    @transaction.deposit(account, amopunt)
  end

  def withdraw(account, amopunt)
    @transaction.withdraw(account, amopunt)
  end

  def statement(account)
    @statement.print_statement(account)
  end
end
