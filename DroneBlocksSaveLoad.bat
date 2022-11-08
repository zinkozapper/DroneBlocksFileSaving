@echo off
::This is a quick and dirty save/load feature for Droneblocks.
::It saves it's data in Appdata\Roaming\DroneBlocks\saves\routes\db(x).
::Feel free to modify it to make it fit your needs.

:: this counts current directories



:StartingMessage
echo ========DroneBlocksSaveLoad===========


:main
echo Please select what method you would like to execute (1-4):
echo 1. Save File
echo 2. Load File
echo 3. Install
echo 4. Uninstall
set /p method=
echo ---------------------------------------------------------------
goto:lockCheck

:sendToMethod
if %method% == 4 (goto:delInit)
if %method% == 3 (goto:init)
if %method% == 2 (goto:load)
if %method% == 1 (goto:save)

echo Invalid answer! Please try again.
goto:main

:load
set /p rt=What folder do you want to load from (1-%count%)?
robocopy "%appdata%\DroneBlocks\saves\routes\db%rt%" "%appdata%\DroneBlocks\Local Storage" /mir >nul
echo Load successful!
pause
goto:EOF


:save
set /p rt=Which folder do you want to save to (1-%count%)?
robocopy "%appdata%\DroneBlocks\Local Storage"  "%appdata%\DroneBlocks\saves\routes\db%rt%" /mir >nul
echo Save successful!
pause
goto:EOF


:init
if exist "%appdata%\DroneBlocks\saves\routes\lock" (
echo Directory already exists!
goto:pcg
) else (
goto:createFiles
)


:createFiles
set /p fileCount=How many save folders do you want? 
for /L %%I in (1,1,%fileCount%) do mkdir "%userprofile%\appdata\Roaming\DroneBlocks\saves\routes\db%%I" >nul

::Manual directories below
::mkdir "%userprofile%\appdata\Roaming\DroneBlocks\saves\routes\db1" >nul
::mkdir "%userprofile%\appdata\Roaming\DroneBlocks\saves\routes\db2" >nul
::mkdir "%userprofile%\appdata\Roaming\DroneBlocks\saves\routes\db3" >nul

echo > "%appdata%\DroneBlocks\saves\routes\lock"
echo Directory created successfully!
goto:pcg


:needToInit
if %method%==3 goto:init
echo You need to initialize first!
goto:pcg


:lockCheck
if exist "%appdata%\DroneBlocks\saves\routes\lock" (
	set count=0
	for /f %%a in ('dir /b /ad "%appdata%\DroneBlocks\saves\routes\"') do set /a count+=1
	goto:sendToMethod
)
goto:needToInit


:delInit
echo WARNING! This will remove the directory and delete all saves! Please make sure you really want to do this!
echo Please type 'Confirm' to proceed. Entering anything else will return you to the main menu.
set /p delConf=
if %delConf%==Confirm goto:proceed
goto:pcg


:pcg
pause
cls
goto:main

:proceed
echo Deleting directory and all contents within...
rmdir "%userprofile%\appdata\Roaming\DroneBlocks\saves\" /s /q
echo Directory successfully deleted!
echo Exiting program...
pause
goto:EOF

