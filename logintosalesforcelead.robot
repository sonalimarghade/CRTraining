*** Settings ***
Resource          ../Resources/common.robot
Suite Setup       Setup Browser
Suite Teardown    End suite

*** Test Cases ***
Create a New Lead 
    [tags]        Lead                        Lead created Data
    Appstate      Home
    LaunchApp     Sales
    ClickText     Lead
    ClickText     New                         anchor=Import        # For behind of import for select new
    ClickText     New
    ClickText     Cloudfulcrum
    ClickText     Next
    PickList      Salutation                  Ms.
    TypeText      First Name                  Sonali
    TypeText      Last Name                   Marghade
    PickList      Lead Status                 Open
    PickList      Sales Owner                 Shalini
    TypeText      Company                     Cloudfulcrum
    ClickText     Save
    UseModal      Off
Update the existing Lead information
[tags]        Lead                        Lead created Data
    Appstate      Home
    LaunchApp     Sales
    ClickText     Lead
    VerifyText    Recently Viewed             timeout=120s      # for Update data
    ClickText     Sonali Marghade
    ClickText     Details                     anchor=Activity      # For behind of Activity for select detail
    ClickText     Edit Name
    PickList      Salutation                  Mr.
    TypeText      First Name                  Aman
    TypeText      Last Name                   Kale
    PickList      Lead Status                 Open
    PickList      Sales Owner                 Shalini
    TypeText      Company                     Cloudfulcrum
    ClickText     Save
    UseModal      Off
    
Delete Lead Data
    ClickText     Lead
    VerifyText    Recently Viewed
    ClickText     Aman Kale
    ClickText     Show more actions
    ClickText     Delete
    ClickText     Delete



