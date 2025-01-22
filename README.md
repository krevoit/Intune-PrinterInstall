# Intune Printer Install

Installs Windows SMB print queues and drivers onto an Intune managed device through Company Portal.

---

## Driver Install (Target to Device)

- In the **Device** folder, change the name of the driver and `.inf` file after including it in the driver folder.
- After packaging as an IntuneWin, it can be deployed to devices. Remember to deploy as a **System** app.

### Commands:
- **Install Command**: `powershell.exe -noprofile -executionpolicy bypass .\Install-Driver.ps1`
- **Uninstall Command**: `powershell.exe -noprofile -executionpolicy bypass .\Uninstall-Driver.ps1`

### Detection:
- **Registry Key Path**: `HKLM\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows x64\Drivers\Version-3\<DRIVERNAME>` ($driverName value from the .INF file)
- **Detection Method**: Key exists

---

## Print Queue Install (Target to User)

- In the **User** folder, add the print queue(s) you would like to be installed on your targeted devices.
- This will be deployed to users.
- You can set the dependency for this App to be the printer driver from above for simpler deployment

### Commands:
- **Install Command**: `powershell.exe -noprofile -executionpolicy bypass .\Install-Printer.ps1`
- **Uninstall Command**: `powershell.exe -noprofile -executionpolicy bypass .\Uninstall-Printer.ps1`

### Detection:
- **Registry Key Path**: `HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PrinterPorts`
- **Value Name**: The full print queue you added in the `Install-Printer.ps1` script.

---

### Assumptions / Considerations

- I highly recommend to manually test this first by running the Driver script as an Administrator, and the queue install as a standard user to catch any errors.
- The logged-in user has access to the printer share without needing to enter credentials. Normally, AAD join + Hybrid users, and full Hybrid join will work without any further config in this case.
- You have the `.INF` file for the printers you would like to install (Type-3). This can be extracted from your print server
- It is recommended not to set the user printer install as required unless your devices will always have access to the print queue. The printer install will most likely fail if they cannot contact the printer share.
- A point-and-print administrative template with the printer share being listed is required, as shown below. (I haven't tested without this, so it might not be needed.)
<img width="578" alt="Screenshot 2025-01-22 at 10 35 20 pm" src="https://github.com/user-attachments/assets/fdc1bf15-2ee3-4193-b945-6e88c2326579" />
