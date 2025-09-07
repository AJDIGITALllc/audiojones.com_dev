param([int[]]$Ports=@(3000,3001,3002,3003))
Write-Host ">>> Stopping anything on $($Ports -join ', ')"
foreach($p in $Ports){
  Get-NetTCPConnection -LocalPort $p -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty OwningProcess -Unique |
    ForEach-Object { if($_){ Stop-Process -Id $_ -Force -ErrorAction SilentlyContinue } }
}
