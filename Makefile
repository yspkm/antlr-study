JC = javac
JFLAGS = -cp ".:src/antlr:lib/antlr-4.9.2-complete.jar"\
         -d bin\
         -sourcepath src/main\
         -sourcepath src/antlr
RULE = src/antlr/Expr.g4
ANTLR = java -jar lib/antlr-4.9.2-complete.jar -visitor
SRC_DIR = src/main
OUT_DIR = bin
MAIN_CLASS = program
grun=java org.antlr.v4.gui.TestRig

# Default output file
OUTPUT_FILE = dat/output.txt

# 타겟 정의
.PHONY: all clean run

all: $(OUT_DIR)/$(MAIN_CLASS).class

$(OUT_DIR)/%.class: $(SRC_DIR)/%.java
	mkdir -p $(OUT_DIR)
	$(ANTLR) $(RULE)
	$(JC) $(JFLAGS) $<

clean:
	@rm -rf $(OUT_DIR)

run: all
ifeq ($(strip $(INPUT)),)
	@java -cp "$(OUT_DIR):lib/antlr-4.9.2-complete.jar"\
           $(MAIN_CLASS)
else 
	@java -cp "$(OUT_DIR):lib/antlr-4.9.2-complete.jar"\
           $(MAIN_CLASS) < $(INPUT)
endif

