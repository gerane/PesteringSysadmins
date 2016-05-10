Function ParseMarkdown
{
    $MarkdownPath = "$PSScriptRoot\Resources.md"
    $Object = [ordered]@{}
    $Sections = @($Object)

    switch -regex -file $MarkdownPath
    {
        '^# .*' # Section
        {
            $Name = ($Matches[0] -replace '^# ','').Trim()
            $Section = [ordered]@{}
            $Count = $Sections.Count
            $Sections[$Count - 1][$Name] = $Section
        }
        '^## .*' # Topic
        {
            $Topic = ($Matches[0] -replace '^## ','').Trim()
            if (!$Section[$Topic]) { $Section[$Topic] = [ordered]@{} }
        }
        '^\* \[.*' # Entry
        {        
            $Entry = ($Matches[0] -replace '^\* ','').Trim()
            $Parse = $Entry -match '^.*\[(.*)\].*\((.*)\)$'
            $Description = $Matches[1]
            $uri = $Matches[2]
            $Section[$Topic] += @{ $Description = $uri }
        }
    }
    Return $Object
}

