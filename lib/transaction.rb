class Transaction
  attr_reader :type, :amount, :time
  def initialize type, amount, time = Time.now
    @type = type
    @amount = amount
    @time = time
  end
end
