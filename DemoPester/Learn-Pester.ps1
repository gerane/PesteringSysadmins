function Test-Pester 
{ 
    [CmdletBinding()]
    param
    (
        [String]
        [Parameter(Mandatory=$true)]
        $Logname,
    
        [string]
        [Parameter(Mandatory=$True)]
        $Source
    )
    
    Process
    {
        Try
        {            
            $Event = Get-EventLog @PSBoundParameters -ErrorAction Stop
        }
        Catch
        {
            Throw $Error[0]
        }
        Return $Event
    }

}
