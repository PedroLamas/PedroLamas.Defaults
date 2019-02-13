# Setup tasks:
#
#    Set-ExecutionPolicy RemoteSigned
#

# Windows settings
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess -DisableOpenFileExplorerToQuickAccess

# Explorer: Show Cortana icon on Taskbar
If (-Not (Test-Path 'HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Search')) {
    New-Item -Path 'HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Search' | Out-Null
}
Set-ItemProperty -Path 'HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'SearchboxTaskbarMode' -Type DWord -Value 1

# Explorer: Turn off People in Taskbar
If (-Not (Test-Path 'HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People')) {
    New-Item -Path 'HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People' | Out-Null
}
Set-ItemProperty -Path 'HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People' -Name 'PeopleBand' -Type DWord -Value 0

# Privacy: Disable apps from use my advertising ID
If (-Not (Test-Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo')) {
    New-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo' | Out-Null
}
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Enabled' -Type DWord -Value 0

# Add PT and ET secondary clocks
If (-Not (Test-Path 'HKCU:\Control Panel\TimeDate')) {
    New-Item -Path 'HKCU:\Control Panel\TimeDate' | Out-Null
}
If (-Not (Test-Path 'HKCU:\Control Panel\TimeDate\AdditionalClocks')) {
    New-Item -Path 'HKCU:\Control Panel\TimeDate\AdditionalClocks' | Out-Null
}
If (-Not (Test-Path 'HKCU:\Control Panel\TimeDate\AdditionalClocks\1')) {
    New-Item -Path 'HKCU:\Control Panel\TimeDate\AdditionalClocks\1' | Out-Null
}
If (-Not (Test-Path 'HKCU:\Control Panel\TimeDate\AdditionalClocks\2')) {
    New-Item -Path 'HKCU:\Control Panel\TimeDate\AdditionalClocks\2' | Out-Null
}
Set-ItemProperty -Path 'HKCU:\Control Panel\TimeDate\AdditionalClocks\1' -Name 'DisplayName' -Type String -Value 'ET'
Set-ItemProperty -Path 'HKCU:\Control Panel\TimeDate\AdditionalClocks\1' -Name 'Enable' -Type DWord -Value 1
Set-ItemProperty -Path 'HKCU:\Control Panel\TimeDate\AdditionalClocks\1' -Name 'TzRegKeyName' -Type String -Value 'Eastern Standard Time'
Set-ItemProperty -Path 'HKCU:\Control Panel\TimeDate\AdditionalClocks\2' -Name 'DisplayName' -Type String -Value 'PT'
Set-ItemProperty -Path 'HKCU:\Control Panel\TimeDate\AdditionalClocks\2' -Name 'Enable' -Type DWord -Value 1
Set-ItemProperty -Path 'HKCU:\Control Panel\TimeDate\AdditionalClocks\2' -Name 'TzRegKeyName' -Type String -Value 'Pacific Standard Time'

# Remove March of Empires
Get-AppxPackage *MarchofEmpires* | Remove-AppxPackage

# Remove BubbleWitch
Get-AppxPackage *BubbleWitch* | Remove-AppxPackage

# Remove Candy Crush
Get-AppxPackage king.com.CandyCrush* | Remove-AppxPackage

# Remove Minecraft
Get-AppxPackage *Minecraft* | Remove-AppxPackage

# Windows features
choco install Microsoft-Hyper-V-All -source windowsFeatures
choco install Microsoft-Windows-Subsystem-Linux -source windowsFeatures

# Windows apps
choco install 7zip
choco install putty.install
choco install totalcommander
choco install adobereader
choco install paint.net
choco install googlechrome
choco install dropbox
choco install vscode
choco install git --package-parameters "/NoShellIntegration"
choco install git-credential-winstore
choco install github
choco install poshgit
choco install jre8
choco install fiddler4
choco install k-litecodecpackfull
choco install gpg4win
choco install visualstudio2017enterprise --package-parameters "--add Microsoft.VisualStudio.Workload.Universal --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Component.GitHub.VisualStudio --locale en-US"
choco install gitextensions
choco install resharper
choco install dotpeek
