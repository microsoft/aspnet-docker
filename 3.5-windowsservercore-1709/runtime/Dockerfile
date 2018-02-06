# escape=`

FROM microsoft/dotnet-framework:3.5-windowsservercore-1709

RUN powershell -Command Add-WindowsFeature Web-Server & `
    powershell -Command Add-WindowsFeature Web-Asp-Net & `
    %windir%\System32\inetsrv\appcmd set apppool /apppool.name:DefaultAppPool /managedRuntimeVersion:v2.0 & `
    powershell -Command Remove-Item -Recurse C:\inetpub\wwwroot\* & `
    powershell -Command Invoke-WebRequest https://dotnetbinaries.blob.core.windows.net/servicemonitor/1342334/ServiceMonitor.exe -OutFile C:\ServiceMonitor.exe

EXPOSE 80

ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]
