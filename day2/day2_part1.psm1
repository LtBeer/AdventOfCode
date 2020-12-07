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

            $min = $line.Remove($line.IndexOf('-'))
            $max = [regex]::Match($line,"-(.*?) ").Groups[1].Value
            $letter =  [regex]::Match($line," (.*?):").Groups[1].Value
            $password = [regex]::Match($line,"(?<=: ).*$").Groups[0].Value

            $occurences = ([regex]::Matches($password, $letter)).count

            if (($occurences -ge $min) -and ($occurences -le $max)) {
                $count++
            }
        }
        Write-Host $count
    }

}