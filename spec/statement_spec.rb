require 'statement'

describe Statement do
  describe '#print' do
    title_row = "date       || credit || debit   || balance"
    
    it 'prints a title row' do
      expect(subject.print([], 0)).to eq title_row
    end

    it 'prints a single deposit transaction' do
      transaction = [{type: :credit, amount: 1000, time: Time.new(2012, 1, 10)}]
      balance = 1000
      desired_response = "\n10/01/2012 || 1000.00||         || 1000.00"
      expect(subject.print(transaction, balance)).to eq title_row + desired_response
    end

    xit 'prints two deposit transactions' do
      desired_response = "\n13/01/2012 || 2000.00||         || 3000.00"
      desired_response << "\n10/01/2012 || 1000.00||         || 1000.00"
      subject.deposit(amount = 1000, time = Time.new(2012, 1, 10))
      subject.deposit(amount = 2000, time = Time.new(2012, 1, 13))
      expect(subject.print).to eq title_row + desired_response
    end

    xit 'prints a deposit and a withdrawal' do
      desired_response = "\n14/01/2012 ||        || 500.00  ||  500.00"
      desired_response << "\n10/01/2012 || 1000.00||         || 1000.00"
      subject.deposit(amount = 1000, time = Time.new(2012, 1, 10))
      subject.withdraw(amount = 500, time = Time.new(2012,1,14))
      expect(subject.print).to eq title_row + desired_response
    end
  end
end
