VERSION=$(shell node -v)
VERSIONFILE=./VERSION

all: ver test

ver:
	echo Node version is $(VERSION).
	echo $(VERSION) >> $(VERSIONFILE)

test:
	node array.js
	node string.js

