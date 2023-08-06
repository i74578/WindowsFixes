####Global settings
#Disable hotkey for toggle keyboard layour
reg add "HKCU\Keyboard Layout\toggle" /v "Layout Hotkey" /t REG_SZ /d 3 /f

#Show classic right click menu in exporer
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

####FAROESE SETTINGS
#Adds faroese to the top on the language list and adds the correct keyboard layout
$OldList = Get-WinUserLanguageList
$OldList.Insert(0,'fo')
$OldList[0].InputMethodTips.Clear()
$OldList[0].InputMethodTips.add('0438:00000438')
Set-WinUserLanguageList -LanguageList $OldList -Force

#Sets the language list to only faroese and adds the correct keyboard layout
Set-WinHomeLocation -GeoId 81
$lanList = New-WinUserLanguageList fo
$lanList[0].InputMethodTips.Clear()
$lanList[0].InputMethodTips.add('0438:00000438')
Set-WinUserLanguageList -LanguageList $lanList -Force

#Copy new region/language settings and apply to welcome screen and new users
Copy-UserInternationalSettingsToSystem -WelcomeScreen $True -NewUser $True

#Sets the region formatting to faroese

#Sets the "Country or region"(Windows and apps might use your country or region to give you local content) to faroese

#Remove web search from start menu. Prevent accidental web search
if( -not (Test-Path -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer)){
  New-Item HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer
}
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name "DisableSearchBoxSuggestions" -Value 1 -Type DWORD
