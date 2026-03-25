$paths = @(
    "HKCU:\Software\Classes\Directory\shell\OpenInGemini"
    "HKCU:\Software\Classes\Directory\Background\shell\OpenInGemini"
)
foreach ($p in $paths) {
    $commandPath = "$p\command"
    $desiredCommand = 'cmd.exe /k "cd /d "%V" && gemini"'
    $existingCommand = (Get-ItemProperty -Path $commandPath -Name "(Default)" -ErrorAction SilentlyContinue)."(Default)"
    if ($existingCommand -eq $desiredCommand) { continue }
    New-Item -Path $commandPath -Force | Out-Null
    Set-ItemProperty -Path $p -Name "(Default)" -Value "Open in Gemini"
    Set-ItemProperty -Path $commandPath -Name "(Default)" -Value $desiredCommand
}
Write-Host "Open in Gemini added to the context menu." -ForegroundColor Green
