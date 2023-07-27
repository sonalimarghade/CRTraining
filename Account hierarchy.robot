*** Settings ***

Resource               ../Resources/common.robot
Suite Setup            Setup Browser
Suite Teardown         End suite
*** Test Cases ***
Create Account data

    [Documentation]    Create Account
    [tags]             Account
    Appstate           Home
    LaunchApp          Sales
    ClickText          Accounts
    ClickText          New
    UseModal           On
    TypeText           Account Name                Manisha
    PickList           Sales Owner                 Shalini
    TypeText           Billing Street              Plot No.212 Hitech City
    TypeText           Billing City                Hyderabad
    TypeText           Billing State/Province      Telangana
    TypeText           Billing Zip/Postal Code     23135
    TypeText           Billing Country             India
    ClickText          Save                        partial_match=false
    UseModal           Off
    Sleep              1

Account hierarchy

    ClickText          Manisha
    ClickText          Details
    ClickText          Edit                        anchor=Change Owner
    UseModal           On
   #ClickText          Clear Selection
    ComboBox           Search Accounts...          Dipti1
    ClickText          Save                        partial_match=false
    UseModal           Off
    ClickText          View Account Hierarchy
    ClickText          Dipti1
    ClickText          Details
    ClickText          Edit                        anchor=Change Owner
    UseModal           On
    ComboBox           Search Accounts...          Madhavika
    ClickText          Save                        partial_match=false
    UseModal           Off
    ClickText          View Account Hierarchy


