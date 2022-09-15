#Retrieves a Single ADUser 

Function Get-User {
    [cmdletbinding()]
    Param-(
         [Parameter(Mandatory=$True,
                    ValueFromPipeline=$True
                    ValuFromPipelineByPropertyName=$True)]
            [string]$identity
        )
        Get-ADUser $identity -identity
}

Get-ADUser -identity 'JohnDoe'
