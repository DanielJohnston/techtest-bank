require 'account'

describe Account do
  it 'starts with a balance of zero' do
    expect(subject.balance).to eq 0
  end
end
