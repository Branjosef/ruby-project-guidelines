class Cli
  require 'tty-prompt'

  def image
    puts <<-LOGO   
                                                                                            
    ███╗   ███╗██████╗     ██████╗  █████╗ ███╗   ██╗██╗  ██╗██╗███╗   ██╗ ██████╗ 
    ████╗ ████║██╔══██╗    ██╔══██╗██╔══██╗████╗  ██║██║ ██╔╝██║████╗  ██║██╔════╝ 
    ██╔████╔██║██████╔╝    ██████╔╝███████║██╔██╗ ██║█████╔╝ ██║██╔██╗ ██║██║  ███╗
    ██║╚██╔╝██║██╔══██╗    ██╔══██╗██╔══██║██║╚██╗██║██╔═██╗ ██║██║╚██╗██║██║   ██║
    ██║ ╚═╝ ██║██████╔╝    ██████╔╝██║  ██║██║ ╚████║██║  ██╗██║██║ ╚████║╚██████╔╝
    ╚═╝     ╚═╝╚═════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
    LOGO
    puts ""
    puts ""
  end

  def home   #DONE
    prompt = TTY::Prompt.new
    system 'clear'
    image
    puts "Welcome to MB Banking Solutions"
    puts"'Banking solutions you can bank on!'"
    puts ""
    action = prompt.select("Please select from the following?", %w(Existing_Customer New_Customer Admin))
    case action
      when "Existing_Customer"
        existing_customer
      when "New_Customer"
        new_customer
      when "Admin"
        admin
      end
    end
      
 
   def existing_customer   #DONE
    prompt1 = TTY::Prompt.new
    prompt2 = TTY::Prompt.new
    system 'clear'
    image
    puts "Welcome to MB Banking - Customer Login Portal"
    puts "'It's never too late to refi. Just ask us how!'"
    puts ""
    name = prompt1.ask("Please enter your name:")
    password = prompt2.mask("Please enter your password:")
    x = Customer.find_by(name: name)
    y = Customer.find_by(password: password)
    if x ==y && x != nil
      existing_customer_homescreen(y)
    else
      puts "We're sorry. The email address and/or password you entered is incorrect"
      puts "Please try again"
      z = gets.chomp
      home
    end
  end

  def existing_customer_homescreen(customer)  #DONE
    prompt = TTY::Prompt.new
    system 'clear'
    image
    puts "Welcome back #{customer.name.capitalize}!"
    action = prompt.select("How may we assist you today our most valuable customer?", %w(Accounts View_Your_MB_Banking_Premier_Profile Logout))
    case action
    when "Accounts"
      customer_accounts(customer)
    when "View_Your_MB_Banking_Premier_Profile"
      mb_account(customer)
    when "Logout"
      return "Logout Complete."
    end
  end


  def customer_accounts(customer)
    prompt = TTY::Prompt.new
    system 'clear'
    image
    puts ""
    puts "#{customer.name.capitalize}'s Accounts"
    puts ""
    customer.accounts
    action = prompt.select("Please choose from the following options:", %w(Create_Account Transactions Back_To_Homepage Close_Account Logout))
    case action
    when "Create_Account"
      create_account(customer)
    when "Transactions"
      transact(customer)
    when "Back_To_Homepage"
      existing_customer_homescreen(customer)
    when "Close_Account"
      puts "need close method"
    when "Logout"
      return "logged out"
    end
  end

  def transact(customer)
    prompt = TTY::Prompt.new
    prompt1 = TTY::Prompt.new
    prompt2 = TTY::Prompt.new
    system 'clear'
    image
    puts ""
    puts "#{customer.name.capitalize}'s Accounts"
    puts ""
    customer.accounts
    action = prompt.select("Please select transaction type:", %w(Deposit Withdrawal Return_to_Homepage))
    case action
    when "Deposit"
      account_id = prompt.ask("Please enter account id:")
      deposit = prompt2.ask("How much are you depositing?")
      account_id = account_id.to_i
      deposit = deposit.to_i
      account = Account.find_by(id: account_id)
      account.update(balance: (account.balance + deposit))
      transact(customer)
    when "Withdrawal"
      account_id = prompt.ask("Please enter account id:")
      withdrawal = prompt2.ask("How much do you wish withdraw?")
      account_id = account_id.to_i
      withdrawal = withdrawal.to_i
      account = Account.find_by(id: account_id)
      account.update(balance: (account.balance - withdrawal)) if account.balance > withdrawal
      transact(customer)
    when "Return_to_Homepage"
      customer_accounts(customer)
    end
  end

  def create_account(customer) #DONE
    prompt1 = TTY::Prompt.new
    prompt2 = TTY::Prompt.new
    prompt3 = TTY::Prompt.new
    system 'clear'
    image
    puts ""
    account = prompt1.select("What type of account do you want to open?", %w(Checking Savings))
    deposit = prompt2.ask("Deposit Amount?")
    bank = prompt3.select("Please select your financial institution:", %w(Bank_of_America Capital_One Citibank Washington_Mutual Wells_Fargo ))
    deposit = deposit.to_f
    bank1 = bank.split("_")
    bank1.map
    bank = bank1.join(' ')
    cust_id = customer.find_id
    bank_id = Bank.find_id(bank.downcase)
    account1 = account.downcase
    new_account = Account.new_account(account1, deposit, bank_id, cust_id)
    p new_account
    puts "account created successfully"
    puts "press any key to return to your Accounts"
    zxz = gets.chomp
    customer_accounts(customer)
  end

  def mb_account(customer) #DONE
    prompt = TTY::Prompt.new
    system 'clear'
    image
    puts ""
    puts "Welcome to your Premier Account Profile. You are our most valuable customer"
    puts ""
    p Customer.find(customer.id)
    puts ""
     action = prompt.select("Please select attribute to update or choose action:", %w(name email password close_account return_to_homepage))
    case action
      when "name"
        puts "please enter updated attribute"
        x = gets.chomp
        y = x.downcase
        customer.update(name: y)
          z = Customer.find(customer.id)
         mb_account(z)
      when "email"
        puts "please enter updated attribute"
        x = gets.chomp
        y = x.downcase
        customer.update(email: y)
          z = Customer.find(customer.id)
         mb_account(z)
      when "password"
        puts "please enter updated attribute"
        x = gets.chomp
        y = x.downcase
        customer.update(password: y)
          z = Customer.find(customer.id)
         mb_account(z)
      when "close_account"
        close_mb_account(customer)
      when "return_to_homepage"
        existing_customer_homescreen(customer)
      end
  end
 
 def close_mb_account(customer) #DONE
    prompt = TTY::Prompt.new
    system 'clear'
    image
    puts ""
    puts "You are our most valued customer and we would hate to see you go"
    puts ""
    action = prompt.select("Please confirm request to close MB 'Premier' account:", %w(yes no))
    case action 
    when "yes"
        customer.delete_customer
        puts "You're account has been deleted. You are dead to us!!!! Please press any key to continue"
        z = gets.chomp
        home
    when "no"
        puts "Thank you for reconsidering. Please press any key to continue"
        z = gets.chomp
        existing_customer_homescreen(customer)
    end
 end

 def new_customer #DONE
  system 'clear'
  image
  puts "Welcome to MB Banking - New Customer Portal"
  puts "Please enter in your name (click 'c' to cancel)"
  name = gets.chomp
    if name.downcase == "c"
      home
    else
      puts "Please enter in your email address"
      email = gets.chomp
      puts "Please enter in a password"
      password = gets.chomp
      x = Customer.new_customer(name, email, password)
      puts "Welcome to MB Banking. Please press any key to continue"
      p x
      user = gets.chomp
      existing_customer_homescreen(x)
    end
end


  def admin 
    system 'clear'
    x = Customer.find_by(name: "riley")
    binding.pry
    user_input = gets.chomp
  end


end