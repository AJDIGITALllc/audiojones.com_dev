# Start-AudioJones.ps1
# Bootstrap script to start all 4 Next.js apps with locked ports

Write-Host ">>> Stopping any processes on ports 3000-3003" -ForegroundColor Cyan
$ports = 3000..3003
foreach ($p in $ports) {
  $procIds = Get-NetTCPConnection -LocalPort $p -ErrorAction SilentlyContinue |
             Select-Object -ExpandProperty OwningProcess -Unique
  foreach ($procId in $procIds) {
    if ($procId) { Stop-Process -Id $procId -Force -ErrorAction SilentlyContinue }
  }
}

Write-Host ">>> Installing dependencies" -ForegroundColor Cyan
npm install

Write-Host ">>> Starting all apps (web=3000, admin=3001, clients=3002, courses=3003)" -ForegroundColor Green
npm run dev
