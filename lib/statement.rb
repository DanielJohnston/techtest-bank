class Statement
  def print transactions, balance
    @running_balance = balance
    @printout = "date       || credit || debit   || balance"
    transactions.reverse.reduce(balance) { |running_balance, transaction|
      @printout << "\n"
      @printout << transaction.time.strftime("%d/%m/%Y")
      @printout << " || "
      if transaction.type == :credit
        @printout << (transaction.amount.to_s + ".00").ljust(7)
        @printout << "||         ||"
        @printout << running_balance.to_s.rjust(5) + ".00"
        running_balance -= transaction.amount
      elsif transaction.type == :debit
        @printout << "       || "
        @printout << (transaction.amount.to_s + ".00").ljust(8)
        @printout << "||"
        @printout << running_balance.to_s.rjust(5) + ".00"
        running_balance += transaction.amount
      end
    }
    @printout
  end
end
