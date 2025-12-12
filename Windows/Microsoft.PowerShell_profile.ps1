oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/tonybaloney.omp.json' | Invoke-Expression 
Import-Module -Name Terminal-Icons
set-psreadlineoption -predictionviewstyle listview

#Alias
Set-Alias -Name touch -Value New-Item
Set-Alias -Name lsf -Value ls -Force
Set-Alias -Name reboot -Value Restart-Computer -Force
Set-Alias -Name zip -Value Compress-Archive
Set-Alias -Name unzip -value Expand-Archive
Set-Alias -Name ll -Value Get-ChildItem -Force

#Alias for Get-FileHash
# Set-Alias -Name get-md5 -Value Get-FileHash -ArgumentList -Algorithm MD5
# Set-Alias -Name get-sha256 -Value Get-FileHash -ArgumentList -Algorithm SHA256
# Set-Alias -Name get-sha512 -Value Get-FileHash -ArgumentList -Algorithm SHA512
# Set-Alias -Name get-sha1 -Value Get-FileHash -ArgumentList -Algorithm SHA1


# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for choco.
# Be aware that if you are missing these lines from your profile, tab completion
# for choco will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}