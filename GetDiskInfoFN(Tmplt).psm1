function Get-CorpDiskInfo {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string[]]$computername
    )
    PROCESS {
        foreach ($computer in $computername) {

            $disks = get-ciminstance -computername $computername -classname win32_logicaldisk -filter "drivetype=3"
            foreach ($disk in $disks) { 
                $properties =@{'computername'=$computer;
                               'driveletter'=$disk.deviceid;
                               'freespace'=$disk.freespace;
                               'size'=$disk.size;}
                $output= New-Object -TypeName psobject -property $properties
                write-output $output

            }#disk
         }#computers
     }#process
}#function

