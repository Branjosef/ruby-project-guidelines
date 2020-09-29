require_relative '../config/environment'
require 'colorize'


#puts "HELLO WORLD"

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


def home
  puts "Welcome to MB Banking Solutions"
  puts "Please select from the following:"
  puts "1 - Existing Customer"
  puts "2 - New Customer"
  user_input = gets.chomp
  if user_input == "1"
    existing_customer
  elsif user_input == "2"
    new_customer
  elsif user_input == "3"
      puts "Thank you and have a nice day!"
  else
    puts "Sorry, that is an invalid option. Please try again!"
    puts "select 3 to quit"
    puts ""
    home
  end
end


def existing_customer
 puts "Welcome valued customer. Please select from the following options"
       puts  "1 - accounts overview"
       puts  "2 - deposit and withdrawal"
       puts "3 - mb banking account profile"
       puts "4 - logout"

       user_input = gets
       puts ""
end

def new_customer
  puts "new customer"
      create mb banking account
end


image
home