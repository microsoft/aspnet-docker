FROM microsoft/dotnet-framework-build:4.7.1-2017.11-windowsservercore-ltsc2016

# Install web targets
COPY ["Web", "/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/MSBuild/Microsoft/VisualStudio/v15.0/Web"]
COPY ["WebApplications", "/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/MSBuild/Microsoft/VisualStudio/v15.0/WebApplications"]

# Install node, bower, and git
ENV NODE_VERSION 8.9.1
RUN Invoke-WebRequest -UseBasicParsing https://nodejs.org/dist/v${env:NODE_VERSION}/node-v${env:NODE_VERSION}-win-x64.zip -outfile node.zip; \
    Expand-Archive node.zip -DestinationPath nodejs-tmp; \
    Move-Item nodejs-tmp/node-v${env:NODE_VERSION}-win-x64 ${env:ProgramFiles}/nodejs; \
    Remove-Item -Force node.zip; \
    Remove-Item -Force nodejs-tmp
RUN setx /M PATH $(${Env:PATH} + \"${Env:ProgramFiles}/nodejs\")
RUN & ${env:ProgramFiles}/nodejs/npm install -g gulp bower

# Add ASP.NET runtime components
RUN Add-WindowsFeature Web-Server; \
    Add-WindowsFeature NET-Framework-45-ASPNET; \
    Add-WindowsFeature Web-Asp-Net45; \
    Remove-Item -Recurse C:\inetpub\wwwroot\*

ADD ServiceMonitor.exe /

# Download Roslyn nupkg and ngen the compiler binaries
RUN Invoke-WebRequest https://api.nuget.org/packages/microsoft.net.compilers.2.3.1.nupkg -OutFile c:\microsoft.net.compilers.2.3.1.zip ; \
    Expand-Archive -Path c:\microsoft.net.compilers.2.3.1.zip -DestinationPath c:\RoslynCompilers ; \
    Remove-Item c:\microsoft.net.compilers.2.3.1.zip -Force ; \
    &set COMPLUS_NGenProtectedProcess_FeatureEnabled=0 ; \
    &C:\Windows\Microsoft.NET\Framework64\v4.0.30319\ngen.exe update ; \
    &C:\Windows\Microsoft.NET\Framework\v4.0.30319\ngen.exe update ; \
    &C:\Windows\Microsoft.NET\Framework64\v4.0.30319\ngen.exe install c:\RoslynCompilers\tools\csc.exe /ExeConfig:c:\RoslynCompilers\tools\csc.exe | \
    &C:\Windows\Microsoft.NET\Framework64\v4.0.30319\ngen.exe install c:\RoslynCompilers\tools\vbc.exe /ExeConfig:c:\RoslynCompilers\tools\vbc.exe  | \
    &C:\Windows\Microsoft.NET\Framework64\v4.0.30319\ngen.exe install c:\RoslynCompilers\tools\VBCSCompiler.exe /ExeConfig:c:\RoslynCompilers\tools\VBCSCompiler.exe | \
    &C:\Windows\Microsoft.NET\Framework\v4.0.30319\ngen.exe install c:\RoslynCompilers\tools\csc.exe /ExeConfig:c:\RoslynCompilers\tools\csc.exe | \
    &C:\Windows\Microsoft.NET\Framework\v4.0.30319\ngen.exe install c:\RoslynCompilers\tools\vbc.exe /ExeConfig:c:\RoslynCompilers\tools\vbc.exe | \
    &C:\Windows\Microsoft.NET\Framework\v4.0.30319\ngen.exe install c:\RoslynCompilers\tools\VBCSCompiler.exe  /ExeConfig:c:\RoslynCompilers\tools\VBCSCompiler.exe ;

ENV ROSLYN_COMPILER_LOCATION c:\\RoslynCompilers\\tools

EXPOSE 80
