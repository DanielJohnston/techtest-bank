class Account
  attr_reader :balance
  attr_reader :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit amount, time=Time.new
    @balance += amount
    @transactions << {type: :credit, amount: amount, time: time}
  end

  def withdraw amount, time=Time.new
    @balance -= amount
    @transactions << {type: :debit, amount: amount, time: time}
  end

  def statement
    @printout = "date       || credit || debit   || balance"
    @transactions.reverse.reduce(@balance) { |running_balance, transaction|
      @printout << "\n"
      @printout << transaction[:time].strftime("%d/%m/%Y")
      @printout << " || "
      if transaction[:type] == :credit
        @printout << (transaction[:amount].to_s + ".00").ljust(7)
        @printout << "||         ||"
        @printout << running_balance.to_s.rjust(5) + ".00"
        running_balance -= transaction[:amount]
      elsif transaction[:type] == :debit
        @printout << "       || "
        @printout << (transaction[:amount].to_s + ".00").ljust(8)
        @printout << "||"
        @printout << running_balance.to_s.rjust(5) + ".00"
        running_balance += transaction[:amount]
      end
    }
    @printout
  end
end
