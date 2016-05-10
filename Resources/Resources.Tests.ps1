Import-Module Pester

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace('.Tests.', '.')
. "$here\$sut"

$Markdown = ParseMarkdown
Function Test-ResourceLinks ($InputObject)
{
    Describe 'Testing Resources' {

        foreach ($Section in $InputObject.Keys)
        {        
            foreach ($Topic in $InputObject.$Section.Keys)
            {
                Context "Testing URLs in [$($Section) - $($Topic)]" { 
                
                    foreach ($Entry in $InputObject.$Section.$Topic.Keys)
                    {
                        $Description = $Entry
                        $Uri = $InputObject.$Section.$Topic.$Description

                        It "[$($Description)] should have a working Url" {
                            Write-Verbose -Message "Testing Uri [$($Uri)]"

                            $Results = Invoke-WebRequest -Uri $Uri -UseBasicParsing
                            $Results.StatusCode | Should Be '200'
                        }
                    }
                }
            }
        }
    }
}

Test-ResourceLinks -InputObject $Markdown