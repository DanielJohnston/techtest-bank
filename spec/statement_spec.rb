require 'statement'

describe Statement do
  describe '#print' do
    title_row = "date       || credit || debit   || balance"
    # deposit_1000 = double(type: :credit, amount: 1000, time: Time.new(2012, 1, 10))
    # deposit_2000 = double(type: :credit, amount: 2000, time: Time.new(2012, 1, 13))
    # withdraw_500 = double(type: :debit, amount: 500, time: Time.new(2012, 1, 14))

    it 'prints a title row' do
      expect(subject.print([], 0)).to eq title_row
    end

    it 'prints a single deposit transaction' do
      deposit_1000 = double(type: :credit, amount: 1000, time: Time.new(2012, 1, 10))
      transactions = double(:reverse => [deposit_1000])
      balance = 1000
      desired_response = "\n10/01/2012 || 1000.00||         || 1000.00"
      expect(subject.print(transactions, balance)).to eq title_row + desired_response
    end

    it 'prints two deposit transactions' do
      deposit_1000 = double(type: :credit, amount: 1000, time: Time.new(2012, 1, 10))
      deposit_2000 = double(type: :credit, amount: 2000, time: Time.new(2012, 1, 13))
      transactions = [deposit_1000, deposit_2000]
      balance = 3000
      desired_response = "\n13/01/2012 || 2000.00||         || 3000.00"
      desired_response << "\n10/01/2012 || 1000.00||         || 1000.00"
      expect(subject.print(transactions, balance)).to eq title_row + desired_response
    end

    it 'prints a deposit and a withdrawal' do
      deposit_1000 = double(type: :credit, amount: 1000, time: Time.new(2012, 1, 10))
      withdraw_500 = double(type: :debit, amount: 500, time: Time.new(2012, 1, 14))
      transactions = [deposit_1000, withdraw_500]
      balance = 500
      desired_response = "\n14/01/2012 ||        || 500.00  ||  500.00"
      desired_response << "\n10/01/2012 || 1000.00||         || 1000.00"
      expect(subject.print(transactions, balance)).to eq title_row + desired_response
    end
  end
end
