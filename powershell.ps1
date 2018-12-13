
try { $null = gcm pshazz -ea stop; pshazz init 'default' } catch { }

Set-PSReadlineOption -BellStyle None

Import-Module posh-git

. ~\posh-git-alias.ps1
