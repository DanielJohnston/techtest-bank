class Account
  attr_reader :balance
  attr_reader :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit amount, time=Time.new
    @balance += amount
    @transactions << Transaction.new(type = :credit, amount = amount, time = time)
  end

  def withdraw amount, time=Time.new
    @balance -= amount
    @transactions << Transaction.new(type = :debit, amount = amount, time = time)
  end

  def print_statement
    Statement.new.print @transactions, @balance
  end
end
