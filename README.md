# teams-automation
This repo details a PowerShell script I created to automate adding members to a newly created Teams and reduce manual effort that can take 24+ hours to complete.

# PowerShell Script
Function: Add Users to a Team on Microsoft Teams.
```
Import-CSV .\FileName.csv | ForEach-Object {Add-TeamUser -GroupId [GroupId] -User $($_.Email))
```

# How to Use

## Prerequisites
* Excel Spreadsheet of Emails
* Teams Channel Link
* Teams PowerShell Module
* Teams PowerShell Reference Documents

## Excel Spreadsheet Preparation
Choose one of two options.

Path A: 
1. Assuming the Excel spreadsheet contains an "Email" column, select and copy the entire "Email" column.
2. Open a new Microsoft Excel spreadsheet and paste the "Email" column into the "A" column.
3. Now, go ahead and save the spreadsheet as "[FileName]" in csv format.
4. Make sure the .csv file is in a working directory you can reach.

Path B: 
1. Assuming the Excel spreadsheet contains an "Email" column, save the .xlsx file with as a .csv file in a working directory you can reach.

## Microsoft Teams Preparation
1. Go to the Team on Microsoft Teams.
2. In the left pane where all Teams are listed, select the "..." to the right of the Team.
3. A pop-up menu should show up. When the pop-menu is visible, select "Manage Team".
4. Check to see if you have administrator privileges by checking to see if you have been assigned "Owner" permissions for the Team.
5. Click the "..." again and select "Get link to channel" from the pop-up menu.
6. Copy the link to channel and keep it somewhere for your reference later.
   Teams Channel Link: [paste here]
   Teams Tenant ID (aka Group Id): [paste here]

## PowerShell
1. Open PowerShell by running the program as administrator.
2. [Install the Teams PowerShell module](https://docs.microsoft.com/en-us/MicosoftTeams/teams-powershell-install#install-the-teams-powershell-module):
```
Install-Module MicrosoftTeams
```
3. Once installation is complete, [connect to Microsoft Teams](https://docs.microsoft.com/en-us/MicrosoftTeams/teams-powershell-install#sign-in):
```
Connect-MicrosoftTeams
```
4. If you have previously installed the Teams PowerShell module, make sure to update the module before attempting to use it:
```
Update-Module MicrosoftTeams
```
5. Move to the working directory where your .csv file is:
```
Set-Location -Path
```
6. Run the PowerShell script:
```
Import-CSV .\FileName.csv | ForEach-Object {Add-TeamUser -GroupId [GroupId] -User $($_.Email)}
```
7. As the PowerShell script is running, go to the Team on Microsoft Teams, click on "...", click on "Manage Team", and look at the number of members. If the PowerShell script is successful, then you will continue to see the number of members increase until the script has worked through all of the provided emails from your .csv file.

## Common Errors
Note: If there are any errors, then those errors will appear in red text.

Error #1: ResourceNotFound
```
Add-TeamUser : Error occurred while executing
Code: Request_ResourceNotFound
Message: Resource '[email]' does not exist or one of its queried reference-property objects are not present.
```
Rationale: You may receive this error because the user you are trying to add by email has had their account deactivated. For example, if your company has employees, contractors, vendors, or interns that no longer work there, their email addresses will be deactivated and you will typically see the ResourceNotFound error when attempting to add those users to a Team on Microsoft Teams.
