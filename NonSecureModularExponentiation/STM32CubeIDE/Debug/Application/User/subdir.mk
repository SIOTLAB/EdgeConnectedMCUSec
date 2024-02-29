################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/ST/SeniorDesignProjects/NonSecureModularExponentiation/Src/ciphertext.c \
C:/ST/SeniorDesignProjects/NonSecureModularExponentiation/Src/main.c \
C:/ST/SeniorDesignProjects/NonSecureModularExponentiation/Src/plaintext.c \
C:/ST/SeniorDesignProjects/NonSecureModularExponentiation/Src/rsa_priv_2048.c \
C:/ST/SeniorDesignProjects/NonSecureModularExponentiation/Src/rsa_pub_2048.c \
C:/ST/SeniorDesignProjects/NonSecureModularExponentiation/Src/stm32h5xx_hal_msp.c \
C:/ST/SeniorDesignProjects/NonSecureModularExponentiation/Src/stm32h5xx_it.c \
../Application/User/syscalls.c \
../Application/User/sysmem.c 

OBJS += \
./Application/User/ciphertext.o \
./Application/User/main.o \
./Application/User/plaintext.o \
./Application/User/rsa_priv_2048.o \
./Application/User/rsa_pub_2048.o \
./Application/User/stm32h5xx_hal_msp.o \
./Application/User/stm32h5xx_it.o \
./Application/User/syscalls.o \
./Application/User/sysmem.o 

C_DEPS += \
./Application/User/ciphertext.d \
./Application/User/main.d \
./Application/User/plaintext.d \
./Application/User/rsa_priv_2048.d \
./Application/User/rsa_pub_2048.d \
./Application/User/stm32h5xx_hal_msp.d \
./Application/User/stm32h5xx_it.d \
./Application/User/syscalls.d \
./Application/User/sysmem.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/ciphertext.o: C:/ST/SeniorDesignProjects/NonSecureModularExponentiation/Src/ciphertext.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H573xx -c -I../../Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32H5xx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32H573I-DK -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/main.o: C:/ST/SeniorDesignProjects/NonSecureModularExponentiation/Src/main.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H573xx -c -I../../Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32H5xx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32H573I-DK -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/plaintext.o: C:/ST/SeniorDesignProjects/NonSecureModularExponentiation/Src/plaintext.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H573xx -c -I../../Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32H5xx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32H573I-DK -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/rsa_priv_2048.o: C:/ST/SeniorDesignProjects/NonSecureModularExponentiation/Src/rsa_priv_2048.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H573xx -c -I../../Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32H5xx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32H573I-DK -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/rsa_pub_2048.o: C:/ST/SeniorDesignProjects/NonSecureModularExponentiation/Src/rsa_pub_2048.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H573xx -c -I../../Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32H5xx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32H573I-DK -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/stm32h5xx_hal_msp.o: C:/ST/SeniorDesignProjects/NonSecureModularExponentiation/Src/stm32h5xx_hal_msp.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H573xx -c -I../../Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32H5xx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32H573I-DK -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/stm32h5xx_it.o: C:/ST/SeniorDesignProjects/NonSecureModularExponentiation/Src/stm32h5xx_it.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H573xx -c -I../../Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32H5xx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32H573I-DK -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/%.o Application/User/%.su Application/User/%.cyclo: ../Application/User/%.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H573xx -c -I../../Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc -I../../Drivers/STM32H5xx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32H5xx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32H573I-DK -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-User

clean-Application-2f-User:
	-$(RM) ./Application/User/ciphertext.cyclo ./Application/User/ciphertext.d ./Application/User/ciphertext.o ./Application/User/ciphertext.su ./Application/User/main.cyclo ./Application/User/main.d ./Application/User/main.o ./Application/User/main.su ./Application/User/plaintext.cyclo ./Application/User/plaintext.d ./Application/User/plaintext.o ./Application/User/plaintext.su ./Application/User/rsa_priv_2048.cyclo ./Application/User/rsa_priv_2048.d ./Application/User/rsa_priv_2048.o ./Application/User/rsa_priv_2048.su ./Application/User/rsa_pub_2048.cyclo ./Application/User/rsa_pub_2048.d ./Application/User/rsa_pub_2048.o ./Application/User/rsa_pub_2048.su ./Application/User/stm32h5xx_hal_msp.cyclo ./Application/User/stm32h5xx_hal_msp.d ./Application/User/stm32h5xx_hal_msp.o ./Application/User/stm32h5xx_hal_msp.su ./Application/User/stm32h5xx_it.cyclo ./Application/User/stm32h5xx_it.d ./Application/User/stm32h5xx_it.o ./Application/User/stm32h5xx_it.su ./Application/User/syscalls.cyclo ./Application/User/syscalls.d ./Application/User/syscalls.o ./Application/User/syscalls.su ./Application/User/sysmem.cyclo ./Application/User/sysmem.d ./Application/User/sysmem.o ./Application/User/sysmem.su

.PHONY: clean-Application-2f-User

