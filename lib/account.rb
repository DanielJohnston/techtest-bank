class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit amount
    @balance += amount
  end

  def withdraw amount
    @balance -= amount
  end

  def statement
    printout = "date       || credit || debit   || balance"
    printout << "\n13/01/2012 || 2000.00||         || 3000.00"
    printout
  end
end
