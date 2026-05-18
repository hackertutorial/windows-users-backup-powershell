# ===== Nastavení =====
$DestRoot = "E:\Zalohy"
$User = $env:USERNAME
$Source = "C:\Users\$User"
$Dest = Join-Path $DestRoot "$User\AKTUALNI"

$Folders = @("Desktop","Documents","Pictures","Downloads")

# ===== Příprava =====
New-Item -ItemType Directory -Force -Path $Dest | Out-Null
$Log = Join-Path $Dest "backup.log"

# ===== Robocopy parametry =====
# /MIR = zrcadlo, /XJ = ignoruje junctiony, /Z = restart, /FFT = tolerantní čas
$RoboArgsBase = @("/MIR","/R:1","/W:1","/XJ","/FFT","/Z","/NP","/TEE")

"=== Backup start: $(Get-Date) ===" | Out-File -FilePath $Log -Encoding utf8

foreach ($f in $Folders) {
    $srcPath = Join-Path $Source $f
    $dstPath = Join-Path $Dest $f

    New-Item -ItemType Directory -Force -Path $dstPath | Out-Null

    $args = @($srcPath, $dstPath) + $RoboArgsBase + @("/LOG+:$Log")
    & robocopy @args | Out-Null
}

"=== Backup end: $(Get-Date) ===" | Out-File -FilePath $Log -Append -Encoding utf8
Write-Host "Hotovo. Log: $Log"
