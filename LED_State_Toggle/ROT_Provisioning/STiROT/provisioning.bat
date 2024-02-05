@ECHO OFF

:: Getting the Trusted Package Creator and STM32CubeProgammer CLI path 
call ../env.bat

:: Enable delayed expansion
setlocal EnableDelayedExpansion

set isGeneratedByCubeMX=%PROJECT_GENERATED_BY_CUBEMX%
set full_secure=%isFullSecure%
:: Environment variable for AppliCfg
set "projectdir=%~dp0"

:: Environment variable used to know if the firmware image is full secure or not
set stirot_config=".\Config\STiRoT_Config.xml"
set is_fw_sec="Is the firmware full secure"

:start
goto exe:
goto py:
:exe
::called if we want to use AppliCfg executable
set "applicfg=%cube_fw_path%\Utilities\PC_Software\ROT_AppliConfig\dist\AppliCfg.exe"
set "python="
if exist %applicfg% (
goto update
)
:py
::called if we just want to use AppliCfg python (think to comment "goto exe:")
set "applicfg=%cube_fw_path%\Utilities\PC_Software\ROT_AppliConfig\AppliCfg.py"
set "python=python "

:update
set "AppliCfg=%python%%applicfg%"

:: External scripts
set ob_flash_programming="ob_flash_programming.bat"
set ob_key_provisioning="obkey_provisioning.bat"
set update_ob_setup="update_ob_setup.bat"
set update_appli_setup="update_appli_setup.bat"

:provisioning
set ob_update_ob_log="update_ob_setup.log"
set ob_update_appli_log="update_appli_setup.log"
set ob_key_provisioning_log="obkey_provisioning.log"
set provisioning_log="provisioning.log"
set ob_flash_log="ob_flash_programming.log"

:: Initial configuration
set connect_no_reset=-c port=SWD speed=fast ap=1 mode=Hotplug
set connect_under_reset=-c port=SWD speed=fast ap=1 mode=UR
:: Define principal log file
set current_log_file=%provisioning_log%
:: Parse the project name chosen in env.bat
for %%A in ("%stirot_boot_path_project%") do (
    set project_name=%%~nxA
)

echo =====
echo ===== Provisioning of STiRoT boot path
echo ===== Application selected through env.bat:
echo =====   %stirot_boot_path_project%
echo ===== Product state must be Open. Execute  \ROT_Provisioning\DA\regression.bat if not the case.
echo =====
echo;

:: bypass this step when Generated By CubeMX
if "%isGeneratedByCubeMX%" == "true" goto :cubemx
:: Verify the project name configuration
if /i %stirot_boot_path_project% == %stirot_boot_path_project:STiROT_Appli=% (
echo =====
echo ===== Wrong Boot path: %stirot_boot_path_project%
echo ===== please modify the env.bat to set the right path
goto step_error
)

:: ====================================================== STM32H5 product preparation ======================================================
:: =============================================== Steps to create the STiRoT_Config.obk file ==============================================
echo Step 1 : Configuration management
echo    * STiRoT_Config.obk generation:
echo        From TrustedPackageCreator (tab H5-OBkey)
echo        Select STiRoT_Config.xml(Default path is \ROT_Provisioning\STiROT\Config\STiRoT_Config.xml)
echo        Warning: Default keys must NOT be used in a product. Make sure to regenerate your own keys!
echo        Update the configuration (if/as needed) then generate STiRoT_Config.obk file
echo        Press any key to continue...
if [%1] neq [AUTO] pause >nul


:: =============================================== Steps to create the DA_Config.obk file ==============================================
echo;
echo    * DA_Config.obk generation:
echo        Warning: Default keys must NOT be used in a product. Make sure to regenerate your own keys!
echo        From TrustedPackageCreator (tab H5-DA CertifGen),
echo        update the keys(s) (in \ROT_Provisioning\DA\Keys) and permissions (if/as needed)
echo        then regenerate the certificate(s)
echo        From TrustedPackageCreator (tab H5-OBKey),
echo        Select DA_Config.xml (in \ROT_Provisioning\DA\Config)
echo        Update the configuration (if/as needed) then generate DA_Config.obk file
echo        Press any key to continue...
if [%1] neq [AUTO] pause >nul

:: ====================================== Step to update full secure value in updateAppliSetup.bat ========================================
echo;
echo    * updateAppliSetup script update ...
%AppliCfg% flash -xml %stirot_config% -nxml %is_fw_sec% -b "Full_secure" -sr "fullsecure.txt" %update_appli_setup% --decimal
if !errorlevel! neq 0 goto :error
echo        Full_secure variable successfully update according to STiRoT_Config.xml
:: ====================================== Step to get the value stored in fullsecure.txt file ========================================
set /p full_secure=<fullsecure.txt
DEL fullsecure.txt

:: Check if project name is relevant with STiROT configuration xml file
if "%full_secure%" == "1" (
set "action=Check path project to STiROT_Appli"
if /i "%project_name%" GTR "STiROT_Appli" (
echo STiROT_Appli_TrustZone project name selected is different from full secure configuration set into STiROT_Config.xml file > %current_log_file% && goto :step_error)
)
if "%full_secure%" == "0" (
set "action=Check path project to STiROT_Appli_TrustZone"
if /i "%project_name%" LSS "STiROT_Appli_TrustZone" (
echo STiROT_Appli project name selected is different from fw full secure configuration set into STiROT_Config.xml > %current_log_file% && goto :step_error)
)
:cubemx
:: ======================================================= Updating the Option bytes =======================================================
echo;
set current_log_file=%ob_update_ob_log%
set "action=ob_flash_programming script update ..."
set "command=start /w /b call %update_ob_setup% AUTO"
echo    * %action%
%command% > %ob_update_ob_log% 2>&1

set ob_update_ob_error=!errorlevel!
if %ob_update_ob_error% neq 0 goto :step_error
echo        Option bytes successfully updated according to STiRoT_Config.xml
echo        (see %ob_update_ob_log% for details^)

:: ================================================ Updating test Application files ========================================================
echo;
set current_log_file=%ob_update_appli_log%
set "command=start /w /b call %update_appli_setup% AUTO"
::must be bypassed when generated by CubeMX
if "%isGeneratedByCubeMX%" == "false" (
if /i "%full_secure%" == "1" (
set "action=STiROT_Appli project files (main.h, .icf) update ..."
)

if /i "%full_secure%" == "0" (
set "action=STiROT_Appli_TrustZone project files (.icf) update ..."
)
echo    * !action!

%command% > %ob_update_appli_log% 2>&1
if !errorlevel! neq 0 goto :step_error

if /i "%full_secure%" == "1" (
echo        stm32h573xx_flash.icf and main.h successfully updated according to STiRoT_Config.xml
)

if /i "%full_secure%" == "0" (
echo        stm32h573xx_flash_s.icf and stm32h573xx_flash_ns.icf successfully updated according to STiRoT_Config.xml
)

echo        (see %ob_update_appli_log% for details^)
)

:: ========================================================= Images generation steps ========================================================
echo;
echo Step 2 : Images generation
:: bypass this step when Generated By CubeMX
if "%isGeneratedByCubeMX%" == "true" goto :cubemx1
echo    * Code firmware image generation:
if /i "%full_secure%" == "1" (
echo        Open the STiROT_Appli project with your preferred toolchain
)

if /i "%full_secure%" == "0" (
echo        Open the STiROT_Appli_TrustZone project with your preferred toolchain
)
echo        Rebuild all files. The appli_enc_sign.hex file is generated with the postbuild command
echo        Press any key to continue...
if [%1] neq [AUTO] pause >nul
echo;
:cubemx1
echo    * Data generation (if Data image is enabled):
echo        Select STiRoT_Data_Image.xml(Default path is \ROT_Provisioning\STiROT\Image\STiRoT_Data_Image.xml)
echo        Generate the data_enc_sign.hex image
echo        Press any key to continue...
if [%1] neq [AUTO] pause >nul
echo;

:: ========================================================= Board provisioning steps =======================================================
echo Step 3 : Provisioning
echo    * BOOT0 pin should be disconnected from VDD:
echo        (STM32H573I-DK: set SW1 to position 0)
echo        Press any key to continue...
echo;
if [%1] neq [AUTO] pause >nul

:: ================================================ Option Bytes and flash programming ====================================================
set current_log_file=%ob_flash_log%
set "action=Programming the option bytes and flashing the images ..."
set "command=start /w /b call %ob_flash_programming% AUTO"
echo    * %action%
%command% > %ob_flash_log%


set ob_flash_error=!errorlevel!
::type %ob_flash_log%
if %ob_flash_error% neq 0 goto :step_error

echo        Successful option bytes programming and images flashing
echo        (see %ob_flash_log% for details)
echo;
:: ================================================ Final product state selection =========================================================
:product_state_choice
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "BS=%%A"
set "action=Define product state value"
echo    * %action%
if [%1] neq [AUTO] (
    set /p "product_state=%BS%       [ OPEN | PROVISIONED | TZ-CLOSED | CLOSED | LOCKED ]: "
) else (
    set "product_state=%2%"
    if /i "%product_state%" == "OPEN" (
    echo        Product state OPEN not supported in AUTO mode
    goto step_error
    )
)

if /I "%product_state%" == "OPEN" (
:: Reset SECBOOT_LOCK option bit to 0xC3 (unlock boot address & unique boot entry) to handle Open product state
set "command=%stm32programmercli% %connect_under_reset% -ob SECBOOT_LOCK=0xC3"
echo !command! >> %provisioning_log%
!command! >> %provisioning_log%
echo;
set ps_value=0xED
goto connect_boot0
)

if /i "%product_state%" == "PROVISIONED" (
echo;
set ps_value=0x2E
goto set_provisionning_ps
)

if /i "%product_state%" == "TZ-CLOSED" (
echo;
set ps_value=0xC6
goto set_provisionning_ps
)

if /i "%product_state%" == "CLOSED" (
echo;
set ps_value=0x72
goto set_provisionning_ps
)

if /i "%product_state%" == "LOCKED" (
echo;
set ps_value=0x5C
goto set_provisionning_ps
)

echo        WRONG product state selected
set current_log_file="./*.log files "
echo;
goto product_state_choice

:: ========================================= Product State configuration and Provisioning steps ==========================================   
:: Connect BOOT0 pin to VDD
:connect_boot0
echo    * BOOT0 pin should be connected to VDD:
echo        (STM32H573I-DK: set SW1 to position 1)
echo        Press any key to continue...
echo;
if [%1] neq [AUTO] pause >nul
goto provisioning_step

:: Provisioning execution 
:set_provisionning_ps
set current_log_file=%provisioning_log%
set "action=Setting the product state PROVISIONING"
echo    * %action%
set "command=%stm32programmercli% %connect_no_reset% -ob PRODUCT_STATE=0x17"
echo %command% >> %provisioning_log%
echo;
%command% > %provisioning_log%
if !errorlevel! neq 0 goto :step_error 
goto provisioning_step

:: Set the final product state of the STM32H5 product
:set_final_ps
set current_log_file=%provisioning_log%
set "action=Setting the final product state %product_state% "
echo    * %action%
set "command=%stm32programmercli% %connect_no_reset% -ob PRODUCT_STATE=%ps_value%"
echo %command% >> %provisioning_log%
%command% >> %provisioning_log%
echo.
:: In the final product state, the connection with the board is lost and the return value of the command cannot be verified
goto final_execution

:: Provisioning the obk files step
:provisioning_step
set current_log_file=%ob_key_provisioning_log%
set "action=Provisionning the .obk files ..."
echo    * %action%
set "command=start /w /b call %ob_key_provisioning% AUTO !product_state!"
%command% > %ob_key_provisioning_log%
set obkey_prog_error=!errorlevel!
if %obkey_prog_error% neq 0 goto :step_error

echo        Successful obk provisioning
echo        (see %ob_key_provisioning_log% for details^)
echo;
if /i "%product_state%" == "OPEN" goto :final_execution
goto set_final_ps

:: ============================================================= End functions =============================================================  
:: All the steps to set the STM32H5 product were executed correctly
:final_execution

echo =====
echo ===== The board is correctly configured.
if "%isGeneratedByCubeMX%" == "true" goto :no_menu
echo ===== Connect UART console (115200 baudrate) to get application menu.

:no_menu
echo ===== Power off/on the board to start the application.
echo =====
if [%1] neq [AUTO] cmd /k
exit 0

:: Error when external script is executed
:step_error
echo;
echo =====
echo ===== Error while executing "%action%".
echo ===== See %current_log_file% for details. Then try again.
echo =====
if [%1] neq [AUTO] cmd /k
exit 1
