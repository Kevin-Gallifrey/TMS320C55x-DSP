################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
DspExam2020A.obj: ../DspExam2020A.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C5500 Compiler'
	"D:/ti/ccsv5/tools/compiler/c5500_4.4.1/bin/cl55" -v5509A --memory_model=large -g --include_path="D:/ti/ccsv5/tools/compiler/c5500_4.4.1/include" --define=c5509a --display_error_number --diag_warning=225 --ptrdiff_size=32 --preproc_with_compile --preproc_dependency="DspExam2020A.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

MedianImageSub.obj: ../MedianImageSub.asm $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C5500 Compiler'
	"D:/ti/ccsv5/tools/compiler/c5500_4.4.1/bin/cl55" -v5509A --memory_model=large -g --include_path="D:/ti/ccsv5/tools/compiler/c5500_4.4.1/include" --define=c5509a --display_error_number --diag_warning=225 --ptrdiff_size=32 --preproc_with_compile --preproc_dependency="MedianImageSub.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


