################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
C:/Lab05-ASM-Division_Teaching/Debug/lab05.obj: ../lab05.asm $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C5500 Compiler'
	"D:/ti/ccsv5/tools/compiler/c5500_4.4.1/bin/cl55" -v5509 --memory_model=large -g --include_path="D:/ti/ccsv5/tools/compiler/c5500_4.4.1/include" --include_path="D:/ti/xdais_7_21_01_07/packages/ti/xdais" --include_path="/include" --define="_DEBUG" --quiet --display_error_number --obj_directory="C:/Lab05-ASM-Division_Teaching/Debug" --preproc_with_compile --preproc_dependency="lab05.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


