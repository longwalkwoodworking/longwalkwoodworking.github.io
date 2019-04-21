SRC_IMAGE_DIR := src-images
TARGET_IMAGE_DIR := images

SIZE := 2000
SRC_IMAGES := $(wildcard $(SRC_IMAGE_DIR)/*)
IMAGES := $(SRC_IMAGES:$(SRC_IMAGE_DIR)/%=$(TARGET_IMAGE_DIR)/%)

.PHONY: all
all: $(IMAGES)

$(TARGET_IMAGE_DIR)/%: $(SRC_IMAGE_DIR)/% Makefile | $(TARGET_IMAGE_DIR)
	convert -resize $(SIZE)x$(SIZE) $< $@

$(TARGET_IMAGE_DIR):
	mkdir $@
