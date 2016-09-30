FROM microsoft/iis

ADD source /build
RUN DISM /Online /Add-Package /PackagePath:C:\build\microsoft-windows-netfx3-ondemand-package.cab & del C:\build\microsoft-windows-netfx3-ondemand-package.cab
RUN powershell -Command Add-WindowsFeature Web-Asp-Net

RUN powershell -Command Add-WindowsFeature NET-Framework-45-ASPNET
RUN powershell -Command Add-WindowsFeature Web-Asp-Net45