param(
  [ValidateSet("preview","prod")]
  [string]$target = "preview"
)

$apps = "web","clients","admin","courses"
foreach ($a in $apps) {
  if ($target -eq "prod") {
    vercel --prod --cwd "apps/$a"
  } else {
    vercel --cwd "apps/$a"
  }
}