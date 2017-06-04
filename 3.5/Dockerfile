FROM microsoft/iis:3.5

RUN powershell -Command Add-WindowsFeature Web-Asp-Net & \
    %windir%\SysWOW64\inetsrv\appcmd set app "Default Web Site/" /applicationPool:".NET v2.0" & \
    powershell -Command Remove-Item -Recurse C:\inetpub\wwwroot\*
