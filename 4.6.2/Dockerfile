FROM microsoft/dotnet-framework:4.6.2

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Add-WindowsFeature Web-Server; \
    Add-WindowsFeature NET-Framework-45-ASPNET; \
    Add-WindowsFeature Web-Asp-Net45; \
    Remove-Item -Recurse C:\inetpub\wwwroot\*

ADD ServiceMonitor.exe /

RUN powershell -Command \
	#download and unzip Roslyn nupkg
	wget  https://api.nuget.org/packages/microsoft.net.compilers.2.3.1.nupkg -OutFile c:\microsoft.net.compilers.2.3.1.zip ; \	
	Expand-Archive -Path c:\microsoft.net.compilers.2.3.1.zip -DestinationPath c:\RoslynCompilers ; \

	#ngen Roslyn binaries
	start-Process C:\Windows\Microsoft.NET\Framework64\v4.0.30319\ngen.exe -ArgumentList 'install c:\RoslynCompilers\tools\csc.exe' -Wait ; \
	start-Process C:\Windows\Microsoft.NET\Framework64\v4.0.30319\ngen.exe -ArgumentList 'install c:\RoslynCompilers\tools\vbc.exe' -Wait ; \
	start-Process C:\Windows\Microsoft.NET\Framework64\v4.0.30319\ngen.exe -ArgumentList 'install c:\RoslynCompilers\tools\VBCSCompiler.exe' -Wait ; \
	start-Process C:\Windows\Microsoft.NET\Framework\v4.0.30319\ngen.exe -ArgumentList 'install c:\RoslynCompilers\tools\csc.exe' -Wait ; \
	start-Process C:\Windows\Microsoft.NET\Framework\v4.0.30319\ngen.exe -ArgumentList 'install c:\RoslynCompilers\tools\vbc.exe' -Wait ; \
	start-Process C:\Windows\Microsoft.NET\Framework\v4.0.30319\ngen.exe -ArgumentList 'install c:\RoslynCompilers\tools\VBCSCompiler.exe' -Wait ; \

	#Set environment variable for DotNetCompilerPlatform
	[Environment]::SetEnvironmentVariable('ROSLYN_COMPILER_LOCATION', 'c:\RoslynCompilers\tools', 'Machine') ; \

	remove-Item c:\microsoft.net.compilers.2.3.1.zip -Force


EXPOSE 80

ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]
