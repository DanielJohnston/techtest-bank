require 'transaction'

describe Transaction do
  describe '#new' do
    it 'accepts type, amount and time' do
      expect{ Transaction.new(type = :some_type, amount = :some_amount, time = :some_time) }.not_to raise_error
    end

    it 'can be created without sending a definite time' do
      expect{ Transaction.new(type = :some_type, amount = :some_amount) }.not_to raise_error
    end
  end

  describe '#type' do
    it 'returns the type passed in' do
      expect(Transaction.new(type = :some_type, amount = :some_amount).type).to eq :some_type
    end
  end

  describe '#amount' do
    it 'returns the amount passed in' do
      expect(Transaction.new(type = :some_type, amount = :some_amount).amount).to eq :some_amount
    end
  end

  describe '#time' do
    it 'returns the time passed in' do
      expect(Transaction.new(type = :some_type, amount = :some_amount, time = :some_time).time).to eq :some_time
    end
  end
end
