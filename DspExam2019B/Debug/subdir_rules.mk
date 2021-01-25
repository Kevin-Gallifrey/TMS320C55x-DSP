################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
DspExam2019B.obj: ../DspExam2019B.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C5500 Compiler'
	"D:/ti/ccsv5/tools/compiler/c5500_4.4.1/bin/cl55" -v5509A --memory_model=large -g --include_path="D:/ti/ccsv5/tools/compiler/c5500_4.4.1/include" --define=c5509a --display_error_number --diag_warning=225 --ptrdiff_size=32 --preproc_with_compile --preproc_dependency="DspExam2019B.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

SmoothImageSub.obj: ../SmoothImageSub.asm $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C5500 Compiler'
	"D:/ti/ccsv5/tools/compiler/c5500_4.4.1/bin/cl55" -v5509A --memory_model=large -g --include_path="D:/ti/ccsv5/tools/compiler/c5500_4.4.1/include" --define=c5509a --display_error_number --diag_warning=225 --ptrdiff_size=32 --preproc_with_compile --preproc_dependency="SmoothImageSub.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


