#Add Parameters to the file

Param(
    [string]$Path = './app',
    [string]$DestinationPath = './',
    [switch]$PathIsWebApp
    )
#The code block below checks if the pathiswebapp is provided at runtime. if it is, the code continues to execute and grab a list of file extensions within the path
If($PathIsWebApp -eq $True){
    Try
    {
        $ContainsApplicationFiles = "$((Get-ChildItem $Path).Extension | Sort-Object -Unique)" -match '\.js|\.html|\.css'

        If (-Not $ContainsApplicationFiles){
            Throw "Not a web app"
        }Else {
            Write-Host "Source files looks good, continuing"
        }
    }
    Catch {
        Throw "No backup created due to : $($_.Exception.Message)"
    }
}
#Checks if the source Path exists and if not then it returns the message
If(-Not (Test-Path $Path))
{
    Throw "The source directory $Path does not exist"
}s
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