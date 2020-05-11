PORT		=	/dev/ttyUSB0
BAUD		=	115200
SRC_FILES	=	$(wildcard *.py)

upload: put reset

put:
	@echo "Uploading..."
	@echo $(SRC_FILES)
	@rshell --port $(PORT) --baud $(BAUD) cp $(SRC_FILES) /pyboard/

get:
	@echo "Getting Files"
	@echo $(DEVICE_FILES)
	@rshell --port $(PORT) --baud $(BAUD) cp /pyboard/*.py .

reset:
	@echo "Resetting..."
	ampy --port $(PORT) --baud $(BAUD) reset