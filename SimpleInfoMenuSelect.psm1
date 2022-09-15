$continue = $True
While ($continue) {
    Write-Host "1. Display disk information"
    Write-Host "2. Display OS information"
    Write-Host "3. Power off a computer"
    Write-Host "X. Exit the menu"

    $choice = Read-Host "Enter your choice"

    Write-Host "Enter one computer name per line, press Enter on an empty line to continue." -ForegroundColor Green

    Switch ($choice) {
        1 { Get-CorpDiskInfo }
        2 { Get-AdatumOSInfo }
        3 { Set-AdatumComputerState -State PowerOff }
        'X' { $continue = $false }
        default { Write-Host "Unknown choice" -ForegroundColor red
        }

    }
}