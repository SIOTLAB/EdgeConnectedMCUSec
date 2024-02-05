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
set stirot_appli=STM32H5_S_NS_LED_enc_sign.hex
set stirot_appli_bin=STM32H5_S_NS_LED_Secure.bin
set isFullSecure=0
set stirot_boot_path_project=%~dp0..\
set rot_provisioning_path=%~dp0
:: ==============================================================================
::                            For Assembly Python script
:: ==============================================================================
set appli_path=%~dp0/../Secure\Debug\
set appli_non_secure=STM32H5_S_NS_LED_NonSecure.bin
set appli_non_secure_path=%~dp0/../NonSecure\Debug\
set appli_assembly=STM32H5_S_NS_LED_assembled.bin
set appli_assembly_path=%~dp0/../Binary
set code_size=0x00006000
set code_image_path=%~dp0/STiROT/Image/STiRoT_Code_Image.xml

