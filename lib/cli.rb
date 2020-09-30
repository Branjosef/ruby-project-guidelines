class Cli

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
    system 'clear'
    image
    puts "Welcome to MB Banking Solutions"
    puts"'Banking solutions you can bank on!'"
    puts ""
    puts "Please select from the following:"
    puts "1 - Existing Customer"
    puts "2 - New Customer"
    #binding.pry
    user_input = gets.chomp
    if user_input == "1"
      existing_customer
    elsif user_input == "2"
      new_customer
    elsif user_input == "3"
        puts "Thank you and have a nice day!"
    elsif user_input == "admin"
        puts "Please enter password"
          admin_input = gets.chomp
        if admin_input == "password"
        admin
        else
          home
        end
    else
      puts "Sorry, that is an invalid option. Please try again!"
      puts "select 3 to quit"
      puts ""
      home
    end
  end

  def existing_customer   #DONE
    #spacer
    system 'clear'
    image
    puts "Welcome to MB Banking - Customer Login Portal"
    puts "'It's never too late to refi. Just ask us how!'"
    puts ""
    puts "Please enter your name"
    user_input = gets.chomp
    puts "Please enter your password"
    user_input1 = gets.chomp
    x = Customer.find_by(name: user_input)
    y = Customer.find_by(password: user_input1)
    #binding.pry
    if x ==y && x != nil
      existing_customer_homescreen(y)
    else
      puts "We're sorry. The email address and/or password you entered is incorrect"
      puts "Please try again"
      input = gets.chomp
      home
    end
  end


def existing_customer_homescreen(customer)
      system 'clear'
      image
      puts "Welcome back #{customer.name.capitalize}!" 
      puts "How may we assist you today?"
      puts ""
      puts "1 - Accounts"
      puts "2 - View your MB Banking 'Premier' profile"
      puts "3 - Logout"
      #binding.pry
      user_input = gets.chomp 
      if user_input.downcase == "1"
        customer_accounts(customer)
      elsif user_input.downcase == "2"
        puts "need mb banking profile"
      elsif user_input.downcase == "3"
        home
      else
        puts "invalid selection"
        existing_customer_homescreen
      end
    end

    def new_customer
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

      def customer_accounts(customer)
        system 'clear'
        image
        
        puts "#{customer.name.capitalize}'s Accounts"
        puts ""
        puts "Please choose from the following options:"
        puts ""
        puts "1 - create account"
        puts "2 - make deposit"
        puts "3 - make withdrawal"
        puts "4 - transfer funds"
        puts "5 - close account"
        puts "6 - log out"
        puts ""

        user_input = gets.chomp
        if user_input == "1"
          system 'clear'
          image
          puts ""
          puts "please select type of account 1-checking, 2-savings)"
           account_type = gets.chomp
            if account_type == "1"
                account_final = "checking"
                puts "You have chosen to start a checking account"
            elsif account_type == "2"
                account_final = "saving"
                puts "You have chosen to start a savings account"
            else
                "invalid input - please press any key to continue."
                x = gets.chomp
                customer_accounts(customer)
            end
            puts "how much do you wish to deposit?"
              init_balance = gets.chomp
              init_balance = init_balance.to_f
            puts "Please choose your financial Institution"
            puts "1 - Bank of America, 2 - Citibank, 3 - Washington Mutual"
            account_bank = gets.chomp
              if account_bank == "1"
                account_bank_final = "bank of america"
              elsif account_bank == "2"
                account_bank_final = "citibank"
              elsif account_bank == "3"
                account_bank_final = "washington mutual"
              else
                puts "invalid selection - press any key to continue"
                zzz = gets.chomp
                customer_accounts(customer)
              end
              #binding.pry
                cust_id = customer.find_id
                bank_id = Bank.find_id(account_bank_final)
                new_account = Account.new_account(account_final, init_balance, bank_id, cust_id)
                p new_account
                puts "account created successfully"
                puts "press any key to continue"
                zxz = gets.chomp
                customer_accounts(customer)
            end
          end





    def admin
      system 'clear'
      binding.pry
      user_input = gets.chomp
    end



end