$paths = @(
    "HKCU:\Software\Classes\Directory\shell\OpenInGemini"
    "HKCU:\Software\Classes\Directory\Background\shell\OpenInGemini"
)
foreach ($p in $paths) {
    if (Test-Path $p) {
        Remove-Item -Path $p -Recurse -Force
    }
}
Write-Host "Open in Gemini removed from the context menu." -ForegroundColor Green
