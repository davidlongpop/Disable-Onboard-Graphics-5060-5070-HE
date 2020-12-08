$addInGraphics = Get-PnpDevice -class Display | Where-Object{$_.Name -like "*RX5*"}
$onBoardGraphics = Get-PnpDevice -class Display | Where-Object{$_.Name -like "Intel*UHD*"}

if(!$addInGraphics){
    Write-Host "No Add-in RX500 series card found"
    break
}
else{
    $onBoardGraphics | Disable-PnpDevice -confirm:$false
}
