# escape=`

FROM microsoft/dotnet-framework-build:4.7.1-2017.12-windowsservercore-1709

# Install web targets
RUN Invoke-WebRequest https://dotnetbinaries.blob.core.windows.net/dockerassets/MSBuild.Microsoft.VisualStudio.Web.targets.2017.12.zip `
        -UseBasicParsing `
        -OutFile MSBuild.Microsoft.VisualStudio.Web.targets.zip; `
    Expand-Archive MSBuild.Microsoft.VisualStudio.Web.targets.zip `
        -DestinationPath \"${Env:ProgramFiles(x86)}\Microsoft Visual Studio\2017\BuildTools\MSBuild\Microsoft\VisualStudio\v15.0\"; `
    Remove-Item -Force MSBuild.Microsoft.VisualStudio.Web.targets.zip

# Add ASP.NET runtime components
RUN Add-WindowsFeature Web-Server; `
    Add-WindowsFeature NET-Framework-45-ASPNET; `
    Add-WindowsFeature Web-Asp-Net45; `
    Remove-Item -Recurse C:\inetpub\wwwroot\*

COPY ServiceMonitor.exe /

ENV ROSLYN_COMPILER_LOCATION "C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\BuildTools\\MSBuild\\15.0\\Bin\\Roslyn"

EXPOSE 80
