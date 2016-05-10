Remove-Module [P]ester
Import-Module Pester

$MarkdownPath = "$PSScriptRoot\Resources\Resources.md"
$Markdown = Get-Content -Path $MarkdownPath
$Lines = $Markdown | Select-String -Pattern '^\* \[.*' -AllMatches
$Links = @()
foreach ($Line in $Lines)
{
    $Null= $Line -match '^.*\((.*)\).*$'
    $Links += $Matches[1]
}

Describe "Testing Resources" {
    
    Context "Links are working" {
        
        foreach ($Link in $Links)
        {
            It "[$($Link)] should have 200 Status Code" {

                $Results = Invoke-WebRequest -Uri $Link -UseBasicParsing
                $Results.StatusCode | Should Be '200'
            }
        }
    }
}

