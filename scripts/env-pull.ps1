param()

$apps = "web","clients","admin","courses"
foreach ($a in $apps) {
  vercel pull --yes --environment=development --cwd "apps/$a"
}