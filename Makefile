
RES=res
RES_DEPS=$(shell find $(RES)/) 
BUILD=build/
OUT=$(BUILD)/main.lua

SYLT=sylt-lang/target/release/sylt
SYLT_DEPS=$(shell find sylt-lang/) 

.phony: run

run: $(OUT) $(RES_DEPS)
	cp -r $(RES) $(BUILD)/$(RES)
	love $(BUILD)

$(OUT): $(SYLT)
	mkdir $(BUILD)
	$(SYLT) main.sy -o $(OUT)

$(SYLT): $(SYLT_DEPS)
	cd sylt-lang/; cargo build --release

