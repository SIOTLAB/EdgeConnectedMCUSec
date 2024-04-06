@ECHO OFF
:: ==============================================================================
::                               General
:: ==============================================================================
set stm32programmercli="C:\Program Files\STMicroelectronics\STM32Cube\STM32CubeProgrammer\bin\STM32_Programmer_CLI.exe"
set stm32tpccli=C:\ST\CubeMX\utilities\STM32TrustedPackageCreator\bin\STM32TrustedPackageCreator_CLI.exe
::~dp0 = represent the folder where the env.bat is started
:: ==============================================================================
::               !!!! DOT NOT EDIT --- UPDATED AUTOMATICALLY !!!!
:: ==============================================================================
set PROJECT_GENERATED_BY_CUBEMX=true
set cube_fw_path="C:\Users\gavin\STM32Cube\Repository\STM32Cube_FW_H5_V1.1.1"

:: ==============================================================================
::                            STiRoT bootpath
:: ==============================================================================
set stirot_appli=S-GPIO_Secure_enc_sign.hex
set isFullSecure=1
set stirot_boot_path_project=%~dp0..\
set rot_provisioning_path=%~dp0

