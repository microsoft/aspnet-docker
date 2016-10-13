FROM microsoft/iis

RUN powershell -Command Add-WindowsFeature NET-Framework-45-ASPNET
RUN powershell -Command Add-WindowsFeature Web-Asp-Net45

# Delete contents of Default Site
RUN powershell -Command Remove-Item -Recurse C:\inetpub\wwwroot\*
