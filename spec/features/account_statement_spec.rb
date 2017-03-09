feature 'account statement' do
  scenario 'shows a statement for multiple deposits and withdrawals' do
    desired_response =  "date       || credit || debit   || balance"
    desired_response << "\n14/01/2012 ||        || 500.00  || 2500.00"
    desired_response << "\n13/01/2012 || 2000.00||         || 3000.00"
    desired_response << "\n10/01/2012 || 1000.00||         || 1000.00"
    account = Account.new
    account.deposit(amount = 1000, time = Time.new(2012, 1, 10))
    account.deposit(amount = 2000, time = Time.new(2012, 1, 13))
    account.withdraw(amount = 500, time = Time.new(2012, 1, 14))
    expect(account.statement).to eq desired_response
  end
end
