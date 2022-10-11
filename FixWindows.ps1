#Disable hotkey for toggle keyboard layour
reg add "HKCU\Keyboard Layout\toggle" /v "Layout Hotkey" /t REG_SZ /d 3 /f

#Show classic right click menu in exporer
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
