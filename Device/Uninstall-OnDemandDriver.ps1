##############################
# Printer Driver UNINSTALL  #
################################
$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$driverName = "FF Print Driver PCL 6" # Should match the name of the driver in the INF file
Remove-PrinterDriver -name $driverName
c:\windows\sysnative\pnputil.exe /delete-driver "$PSScriptRoot\Drivers\driver.inf" /uninstall
