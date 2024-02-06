@ECHO OFF
:: Getting the Trusted Package Creator and STM32CubeProgammer CLI path 
:: arg1 is the binary type (1 nonsecure, 2 secure)
set "projectdir=%~dp0"
set signing=%1
pushd %projectdir%
set provisioningdir=%cd%
set env_script="%provisioningdir%\env.bat"
call %env_script%
popd

:: Enable delayed expansion
setlocal EnableDelayedExpansion
::default use case for image non assembly
set app_image_number=2
:: ==============================================================================
::                            ST_IROT bootpath
:: ==============================================================================
set s_code_xml="%provisioningdir%\STiROT\Image\STiRoT_Code_Image.xml"

:start
goto exe:
goto py:
:exe
::line for window executable
set "applicfg=%cube_fw_path%\Utilities\PC_Software\ROT_AppliConfig\dist\AppliCfg.exe"
set "python="
if exist %applicfg% (
goto postbuild
)
:py
::called if we just want to use AppliCfg python (think to comment "goto exe:")
set "applicfg=%cube_fw_path%\Utilities\PC_Software\ROT_AppliConfig\AppliCfg.py"
set "python=python "

:postbuild
echo Postbuild %signing% image > %projectdir%\postbuild.log 2>&1

if "%app_image_number%" == "2" (
goto :continue
)
if "%signing%" =="nonsecure" (
goto :assembled
)

:continue
if "%signing%" == "secure" (
goto :secure
) 

:nonsecure
if "%signing%" =="nonsecure" (
goto :nonsecure
)

:noerror
echo TPC success
exit 0

:error
exit 1

:secure
echo Creating secure image  >> %projectdir%\postbuild.log 2>&1
"%stm32tpccli%" -pb %s_code_xml% >> %projectdir%\postbuild.log 2>&1
if !errorlevel! neq 0 goto :error
goto :noerror

:nonsecure
echo Creating nonsecure image  >> %projectdir%\postbuild.log 2>&1
"%stm32tpccli%" -pb %ns_code_xml% >> %projectdir%\postbuild.log 2>&1
if !errorlevel! neq 0 goto :error
goto :noerror

:assembled
echo Creating only one image >> %projectdir%\postbuild.log 2>&1
%python%%applicfg% oneimage -fb "%appli_secure_path%\%appli_secure%" -sb "%appli_non_secure_path%\%appli_non_secure%" -o %secure_code_size% -ob "%appli_assembly_path%\%appli_assembly%" --vb
"%stm32tpccli%" -pb %ns_code_xml%
if !errorlevel! neq 0 goto :error
goto :continue

