##############################
# Printer Driver Install #
################################
$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$driverName = "FF Print Driver PCL 6" # Should match the name of the driver in the INF file

###################
# Staging Drivers #
###################
c:\windows\sysnative\pnputil.exe /add-driver "$PSScriptRoot\Drivers\driver.inf" /install

#######################
# Installing Drivers  #
#######################
Add-PrinterDriver -name $driverName