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
    # printout << "\n13/01/2012 || 2000.00||         || 3000.00"
    printout
  end
end
