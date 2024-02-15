@ECHO OFF
:: ==============================================================================
::                               General
:: ==============================================================================
set stm32programmercli="C:\Program Files\STMicroelectronics\STM32Cube\STM32CubeProgrammer\bin\STM32_Programmer_CLI.exe"
set stm32tpccli=C:\ST\STM32CubeIDE_1.14.0\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.cubeprogrammer.win32_2.1.100.202311100844\tools\bin\STM32TrustedPackageCreator_CLI.exe
::~dp0 = represent the folder where the env.bat is started
:: ==============================================================================
::               !!!! DOT NOT EDIT --- UPDATED AUTOMATICALLY !!!!
:: ==============================================================================
set PROJECT_GENERATED_BY_CUBEMX=true
set cube_fw_path="C:\Users\gavin\STM32Cube\Repository\STM32Cube_FW_H5_V1.1.1"

:: ==============================================================================
::                            STiRoT bootpath
:: ==============================================================================
set stirot_appli=SecureUnoI2C_Secure_enc_sign.hex
set isFullSecure=1
set stirot_boot_path_project=%~dp0..\
set rot_provisioning_path=%~dp0

