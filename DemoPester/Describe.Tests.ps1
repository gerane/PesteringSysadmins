


Describe -Name 'Describes group of Tests' -Fixture {

}

Describe  'Describes group of Tests'  {
    
}


Describe  'Describes group of Tests' -Tags Test1 {
    
}

Invoke-Pester -Tag Test1

Invoke-Pester -ExcludeTag Test1

