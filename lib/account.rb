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
    printout = "date       || credit || debit   || balance"
    @transactions.reverse_each do |transaction|
      printout << "\n"
      printout << transaction[:time].strftime("%d/%m/%Y")
      printout << " ||"
      printout << transaction[:amount].to_s.rjust(5) + ".00"
      printout << "||         ||"
      printout << @balance.to_s.rjust(5) + ".00"
    end
    # printout << "\n13/01/2012 || 2000.00||         || 3000.00"
    printout
  end
end
