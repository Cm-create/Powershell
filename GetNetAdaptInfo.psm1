function Get-CorpNetAdapterInfo {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True)]
        [string[]]$ComputerName
    )
    
    foreach ($computer in $computername) {

        Write-Verbose "Connecting to $computer"
        $session = New-CimSession -ComputerName $computer

        $adapters = Get-NetAdapter -CimSession $session
        foreach ($adapter in $adapters) {
            
            $addresses = Get-NetIPAddress -InterfaceIndex ($adapter.InterfaceIndex) -CimSession $session
            foreach ($address in $addresses) {

                $properties = @{'ComputerName'=$computer;
                                'AdapterName'=$adapter.Name;
                                'InterfaceIndex'=$adapter.InterfaceIndex;
                                'IPAddress'=$address.IPAddress;
                                'AddressFamily'=$address.AddressFamily}
                $output = new-object -TypeName PSObject -Property $properties
                Write-Output $output

            } # addresses
        } # adapters

        Write-Verbose "Closing session to $computer"
        $session | Remove-CimSession

    } # computer

} # function