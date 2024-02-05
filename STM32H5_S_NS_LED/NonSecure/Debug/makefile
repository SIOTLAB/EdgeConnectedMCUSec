################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Drivers/STM32H5xx_HAL_Driver/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := STM32H5_S_NS_LED_NonSecure
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
STM32H5_S_NS_LED_NonSecure.elf \

MAP_FILES += \
STM32H5_S_NS_LED_NonSecure.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
STM32H5_S_NS_LED_NonSecure.list \

OBJCOPY_BIN += \
STM32H5_S_NS_LED_NonSecure.bin \


# All Target
all:
	+@$(MAKE) --no-print-directory main-build && $(MAKE) --no-print-directory post-build

# Main-build Target
main-build: STM32H5_S_NS_LED_NonSecure.elf secondary-outputs

dependents:
	-cd C:/ST/STM32H5_S_NS_LED/Secure/Debug && $(MAKE) all

# Tool invocations
STM32H5_S_NS_LED_NonSecure.elf STM32H5_S_NS_LED_NonSecure.map: $(OBJS) $(USER_OBJS) C:/ST/STM32H5_S_NS_LED/Secure/Debug/STM32H5_S_NS_LED_Secure.elf C:\ST\STM32H5_S_NS_LED\NonSecure\STM32H573IIKXQ_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "STM32H5_S_NS_LED_NonSecure.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m33 -T"C:\ST\STM32H5_S_NS_LED\NonSecure\STM32H573IIKXQ_FLASH.ld" --specs=nosys.specs -Wl,-Map="STM32H5_S_NS_LED_NonSecure.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

STM32H5_S_NS_LED_NonSecure.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "STM32H5_S_NS_LED_NonSecure.list"
	@echo 'Finished building: $@'
	@echo ' '

STM32H5_S_NS_LED_NonSecure.bin: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "STM32H5_S_NS_LED_NonSecure.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) STM32H5_S_NS_LED_NonSecure.bin STM32H5_S_NS_LED_NonSecure.elf STM32H5_S_NS_LED_NonSecure.list STM32H5_S_NS_LED_NonSecure.map default.size.stdout
	-@echo ' '

post-build:
	"C:/ST/STM32H5_S_NS_LED/NonSecure/../ROT_Provisioning/postbuild.bat" "nonsecure"
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified post-build
C:/ST/STM32H5_S_NS_LED/Secure/Debug/STM32H5_S_NS_LED_Secure.elf:

-include ../makefile.targets
