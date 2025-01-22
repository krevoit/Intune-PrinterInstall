Add-Printer -ConnectionName \\printershare\queue1
Start-Sleep -Seconds 15 # Avoids hanging when adding multiple queues
Add-Printer -ConnectionName \\printershare\queue2