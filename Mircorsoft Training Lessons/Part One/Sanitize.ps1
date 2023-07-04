# Flow control is how the code is being controlled. 3 things to manage flow control is sanitize, control execution flow anf iterate over data. 
#Sanitize input - ensure parameters holds reasonale values
#Control execution flow - decision on how to run code. these vlies can determine what group of statements to run
#Iterate over data - for example if your data takes the form of an array, you may need to examine each item to perform an opertion for each one

$Value = 3
if ($Value -le 0)
{
    Write-Host "Is Negative"
}
Else
{
    Write-Host "Is Positive"
}


#Using ElsIF to check for multiple conditions

$Status = 'Minor'
If ($Status -eq 'Minor')
{
    Write-Host $False
}
ElseIf($Status -eq 'Adult')
{
    Write-Host $True
}
Else
{
    Write-Host $False
}
