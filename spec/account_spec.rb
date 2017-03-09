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

  describe '#statement' do
    title_row = "date       || credit || debit   || balance"
    it 'prints a title row' do
      expect(subject.statement).to eq title_row
    end
    # Blocked out, pending creation of prior code
    # it 'shows a single deposit with set date and balance' do
    #   desired_response = "date       || credit || debit   || balance"
    #   desired_response << "\n13/01/2012 || 2000.00||         || 3000.00"
    #   subject.deposit(2000)
    #   expect(subject.statement). to eq desired_response
    # end
    #
    # it 'shows a different deposit, date and balance' do
    #   desired_response = "date       || credit || debit   || balance"
    #   desired_response << "\n10/01/2012 || 1000.00||         || 1000.00"
    #   subject.deposit(1000)
    # end
  end
end
