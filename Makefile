# Default to 'none' if not passed
BUILD_TYPE ?= none

all:
	@echo ">> Build type is: $(BUILD_TYPE)"

ifeq ($(BUILD_TYPE),nightly)
	@echo "🌙 Running Nightly build steps"
	# commands for nightly build
endif

ifeq ($(BUILD_TYPE),rc)
	@echo "🧪 Running RC build steps"
	# commands for RC build
endif

ifeq ($(BUILD_TYPE),release)
	@echo "🚀 Running Release build steps"
	# commands for Release build
endif

ifeq ($(BUILD_TYPE),none)
	@echo "❌ No valid build type selected. Exiting."
	exit 1
endif
