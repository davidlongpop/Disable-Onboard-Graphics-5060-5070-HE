<#
.Synopsis
   Disables OnBoard graphics in 5060/5070 Desktop systems when AMD RX500 Series Add-In Card is present
.DESCRIPTION
   This script was made as a fix to LoadLibrary issues with AMD Graphics cards when accessed via remote desktop with Intel OnBoard Graphics also present
.AUTHOR
   David Long 12-08-2020
#>
$addInGraphics = Get-PnpDevice -class Display | Where-Object{$_.Name -like "*RX5*"}
$onBoardGraphics = Get-PnpDevice -class Display | Where-Object{$_.Name -like "Intel*UHD*"}

if(!$addInGraphics){
    Write-Host "No Add-in RX500 series card found"
    break
}
else{
    $onBoardGraphics | Disable-PnpDevice -confirm:$false
}
