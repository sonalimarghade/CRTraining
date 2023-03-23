*** Settings ***
Resource                        ../Resources/common.robot
Suite Setup                     Setup Browser
Suite Teardown                  End suite


*** Test Cases ***
Entering A Account
    [tags]                      Account                     Account Testing
    Appstate                    Home
    LaunchApp                   Sales

    ClickText                   Accounts
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   New                         anchor=Import
    UseModal                    On                          # Only find fields from open modal dialog

    TypeText                    Account Name                Account 1
    Picklist                    Sales Owner                 Shalini
    TypeText                    Phone                       +123456789123
    TypeText                    Website                     https://www.growmore.com/
    TypeText                    Billing Street              Cyber Tower
    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    ClickText                   Details                     anchor=Chatter
    VerifyText                  Account 1
    VerifyText                  Sales Owner                 anchor=Owner
    # VerifyText                  Phone                       +123456789123
    #VerifyField                Company                     Growmore
    #VerifyField                Website                     https://www.growmore.com/


Repeat above test case by filling only "shipping address"
    [tags]                      Account                     Account Testing
    Appstate                    Home
    LaunchApp                   Sales

    ClickText                   Accounts
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   New                         anchor=Import
    UseModal                    On                          # Only find fields from open modal dialog

    TypeText                    Account Name                Account 1
    Picklist                    Sales Owner                 Shalini
    TypeText                    Phone                       +123456789123
    TypeText                    Website                     https://www.growmore.com/
    TypeText                    Shipping Street             Cyber Tower

    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    ClickText                   Details                     anchor=Chatter
    VerifyText                  Account 1
    VerifyText                  Sales Owner                 anchor=Owner
    # VerifyField                 Phone                       +123456789123
Repeat above test case by filling different addresses in "Billing address" and "Shipping address".
    [tags]                      Account                     Account Testing
    Appstate                    Home
    LaunchApp                   Sales

    ClickText                   Accounts
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   New                         anchor=Import
    UseModal                    On                          # Only find fields from open modal dialog

    TypeText                    Account Name                Account 1
    Picklist                    Sales Owner                 Shalini
    TypeText                    Phone                       +123456789123
    TypeText                    Website                     https://www.growmore.com/
    TypeText                    Billing Street              Durgamcheru Road
    TypeText                    Shipping Street             Cyber Tower

    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    ClickText                   Details                     anchor=Chatter
    VerifyText                  Account 1
    VerifyText                  Sales Owner                 anchor=Owner
    # VerifyField                 Phone                       +123456789123

As an User, I should be able to Update existing account and update infromation about customers or indiviuals that we do bussiness with.
    [tags]                      Account                     Account 1
    Appstate                    Home
    LaunchApp                   Sales

    ClickText                   Accounts
    ClickText                   Account 1
    ClickText                   Details                     anchor=Related
    ClickText                   Edit                        anchor=Follow
    TypeText                    Account Name                Account 1


    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    ClickText                   Details                     anchor=Chatter
    VerifyText                  Account 1
    VerifyText                  Sales Owner                 anchor=Owner
    VerifyField                 Phone                       +123456789123
Change owner of the account
    GoTo                        http://test.salesforce.com
    TypeText                    Username                    vishnu.r@cloudfulcrum.com.testingpoc
    TypeSecret                  Password                    Qazwsx123
    ClickText                   Log In to Sandbox

    ClickText                   Home
    ClickText                   Sales
    ClickText                   Contacts
    ClickText                   New                         anchor=Import
    VerifyText                  Contact Information

    UseModal                    On                          # Only find fields from open modal dialog
    PickList                    Salutation                  Ms.
    TypeText                    First Name                  Sonali
    TypeText                    Last Name                   Marghade
    ComboBox                    Search Accounts...          Account 1
    TypeText                    Phone                       +123456789123
    TypeText                    Email                       sonali.m@gmail.com

    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    ClickText                   Details                     anchor=Related
    VerifyText                  Ms. Sonali Marghade
    VerifyText                  +123456789123
    VerifyText                  Account 1
    ClickText                   Contact

    ClickText                   New                         anchor=Import
    VerifyText                  Contact Information
    UseModal                    On                          # Only find fields from open modal dialog

    PickList                    Salutation                  Mr.
    TypeText                    First Name                  Akash
    TypeText                    Last Name                   K
    ComboBox                    Search Accounts...           Account 1
    TypeText                    Phone                       +122345678923
    TypeText                    Email                       akash.k@gmail.com

    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    VerifyText                  Mr. Akash K                 anchor=Contact
    ClickText                   Details                     anchor=Related
    ClickText                   Contact
    ClickText                   Account                     anchor=Files

    ClickText                   New                         anchor=Import
    VerifyText                  Account Information
    UseModal                    On                          # Only find fields from open modal dialog

    TypeText                    Account Name                ChangeOwner Account
    Picklist                    Sales Owner                 Shalini
    TypeText                    Phone                       +122345678927
    PickList                    Industry                    Banking

    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    ClickText                   Details                     anchor=Related
    VerifyText                  ChangeOwner Account
    VerifyText                  +122345678927
    ClickText                   Change Owner
    UseModal                    On
    ClickText                   Vishnu Teja
    ClickText                   Submit
    UseModal                    Off
    Sleep                       2
    VerifyText                  Vishnu Teja

Account Sharing 
    GoTo                        http://test.salesforce.com
    TypeText                    Username                    vishnu.r@cloudfulcrum.com.testingpoc
    TypeSecret                  Password                    Qazwsx123
    ClickText                   Log In to Sandbox
    ClickText                   Home
    ClickText                   Accounts
    ClickText                   ChangeOwner Account
    ClickText                   Details
    ClickText                   Show more actions
    ClickText                   Sharing
    ClickText                   User                        anchor= Search
    ClickText                   Navneeth Rokalla
    ClickText                   Save
    UseModal                    Off


Import Account

    GoTo                        http://test.salesforce.com
    TypeText                    Username                    vishnu.r@cloudfulcrum.com.testingpoc
    TypeSecret                  Password                    Qazwsx123
    ClickText                   Log In to Sandbox
    ClickText                   Home
    ClickText                   Account
    ClickText                   Import                      anchor=New
    ClickText                   Accounts and Contacts
    ClickText                   Add new records
    ClickText                   CSV                         anchor=File
    ClickText                   Choose File
    ClickText                   log
    ClickText                   Book1
    ClickText                   Open
    ClickText                   Next
    ClickText                   Next
    ClickText                   Start Import                anchor=Previous
    ClickText                   Ok
Delete existing account
    [tags]                      Lead                        Account Testing
    LaunchApp                   Sales
    ClickText                   Accounts
    VerifyText                  Recently Viewed             timeout=120s

    Wait Until Keyword Succeeds                             1 min                       5 sec        ClickText         Test Account 1
    ClickText                   Show more actions
    ClickText                   Delete
    ClickText                   Delete
    ClickText                   Close
