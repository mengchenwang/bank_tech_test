require_relative 'account'

class Statement

  HEADER = {date: "Date", credit: "Credit", debit: "Debit", balance: "Balance"}

  def print_statement(account)
    statement = (account.transaction_record << HEADER)
    statement.reverse.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || " +
           "#{transaction[:debit]} || #{transaction[:balance]}"
    end
  end
end
