Set-StrictMode -Version Latest -ErrorAction Stop

function Get-ValidPasswords {

    [CmdletBinding()]
    [OutputType([void])]
    param(
        [Parameter(Mandatory = $true)]
        [Alias('InputFile')]
        [string]
        $File
    )

    begin {
        $count = 0
    }

    process {

        foreach($line in [System.IO.File]::ReadLines($File)) {

            $firstPos = $line.Remove($line.IndexOf('-'))
            $secondPos = [regex]::Match($line,"-(.*?) ").Groups[1].Value
            $letter =  [regex]::Match($line," (.*?):").Groups[1].Value
            $password = [regex]::Match($line,"(?<=: ).*$").Groups[0].Value

            if (($password.Substring($firstPos - 1,1) -match $letter) -and ($password.Substring($secondPos - 1,1) -notmatch $letter)) {
                $count++
            }
            elseif (($password.Substring($firstPos - 1,1) -notmatch $letter) -and ($password.Substring($secondPos - 1,1) -match $letter)) {
                $count++
            }

        }
        Write-Host $count
    }

}