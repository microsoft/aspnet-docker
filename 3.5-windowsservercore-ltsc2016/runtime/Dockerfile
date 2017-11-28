FROM microsoft/dotnet-framework:3.5

RUN powershell -Command Add-WindowsFeature Web-Server & \
    powershell -Command Add-WindowsFeature Web-Asp-Net & \
    %windir%\System32\inetsrv\appcmd set apppool /apppool.name:DefaultAppPool /managedRuntimeVersion:v2.0 & \
    powershell -Command Remove-Item -Recurse C:\inetpub\wwwroot\*

ADD ServiceMonitor.exe /

EXPOSE 80

ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]
