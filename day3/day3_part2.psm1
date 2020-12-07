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
        # Right 1, down 1
        foreach($line in [System.IO.File]::ReadLines($File)) {
            $PatternLength = $line.Length

            if (($line.Substring($Locator - 1,1) -match "#")) {
                $TreeCount++
            }

            $Locator = $Locator + 1

                if ($Locator -gt $PatternLength) {
                    $Locator = $Locator - $PatternLength
                }
            }

        $RunningCount = $TreeCount
        $TreeCount = 0
        $Locator = 1

        # Right 3, down 1
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

        $RunningCount = $RunningCount * $TreeCount
        $TreeCount = 0
        $Locator = 1

        # Right 5, down 1
        foreach($line in [System.IO.File]::ReadLines($File)) {
            $PatternLength = $line.Length

            if (($line.Substring($Locator - 1,1) -match "#")) {
                $TreeCount++
            }

            $Locator = $Locator + 5

                if ($Locator -gt $PatternLength) {
                    $Locator = $Locator - $PatternLength
                }
            }

        $RunningCount = $RunningCount * $TreeCount
        $TreeCount = 0
        $Locator = 1

        # Right 7, down 1
        foreach($line in [System.IO.File]::ReadLines($File)) {
            $PatternLength = $line.Length

            if (($line.Substring($Locator - 1,1) -match "#")) {
                $TreeCount++
            }

            $Locator = $Locator + 7

                if ($Locator -gt $PatternLength) {
                    $Locator = $Locator - $PatternLength
                }
            }

        $RunningCount = $RunningCount * $TreeCount
        $TreeCount = 0
        $Locator = 1

        # Right 1, down 2
        $linecount = 1
        foreach($line in [System.IO.File]::ReadLines($File)) {
            $PatternLength = $line.Length

            if ($linecount % 2 -eq 0) {
                $linecount++
                continue
            }

            if (($line.Substring($Locator - 1,1) -match "#")) {
                $TreeCount++
            }

            $Locator = $Locator + 1

                if ($Locator -gt $PatternLength) {
                    $Locator = $Locator - $PatternLength
                }
            $linecount++
            }

            $RunningCount = $RunningCount * $TreeCount
            $TreeCount = 0
            $Locator = 1

            Write-Host "Running count: $RunningCount"


    }
}