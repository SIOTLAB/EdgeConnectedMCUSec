## Overview

With a wide range of applications and the rise of cyberattacks, securing MCUs has
become imperative; however, ensuring MCU performance is also crucial given
how interconnected today’s systems are. This project examines the security and
performance of next-generation microcontroller units (MCUs) leveraging new
security solutions for IoT edge applications. By benchmarking these MCUs against
key performance metrics, their viability will be assessed to facilitate the widespread
adoption of this new firmware.

This project utilizes the STM32 toolchain and Nordic Semiconductor PPK II along with the nRF software. See the slides for more information.

## Navigation

To navigate to source code, choose a project (i.e UnoI2C) and select the `Core` directory for non-secure projects or the `Secure` directory and then the `Core` directory for secure projects. Within `Core` there should be an `Src` folder which contains the code used to build the selected application. 

## Getting Started

**<span style="text-decoration:underline;">Developing Purely Secure/Non-Secure Applications</span>**

Adapted from: [https://wiki.st.com/stm32mcu/wiki/Security:How_to_start_with_STM32CubeMX_STiRoT_Boot_path_on_STM32H57](https://wiki.st.com/stm32mcu/wiki/Security:How_to_start_with_STM32CubeMX_STiRoT_Boot_path_on_STM32H57)

**STM32CubeMX**



1. Click on _Access to MCU Selector_ and select our device, the STM32H573I-DK, from the _Series_ column
2. Create the project and enable TrustZone
3. Specify project name and path
    1. Select Secure or Non-secure project based on the use case (could be both then select both)
    2. Toolchain as STM32Cube IDE
4. Go to File > Save Project

Once the project has been created…



1. In _Pinout and Configuration_, click on pins for use case > GPIO_Output
    1. _Pin Reserve_ to choose if it’s reserved for Secure or Non-Secure (Cortex M-33 Secure vs. Cortex M-33 non-secure)
    2. Optional but recommended: Enter a user label for pins
    3. Note: External documentation to know which LEDs to use
2. For pin reservation for I<sup>2</sup>C and others
    4. **Refer to the [Hardware Layout Page 3](https://www.st.com/content/ccc/resource/technical/layouts_and_diagrams/schematic_pack/group2/a9/96/52/b1/46/f6/4e/b9/mb1677-h573i-c02-schematic/files/mb1677-h573i-c02-schematic.pdf/jcr:content/translations/en.mb1677-h573i-c02-schematic.pdf)**
    5. For I<sup>2</sup>C, make sure SCL is PB6 and SDA is PB7
    6. LEDs
        1. LED1 is PI9
        2. LED2 is PI8
        3. LED3 is PF1
        4. LED4 is PF4
        5. See layout page 12 for more details
    7. Don't forget to reserve pins if needed
    8. Enter user labels for reserved pins for easy identification in the generated code
3. In _System Core_ it will show what pins are configured for what
4. In _Boot Path and Debug Authentication_ > _Select_ > STiRoT > Secure Application
    9. Click on Finish and OK on the popup
    10. Note: This does not need to be done for purely NS
5. Select _Edit Config Files_ (Opens the TPC)

In the TPC…



1. Select/deselect “is the firmware full secure” based on use case
    1. If both secure and nonsecure, make sure enough resources are allocated to both
2. Generate OBKey
    2. Note: If you define your own code, you need to change the sizes and default settings to match your code size and regenerate OBKeys (our mistake before lol)
3. Close TPC

Back in the _Project Manager_ tab…



1. In _Boot Path and Debug Authentication_ > _Configure_
    1. Note: key may need to be regenerated but USUALLY NOT, otherwise VERY IMPORTANT to not lose the key!! (ok for this example to leave as is)
2. Opens TPC again, then _Generate OBKey_
3. Close TPC
4. In Project Manager > _Signature_ make sure Sign Binaries is selected
5. Generate Code > Yes
6. Then click “Open Project” on the popup

**STM32 Cube IDE**



1. Project opened in the IDE
2. Insert modified code into secure/non-secure main based on use case
3. Compile code, Project > Rebuild All
    1. Note: Secure code needs to be compiled BEFORE nonsecure code!

For device provisioning…



1. Connect the board to computer through USB_STLink connector
2. Go to File Explorer to project path
3. Under project name > ROT_provisioning > STiRoT > provisioning.bat
4. Follow instructions of script up until Step 3
5. In Step 3 > set device state (usually CLOSED)

Code should be executing on board now!

**To perform a regression (to be able to modify the running application and flash again)…**

Note: Can also fully erase board like a factory reset in CubeProgrammer as well

**Go to STM32CubeProgrammer**



1. Make sure the board is connected via ST-LINK
    1. If not found:
        1. Go to menu bar → Parallels Icon → Devices → USB/Bluetooth → Select STLINKV3
2. Select the DA tab on the left (shield icon, last tab in top section)
3. Click Discover
4. Select "Full Regression" from the list below
    2. This only shows if the lifecycle is CLOSED
5. Select Execute
    3. A success message should appear
6. Don't forget to disconnect ST-LINK (it connect automatically on success) 

**Cloning project from GitHub**



1. Find .project file in File Explorer and double click to open in STM32 IDE
2. Build project
    1. If Secure -> in STiRoT, ROT provisioning find provisioning.bat and show in Explorer > double click to run
3. Optional: FOR TROUBLESHOOTING
    2. May have paths messed up…
        1. In that case, open IOC file and update paths for firmware, regenerate code
        2. Will have to update the main.c files
        3. Then rebuild project
    3. Don’t forget to install python as well (from command line type python > ENTER, install from Microsoft store)

**<span style="text-decoration:underline;">Creating a non-secure application with default Secure Manager</span>**

[https://wiki.st.com/stm32mcu/wiki/Security:How_to_start_with_Secure_Manager_default_configuration_on_STM32H5](https://wiki.st.com/stm32mcu/wiki/Security:How_to_start_with_Secure_Manager_default_configuration_on_STM32H5)







