Param(
    [Parameter(Mandatory, HelpMessage = "Please provide a valid path")]
    [string]$Path
)
New-Item $Path
write-Host "File created at path"
