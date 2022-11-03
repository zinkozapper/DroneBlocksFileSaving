@echo off
::This is a quick and dirty save/load feature for Droneblocks.
::It saves it's data in Appdata\Roaming\DroneBlocks\saves\routes\db(x).
::Feel free to modify it to make it fit your needs.

::NOTE TO SELF: Make counts base off number of folders and make a delete directory function

REM this counts current directories
::for /f %%a in ('dir /b /ad "%appdata%\DroneBlocks\saves\routes\lock"|find /c /v "" ') do set count=%%a echo %count%
::echo %count%



:main
echo Please select what method you would like to execute:
echo 1. init
echo 2. load
echo 3. save
set /p method=
echo ---------------------------------------------------------------
goto:lockCheck

:sendToMethod
if %method% == 1 (goto:init)
if %method% == 2 (goto:load)
if %method% == 3 (goto:save)



:load
set /p rt=What folder do you want to load from (1-3)?
robocopy %appdata%\DroneBlocks\saves\routes\db%rt% "%appdata%\DroneBlocks\Local Storage" /mir
echo Load successful!
pause
goto:EOF


:save
set /p rt=Which folder do you want to save to (1-3)?
robocopy "%appdata%\DroneBlocks\Local Storage"  %appdata%\DroneBlocks\saves\routes\db%rt%
echo Save successful!
pause
goto:EOF


:init
if exist "%appdata%\DroneBlocks\saves\routes\lock" (
echo Directory already exists!
pause
cls
goto:main
) else (
goto:createFiles
)


:createFiles
set /p fileCount=How many save folders do you want? 
for /L %%I in (1,1,%fileCount%) do mkdir "%userprofile%\appdata\Roaming\DroneBlocks\saves\routes\db%%I" 

::Manual directories below
::mkdir "%userprofile%\appdata\Roaming\DroneBlocks\saves\routes\db1" >nul
::mkdir "%userprofile%\appdata\Roaming\DroneBlocks\saves\routes\db2" >nul
::mkdir "%userprofile%\appdata\Roaming\DroneBlocks\saves\routes\db3" >nul

echo > "%appdata%\DroneBlocks\saves\routes\lock"
echo Directory created successfully!
pause
cls
goto:main


:needToInit
if %method%==1 goto:init
echo You need to initialize first!
pause
cls
goto:main


:lockCheck
if exist "%appdata%\DroneBlocks\saves\routes\lock" goto:sendToMethod
if not exist "%appdata%\DroneBlocks\saves\routes\lock" goto:needToInit



