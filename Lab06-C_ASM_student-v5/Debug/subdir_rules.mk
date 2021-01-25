################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
lab06.obj: ../lab06.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C5500 Compiler'
	"D:/ti/ccsv5/tools/compiler/c5500_4.4.1/bin/cl55" -v5509A --memory_model=large -g --include_path="D:/ti/ccsv5/tools/compiler/c5500_4.4.1/include" --define=c5509a --display_error_number --diag_warning=225 --ptrdiff_size=32 --printf_support=minimal --preproc_with_compile --preproc_dependency="lab06.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

mySub.obj: ../mySub.asm $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C5500 Compiler'
	"D:/ti/ccsv5/tools/compiler/c5500_4.4.1/bin/cl55" -v5509A --memory_model=large -g --include_path="D:/ti/ccsv5/tools/compiler/c5500_4.4.1/include" --define=c5509a --display_error_number --diag_warning=225 --ptrdiff_size=32 --printf_support=minimal --preproc_with_compile --preproc_dependency="mySub.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


