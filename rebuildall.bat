@echo off 
set sootRepo=E:\Git\Github\magpie\soot-reloaded
set magpieRepo=E:\Git\Github\magpie\MagpieBridge
set flowdroidRepo=E:\Git\Github\magpie\flowdroid-lsp-demo

echo build soot-reloaded
set "cmdf2=mvn -f %sootRepo% com.coveo:fmt-maven-plugin:format"
call %cmdf2%
set "cmd1=mvn -f %sootRepo% install -DskipTests"
call %cmd1%

echo build magpieBridge
set "cmdf2=mvn -f %magpieRepo% com.coveo:fmt-maven-plugin:format"
call %cmdf2%
set "cmd2=mvn -f %magpieRepo% install -DskipTests"
call %cmd2%

echo build flowdroidLSPdemo
set "cmdf2=mvn -f %flowdroidRepo% com.coveo:fmt-maven-plugin:format"
call %cmdf2%
set "cmd3=mvn -f %flowdroidRepo% install -DskipTests"
call %cmd3%

set "cmd4=cd vscode"
call %cmd4%
set "cmd4=vsce package"
call %cmd4%
set "cmd4=code --install-extension flowdroid-lsp-demo-0.0.1.vsix"
call %cmd4%