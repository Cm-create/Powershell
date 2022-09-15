#Retrieves a Single ADUser and Unlocks Their Account

Function Disable-User {
    [cmdletbinding()]
    Param-(
         [Parameter(Mandatory=$True,
                    ValueFromPipeline=$True
                    ValuFromPipelineByPropertyName=$True)]
            [string]$identity
        )
        Get-ADUser $identity -identity
}

Get-ADUser -identity 'JohnDoe' | Unlock-ADAccount

