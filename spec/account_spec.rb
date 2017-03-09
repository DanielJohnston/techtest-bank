require 'account'

describe Account do
  describe '#balance' do
    it 'starts with a balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'responds to deposit' do
      expect{ subject.deposit(10)}.not_to raise_error
    end

    it "shows a balance of 10 after depositing 10" do
      subject.deposit(10)
      expect(subject.balance).to eq 10
    end
  end

  describe '#withdraw' do
    it 'responds to withdraw' do
      subject.deposit(10)
      expect{ subject.withdraw(10) }.not_to raise_error
    end
  end

  # This is prior code for the #statement method
  describe '#transactions' do
    it 'retrieves a deposit amount, time and type' do
      time = Time.new
      subject.deposit(amount = 10, time = time)
      expect(subject.transactions.last).to include({ type: :credit, amount: 10, time: time })
    end

    it 'retrieves a withdrawal amount, time and type' do
      subject.deposit(amount = 10, time = Time.new)
      time = Time.new
      subject.withdraw(amount = 10, time = time)
      expect(subject.transactions.last).to include({ type: :debit, amount: 10, time: time })
    end
  end

  # Extracting across to Statement
  # describe '#statement' do
  #   title_row = "date       || credit || debit   || balance"
  #   it 'prints a title row' do
  #     expect(subject.statement).to eq title_row
  #   end
  #
  #   it 'prints a single deposit transaction' do
  #     time = Time.new(2012,1,10)
  #     desired_response = "\n10/01/2012 || 1000.00||         || 1000.00"
  #     subject.deposit(amount = 1000, time = time)
  #     expect(subject.statement).to eq title_row + desired_response
  #   end
  #
  #   it 'prints two deposit transactions' do
  #     desired_response = "\n13/01/2012 || 2000.00||         || 3000.00"
  #     desired_response << "\n10/01/2012 || 1000.00||         || 1000.00"
  #     subject.deposit(amount = 1000, time = Time.new(2012, 1, 10))
  #     subject.deposit(amount = 2000, time = Time.new(2012, 1, 13))
  #     expect(subject.statement).to eq title_row + desired_response
  #   end
  #
  #   it 'prints a deposit and a withdrawal' do
  #     desired_response = "\n14/01/2012 ||        || 500.00  ||  500.00"
  #     desired_response << "\n10/01/2012 || 1000.00||         || 1000.00"
  #     subject.deposit(amount = 1000, time = Time.new(2012, 1, 10))
  #     subject.withdraw(amount = 500, time = Time.new(2012,1,14))
  #     expect(subject.statement).to eq title_row + desired_response
  #   end
  # end
end
