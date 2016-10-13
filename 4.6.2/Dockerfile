FROM microsoft/iis

RUN powershell -Command Add-WindowsFeature NET-Framework-45-ASPNET; \
    powershell -Command Add-WindowsFeature Web-Asp-Net45; \
    powershell -Command Remove-Item -Recurse C:\inetpub\wwwroot\*
