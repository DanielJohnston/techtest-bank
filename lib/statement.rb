class Statement
  def print transactions, balance
    @running_balance = balance
    @printout = "date       || credit || debit   || balance"
    transactions.reverse.reduce(balance) { |running_balance, transaction|
      @printout << "\n"
      @printout << transaction.time.strftime("%d/%m/%Y")
      @printout << " || "
      if transaction.type == :credit
        @printout << ('%.2f' % transaction.amount).ljust(7)
        @printout << "||         || "
        @printout << ('%.2f' % running_balance).rjust(7)
        running_balance -= transaction.amount
      elsif transaction.type == :debit
        @printout << "       || "
        @printout << ('%.2f' % transaction.amount).ljust(8)
        @printout << "|| "
        @printout << ('%.2f' % running_balance).rjust(7)
        running_balance += transaction.amount
      end
    }
    @printout
  end
end
