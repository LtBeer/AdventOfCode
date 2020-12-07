Set-StrictMode -Version Latest -ErrorAction Stop
function Get-Trees {

    [CmdletBinding()]
    [OutputType([void])]
    param(
        [Parameter(Mandatory = $true)]
        [Alias('InputFile')]
        [string]
        $File
    )

    begin {
        $TreeCount = 0
        $Locator = 1
    }

    process {
        foreach($line in [System.IO.File]::ReadLines($File)) {
        $PatternLength = $line.Length

        if (($line.Substring($Locator - 1,1) -match "#")) {
            $TreeCount++
        }

        $Locator = $Locator + 3

            if ($Locator -gt $PatternLength) {
                $Locator = $Locator - $PatternLength
            }
        }
        Write-Host $TreeCount
    }
}