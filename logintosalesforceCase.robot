*** Settings ***
Resource          ../Resources/common.robot
Suite Setup       Setup Browser
Suite Teardown    End suite

*** Test Cases ***
Create a New Case 
    [tags]        Case                        Git Repo Exercise
    Appstate      Home
    ClickText     More
    ClickText     Case
    ClickText     New
    UseModal      On
    ComboBox      Search Contacts...          Sonali Marghade              # Combobox for lookup field
    ComboBox      Search Accounts...          Test Account
    PickList      Status                      New
    PickList      Case Origin                 Phone
    PickList      Type                        Problem
    PickList      Case Reason                 New problem
    ClickText     Save
create case for on hold
    ClickText     Case
    ClickText     New
    ComboBox      Search Contacts...          Sonali Marghade              # Combobox for lookup field
    ComboBox      Search Accounts...          Test Account
    PickList      Status                      On Hold
    PickList      Case Origin                 Phone
    PickList      Type                        Problem
    PickList      Case Reason                 New problem
    ClickText     Save

create case(Escalated)
    ClickText     New
    ComboBox      Search Contacts...          Sonali Marghade      # Combobox for lookup field 
    ComboBox      Search Accounts...          Test Account
    PickList      Status                      Escalated
    PickList      Case Origin                 Phone
    PickList      Type                        Problem
    PickList      Case Reason                 New problem
    ClickText     Save

create case(Escalated except case origin)
    ClickText     New
    ComboBox      Search Contacts...          Akash K      # Combobox for lookup field 
    ComboBox      Search Accounts...          Test Account
    PickList      Status                      Escalated
    PickList      Case Origin                 Phone
    PickList      Type                        Problem
    PickList      Case Reason                 New problem
    PickList      Priority                    Medium
    PickList      Type                        Problem
    ClickText     Save
    ClickText     Cancel
   
Update the existing Lead information
    ClickText     Case
    VerifyText    Recently Viewed
    ClickText     00001046
    ClickText     Details
    ClickText     Edit Priority 
    PickList      Priority                    High
    PickList      Type                        Problem
    ClickText     Save


deleting case
    ClickText     Case
    ClickText     00001046
    ClickText     Show more actions 
    ClickText     Delete
    ClickText     Delete
    ClickText     Closed
