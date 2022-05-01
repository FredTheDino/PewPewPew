
SYLT_DEPS=$(shell find sylt-lang/) 
SYLT=sylt-lang/target/release/sylt
OUT=main.lua

.phony: run

$(OUT): $(SYLT)
	$(SYLT) main.sy -o $(OUT)

run: $(OUT)
	love .

$(SYLT): $(SYLT_DEPS)
	cd sylt-lang/; cargo build --release

