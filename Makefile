# Makefile for CreoDAMO project

# Variables
CREOLANG_COMPILER = creoc
SOURCE_DIR = src
BUILD_DIR = build
README = README.md

# Extracting information from README.md
VERSION = $(shell grep 'Version:' $(README) | cut -d' ' -f2)

# Phony targets for clarity
.PHONY: all read_from_readme build compile setup_services clean run

# Default target
all: read_from_readme build

# Extract information from README.md
read_from_readme:
    @echo "Reading from README.md"
    @echo "Version: $(VERSION)"

# Build the project
build: compile setup_services

# Compile CreoLang source files
compile: $(BUILD_DIR)
    @echo "Compiling CreoLang source files..."
    $(CREOLANG_COMPILER) $(SOURCE_DIR)/*.creo -o $(BUILD_DIR)/

# Create build directory if it doesn't exist
$(BUILD_DIR):
    @echo "Creating build directory..."
    mkdir -p $(BUILD_DIR)

# Set up required services
setup_services:
    @echo "Setting up required services..."
    # Commands to set up services

# Clean the build directory
clean:
    @echo "Cleaning build directory..."
    rm -rf $(BUILD_DIR)/*

# Run the application
run:
    @echo "Running the application..."
    # Command to run the CreoDAMO application

# Dependency checks for source files
$(BUILD_DIR)/%: $(SOURCE_DIR)/%
    @echo "Building $@..."
    $(CREOLANG_COMPILER) $< -o $@

# Conditional execution example
ifeq ($(VERSION),1.0)
    @echo "Special setup for version 1.0"
endif

# Additional targets as needed
