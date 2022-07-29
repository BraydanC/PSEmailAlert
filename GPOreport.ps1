Import-Module ActiveDirectory

Import-Module GroupPolicy

Remove-Item -path C:\filepath\GPOReportsAll.html
$dc = Get-ADDomainController -Discover -Service PrimaryDC

Get-GPOReport -All -Domain hottmannconstru.local -Server $dc -ReportType HTML -Path C:\Users\bcoffing\Desktop\GPOReportsAll.html