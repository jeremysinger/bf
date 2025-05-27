PREFIX ?= /usr/local
SRC = brainfxxx.c
CFLAGS = -std=c99 -Wall -pedantic
BIN = bf

.PHONY: clean uninstall

$(BIN): $(SRC)
	$(CC) $< $(CFLAGS) -o $@

$(BIN).dbg: $(SRC)
	$(CC) $< $(CFLAGS) -g -O0 -o $@

debug: ${BIN}.dbg

install: $(BIN)
	install $(BIN) $(PREFIX)/bin

clean:
	rm -f $(BIN) $(BIN).dbg

uninstall:
	rm -f $(PREFIX)/bin/$(BIN)
