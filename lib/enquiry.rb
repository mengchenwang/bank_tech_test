require_relative 'account'

class Enquiry

  STATEMENT_HEADER = {date: "Date", credit: "Credit", debit: "Debit", balance: "Balance"}

  def print_statement(account)
    statement = (account.transaction_record << STATEMENT_HEADER)
    statement.reverse.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || " +
           "#{transaction[:debit]} || #{transaction[:balance]}"
    end
  end
end
