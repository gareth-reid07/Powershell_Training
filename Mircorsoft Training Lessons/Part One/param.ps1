# using if/else statement to check value of path
Param(
    $Path
)
If (-Not $Path -eq ''){
    New-Item $Path #CREATES A NEW FILE AT $Path.
    Write-Host "File $Path was created"
}
else {
    Write-Error "Path cannot be empty"
}


