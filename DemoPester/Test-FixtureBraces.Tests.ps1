function Test-Pester {
    param($Number)
    
    if ($Number -eq '5')
    {
        Throw
    }
    else
    {
        Return $Number
    }
}


Describe 'Test-FixtureBraces' -Tags Test1 {
        
    It 'Same Line' {
        $Results = Test-Pester -Number '1'
        $Results | Should Be '1'
    }

    It 'New Line' 
    { 
        $Results = { Test-Pester -Number '1' }
        $Results | Should Not Throw
    }
}

Describe 'Test-FixtureBraces' -Tags Test2 
{ 
    It 'Same Line' {
        $Results = Test-Pester -Number '1'
        $Results | Should Be '1'
    }

    It 'New Line' 
    { 
        $Results = { Test-Pester -Number '1' }
        $Results | Should Not Throw
    }
}

