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


Describe "Test-Braces" -Tags Test1 {
    
    It "No Curly Braces" {
        
        $Results = Test-Pester -Number '1'
        $Results | Should Be $true
    }

    It "Curly Braces" {
        
        $Results = { Test-Pester -Number '1' }
        $Results | Should Be $True
    }

}

Describe "Test-Braces" -Tags Test2 {
    
    It "No Curly Braces" {
        
        $Results = Test-Pester -Number '1'
        $Results | Should Be $Null
    }

    It "Curly Braces" {
        
        $Results = { Test-Pester -Number '1' }
        $Results | Should Be $Null
    }
}

Describe "Test-Braces" -Tags Test3 {
    
    It "No Curly Braces" {
        
        $Results = Test-Pester -Number '1'
        $Results | Should Be $True
    }

    It "Curly Braces" {
        
        $Results = { Test-Pester -Number '1' }
        $Results | Should Not Throw
    }
}

Describe "Test-Braces" -Tags Test4 {
    
    It "No Curly Braces - Errors" {
        
        $Results = Test-Pester -Number '5'
        $Results | Should Be $null
    }

    It "Curly Braces" {
        
        $Results = { Test-Pester -Number '5' }
        $Results | Should Throw
    }
}

