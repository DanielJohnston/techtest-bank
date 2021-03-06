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

    it "shows a balance of 10.5 after depositing 10.5" do
      subject.deposit(10.5)
      expect(subject.balance).to eq 10.5
    end
  end

  describe '#withdraw' do
    it 'responds to withdraw' do
      subject.deposit(10)
      expect{ subject.withdraw(10) }.not_to raise_error
    end
  end

  describe '#transactions' do
    xit 'retrieves the latest transaction' do

    end
  end

  describe '#print_statement' do
    xit 'passes the transaction history and balance to Statement.print' do
    end
  end
end
