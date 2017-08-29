Add-Type -AssemblyName System.IO.Compression.FileSystem

$roslynNupkgName = "microsoft.net.compilers.2.3.1.nupkg"
$nugetUrl = "https://api.nuget.org/packages/"
$roslynInstalledLocation = Join-Path ([Environment]::GetEnvironmentVariable("SystemDrive")) "RoslynCompilers"
$roslynDownloadLocation = Join-Path ([IO.Path]::GetTempPath()) $roslynNupkgName

#download and unzip Roslyn nupkg
Invoke-WebRequest "$nugetUrl$roslynNupkgName" -OutFile $roslynDownloadLocation
[System.IO.Compression.ZipFile]::ExtractToDirectory($roslynDownloadLocation, $roslynInstalledLocation)

#redirect the Roslyn compiler path for DotNetCompilerPlatform
$roslynCompilerFullPath = "$roslynInstalledLocation\tools"
[Environment]::SetEnvironmentVariable("ROSLYN_COMPILER_LOCATION", $roslynCompilerFullPath, "Machine")

#NGen Roslyn binaries
$ngenFullPath = Join-Path ([Environment]::GetEnvironmentVariable("windir")) "Microsoft.NET\Framework\v4.0.30319\ngen.exe"

& $ngenFullPath "install" "$roslynCompilerFullPath\csc.exe"
& $ngenFullPath "install" "$roslynCompilerFullPath\vbc.exe"
& $ngenFullPath "install" "$roslynCompilerFullPath\VBCSCompiler.exe"

$amd64ngenFullPath = Join-Path ([Environment]::GetEnvironmentVariable("windir")) "Microsoft.NET\Framework64\v4.0.30319\ngen.exe"
if(Test-Path $amd64ngenFullPath){
    & $amd64ngenFullPath "install" "$roslynCompilerFullPath\csc.exe"
    & $amd64ngenFullPath "install" "$roslynCompilerFullPath\vbc.exe"
    & $amd64ngenFullPath "install" "$roslynCompilerFullPath\VBCSCompiler.exe"
}