[CmdletBinding()]
Param(
    [Parameter(Mandatory=$True)]
    [string]$ComputerName,

    [Parameter(Mandatory=$True)]
    [string]$ReportFilename
)

$frag1 = Get-AdatumOSInfo -ComputerName $ComputerName |
            ConvertTo-HTML -Fragment -As List -PreContent "<h2>Basic Info</h2>" |
            Out-String

$frag2 = Get-CorpNetAdapterInfo -ComputerName $ComputerName |
            ConvertTo-HTML -Fragment -As Table -PreContent "<h2>Network Adapters</h2>" |
            Out-String