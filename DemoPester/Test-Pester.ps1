function Test-Pester
{
    [CmdletBinding()]
    Param
    (
        [parameter(Mandatory=$true)]
        [string]$LogName,

        [Parameter(Mandatory = $true)]
        [string]$Source
    )

    Process
    {
        try
        {
            $Event = Get-EventLog @PSBoundParameters -ErrorAction Stop -Newest 1
        }
        catch
        {
            Throw
        }

        Return $Event
    }
}