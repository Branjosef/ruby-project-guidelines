
# Name: MB BANKING   CLI APP

# Description: 
* MB Banking is a full banking solution for managing bank accounts by allowing MB users to create and review new banking information,  make deposits and withdrawals, and close bank accounts with their respective banking institutions on file. The command line interface was designed to be intuitive using 'natural language' prompts to faciliate navigation through all aspect of the program.

* The application is pre-seeded with a list of Banks MB Banking has contracts with to provide third-party financial account management and solutions.

* This app was developed as Flatiron School’s mod1 group project to demonstrate the knowledge of Active Record Associations, as well as CRUD methods, Ruby OOP, and SQL database management.



## Relationships:

BANK --< ACCOUNT >-- CUSTOMER


##  User Stories:
* Banks can have many Accounts
* Banks can have many Customers through Accounts 
* Customers can have many Banks through Accounts
* Customers can have many Accounts
* Account belongs to one Bank
* Account belongs to one Customer


## CRUD Functionality:

## CREATE:
* New customers can create a new MB Banking 'Premier' customer profile
* Existing customers can create new bank accounts through MB Banking with their financial institutions


## READ::
* Existing customers can view their MB Banking 'Premier' customer profile
* Existing customers can view their bank accounts that have been established via MB Banking

## UPDATE
* Existing customers can update MB Banking 'Premier' customer profile attributes such as username, email address, and password
* Existing customers can make financial transactions such as deposits and withdrawals against their bank accounts

## DELETE:
* Existing customers can close their MB Banking 'Premier' customer profile
* Existing customers can close a bank account 



## Made by: Brandon Fonnemann, Marius Moldovan