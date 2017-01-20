FROM microsoft/iis

ADD install /build
RUN DISM /Online /Add-Package /PackagePath:C:\build\microsoft-windows-netfx3-ondemand-package.cab & \
    DISM /Online /Add-Package /PackagePath:C:\build\patch\Windows10.0-KB3213986-x64.cab  & \
    rd /s /q C:\build & \
    powershell -Command Add-WindowsFeature Web-Asp-Net & \
    %windir%\SysWOW64\inetsrv\appcmd set app "Default Web Site/" /applicationPool:".NET v2.0" & \
    powershell -Command Remove-Item -Recurse C:\inetpub\wwwroot\*
