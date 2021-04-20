# teams-automation
This repo details a PowerShell script I created to automate adding members to a newly created Teams and reduce manual effort that can take 24+ hours to complete.

# PowerShell Script
## Purpose: Add Users to a Team on Microsoft Teams.
```
Import-CSV .\FileName.csv | ForEach-Object {Add-TeamUser -GroupId [GroupId] -User $($_.Email))
```

# How to Use
1. On Microsoft Teams, make sure you have been assigned "Owner" permissions for a Team.
2. For user information, export emails into a .csv file.
3. In that .csv file, make sure you specify the column you are trying to pull user information from. In this case, I am pulling from the "Email" column within "FileName.csv".
4. Make sure that the .csv file is in a working directory you can access.
5. Run PowerShell as an administrator.
6. Install Microsoft-Teams PowerShell module by following these steps: 
7. Once installation is complete, type in "Connect-MicrosoftTeams" and press enter.
8. You will be prompted for your credentials so enter your username and password.
9. Move to the working directory where your .csv file is.
10. Run the PowerShell script.
11. As the PowerShell script is running, go to the Team on Microsoft Teams, click on "...", click on "Manage Team", and look at the number of members. If the PowerShell script is successful, you will continue seeing the number of members increase until the script has worked through all of the user information you have provided in that .csv file.

Note: If there are any errors, they will appear in red text. For example, if your company has vendors that no longer work there and their email addresses are deactivated, you will typically see errors when attempting to add those people to a Team on Microsoft Teams.
