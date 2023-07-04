#Add Parameters to the file

Param(
    [string]$Path = './app',
    [string]$DestinationPath = './',
)
#Checks if the source Path exists and if not then it returns the message
If(-Not (Test-Path $Path))
{
    Throw "The source directory $Path does not exist"
}
$date = Get-Date -format "yyyy-MM-dd"
$DestinationFile = "$($DestinationPath + 'backup-' + $date + '.zip')"
If (-Not (Test-Path $DestinationFile))
{
    Compress-Archive -Path $Path -CompressionLevel 'Fastest' -DestinationPath "$($DestinationPath + 'backup-' + $date)"
    Write-Host "Created backup at $($DestinationPath +'backup-' + '$date' + '.zip')"
}
Else
{
    Write-Error "Today's backup already exists"
}

# The script invokes Compress-Archive and uses the parameters:
# -Path is the directory of the files you want to compress
# -CompresionLevel specifies how much to comopress the files
# -DestinationPath is the path to the resulting compressed file