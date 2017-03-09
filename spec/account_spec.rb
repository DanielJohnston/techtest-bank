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

  describe '#statement' do
    it 'shows a single transaction with set date and balance' do
      desired_response = "date       || credit || debit   || balance"
      desired_response << "\n13/01/2012 || 2000.00||         || 3000.00"
      subject.deposit(10)
      expect(subject.statement). to eq desired_response
    end
  end
end
