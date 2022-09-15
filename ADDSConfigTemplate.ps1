Import-Module ActiveDirectory

New-ADDomain `
-DomainName "contoso.com" `
-DomainMode "Win2012R2" `
-ForestMode "Win2012R2" `
-DatabasePath "C:\Windows\NTDS" `
-LogPath "C:\Windows\NTDS" `
-SYSVOLPath "C:\Windows\SYSVOL" `
-NoRebootOnCompletion:$false

Restart-Computer