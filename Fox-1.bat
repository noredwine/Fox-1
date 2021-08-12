Echo off
:home
title Passport
::%time:~0,8%
mode con:cols=75 lines=15
cls

:Label2
color 0d
ECHO ADMIN    - 
ECHO HIBER    - 
ECHO PORTME   - LIN
ECHO PORTFOX  - FOX
ECHO HIBERON  - ONH
ECHO HIBEROFF - OFFH
ECHO CLOSEME  - 3
ECHO ADB      - ppan
set /P c= Share your alpha key : 
color 07

if /I "%c%" EQU "00" goto :admin
if /I "%c%" EQU "10" goto :hiber
if /I "%c%" EQU "onh" goto :hiberon
if /I "%c%" EQU "offh" goto :hiberoff
if /I "%c%" EQU "lin" goto :lin
if /I "%c%" EQU "fox" goto :fox
if /I "%c%" EQU "3" goto :closeme
if /I "%c%" EQU "ando" goto :Manual

if /I "%c%" EQU "a1" goto :ed1
if /I "%c%" EQU "b4" goto :flowkill
if /I "%c%" EQU "u1" goto :fox
if /I "%c%" EQU "fl" goto :flow
exit

:admin
title I'M ADMIN
set /p pro=Prog: 
echo %id%
cd\
runas /savecred /profile /user:Administrator cmd
echo "powercfg.exe /hibernate off"
echo "powercfg.exe /hibernate on"
goto :home

:hiber
title I'M Going to Sleep
@echo Hibernate
timeout /t 15
shutdown.exe /h
exit

:hiberon
@echo off
runas /savecred /profile /user:Administrator "powercfg.exe /hibernate on"
cls
PowerShell.exe -Command "& 'Path\hiberstatus.ps1'"
goto :home

::Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Control\Power -name HibernateEnabled


:hiberoff
@echo off
runas /savecred /profile /user:Administrator "powercfg.exe /hibernate off"
cls
PowerShell.exe -Command "& 'Path\hiberstatus.ps1'"
goto :home

:lin
runas /savecred /profile /user:Administrator "C:\Path\Ext2Mgr.exe"
pause
goto :home

:fox
"Path\PortableFirefox\firefox.exe"
goto :home

:Manual
cd "Path\platform-tools"
f:
cmd
goto :home

::Inactives-------------------------------------------------------------------------------------------------------


:closeme
exit

:flowkill
TASKKILL /F /IM flow.exe 
goto :home



