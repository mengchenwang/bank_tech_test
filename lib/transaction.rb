require_relative 'account'

class Transaction

  def deposit(account, amount)
    raise "deposit amount has to be greater than 0" if amount <= 0
    account.update_balance(amount)
    account.update_transaction_record(amount, nil)
  end

  def withdraw(account, amount)
    raise "withdrawal amount has to be greater than 0" if amount <= 0
    raise "balance too low - please change your withdrawal amount" if (account.balance - amount) <= 0
    account.update_balance(-amount)
    account.update_transaction_record(nil, amount)
  end
end
