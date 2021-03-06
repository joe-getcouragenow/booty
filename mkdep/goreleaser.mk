# goreleaser (gor)
# https://github.com/goreleaser/goreleaser

### BIN
GOR_BIN=goreleaser
# https://github.com/goreleaser/goreleaser/releases/tag/v0.149.0
# https://github.com/goreleaser/goreleaser/releases/download/v0.149.0/goreleaser_Windows_x86_64.zip
# https://github.com/goreleaser/goreleaser/releases/download/v0.149.0/goreleaser_Darwin_x86_64.tar.gz
# https://github.com/goreleaser/goreleaser/releases/download/v0.149.0/goreleaser_Linux_arm64.tar.gz
GOR_BIN_VERSION=0.149.0
ifeq ($(GOOS),darwin)
    GOR_BIN_PLATFORM:=Darwin_x86_64.tar.gz
endif
ifeq ($(GOOS),windows)
    GOR_BIN_PLATFORM:=Windows_x86_64.zip
endif
ifeq ($(GOOS),linux)
    GOR_BIN_PLATFORM:=Linux_x86_64.tar.gz
endif
GOR_BIN_FILE=goreleaser_$(GOR_BIN_PLATFORM)
GOR_BIN_URL=https://github.com/goreleaser/goreleaser/releases/download/v$(GOR_BIN_VERSION)/$(GOR_BIN_FILE)


gor-print:
	@echo -- GORELEASE Dep --
	@echo GOR_BIN_VERSION: 	$(GOR_BIN_VERSION)
	@echo GOR_BIN_URL: 		$(GOR_BIN_URL)
	@echo GOR_BIN_URLFILE: 	$(GOR_BIN_FILE)
	@echo GOR_BIN: 			$(GOR_BIN)
	@echo
	
gor-dep: gor-dep-delete
	$(MAKE) DWN_URL=$(GOR_BIN_URL) \
		DWN_FILENAME=$(GOR_BIN_FILE) \
 		DWN_BIN_NAME=$(GOR_BIN) \
 		DWN_BIN_OUTPUT_DIR=$(INSTALL_DOWNLOAD_DIR) dwn-download

gor-dep-delete:
	$(MAKE) DWN_URL=$(GOR_BIN_URL) \
		DWN_FILENAME=$(GOR_BIN_FILE) \
		DWN_BIN_NAME=$(GOR_BIN) \
		DWN_BIN_OUTPUT_DIR=$(INSTALL_DOWNLOAD_DIR) dwn-delete


	