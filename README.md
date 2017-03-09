# techtest-bank
Tech test from Makers Academy - modelling bank transactions and account status

### Requirements

* You should be able to interact with the your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012

**And** a deposit of 2000 on 13-01-2012

**And** a withdrawal of 500 on 14-01-2012

**When** she prints her bank statement

**Then** she would see

```
date       || credit || debit   || balance
14/01/2012 ||        || 500.00  || 2500.00
13/01/2012 || 2000.00||         || 3000.00
10/01/2012 || 1000.00||         || 1000.00
```

### Installation and technology

The project uses Ruby and RSpec. To use the software:

* Download the repo to a machine with Ruby and bundle installed
* Run `bundle` to install required gems
* Run `rspec` to run tests
* Instructions on running the app forthcoming

### Development approach

The code was written using a TDD approach via RSpec and Capybara. On a conceptual level, the objects and actions should eventually consist of something along the lines of:

```
Account - the bank account, contains an Account_transactions object
* new (Account_transactions.new)
* create account_transaction record
* balance
* statement
```

```
Account_transactions - collection of transactions for a single account
* new (Transaction.new, Time.now)
* transaction - read-only
* time_of_entry - read-only
```

```
Transaction - a single transaction, stored in an Account_transactions object
* new (transaction_type, value, Time.new)
* transaction_type - read-only
* transaction_amount - read-only
* transaction_time - read-only
```

Printing a statement is a method on Account. Testing its ability to format and return information appropriate to the request _where the calls to get the information have been mocked out_ is a unit test. However, I've created a feature test for the full operation of the statement method in RSpec/Capybara, as this is the primary acceptance / feature test across any classes that are implemented. Capybara's web features are not used as the target interface is a REPL.

In addition to the core specs, I've put together a number of tasks to clean up the code and make it more usable in a wider context:

- [x] Refactor statement printing into its own class
- [x] Add ability to handle pennies as well as pounds
- [x] Refactor transactions into their own class
- [ ] Create an app.rb file that launches a REPL to act as the user interface
- [ ] Improve accuracy of penny and fractional penny handling, ideally using the Money gem
- [ ] Refactor the list of transactions for an account into its own class
- [ ] Add statement formatting to handle £10,000 or greater
- [ ] Log the date a transaction is entered into the system, as a security measure
