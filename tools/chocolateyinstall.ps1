$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$lnkStartMenu = "$startMenuLocation\OpenTyrian.lnk"
$lnkReleaseNote = "$startMenuLocation\OpenTyrian Release Notes.lnk"

$url        = 'https://www.camanis.net/opentyrian/releases/opentyrian-2.1.20130907-w32-bundle.zip' # download url, HTTPS preferred
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$ENV:LocalAppData\Programs"
  url           = $url
  softwareName  = 'opentyrian*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = '6704134B708BF075B442C53B24C47D4E'
  checksumType  = 'md5' #default is md5, can also be sha1, sha256 or sha512
}
Install-ChocolateyZipPackage @packageArgs

## Desktop
Install-ChocolateyShortcut -ShortcutFilePath "$lnkDesktop" `
  -TargetPath "$installLocation\opentyrian.exe" `
  -IconLocation "$installLocation\opentyrian.exe" `
  -WorkingDirectory "$installLocation"

Install-ChocolateyShortcut -ShortcutFilePath "$lnkStartMenu" `
  -TargetPath "$installLocation\opentyrian.exe" `
  -IconLocation "$installLocation\opentyrian.exe" `
  -WorkingDirectory "$installLocation"

Install-ChocolateyShortcut -ShortcutFilePath "$lnkReleaseNote" `
  -TargetPath "$installLocation\README.txt" `

