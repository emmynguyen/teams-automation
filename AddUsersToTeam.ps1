Import-CSV .\FileName.csv | ForEach-Object {Add-TeamUser -GroupId [GroupId] -User $($_.Email)}
