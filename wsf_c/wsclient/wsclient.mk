!include "..\build\versions.in"

AUTOCONF = ..\configure.in
!include $(AUTOCONF)

AXIS2_BIN_DIR=.\..\axis2c\build\axis2c-bin-$(AXIS2C_VERSION)-win32

CFLAGS = /nologo /D "WIN32" /w /D "_WINDOWS" /D "AXIS2_DECLARE_EXPORT" /D "_MBCS" \
	/I$(AXIS2_BIN_DIR)\include /I.\..\axis2c\neethi\include /I.\..\axis2c\neethi\src\util

!if "$(DEBUG)" == "1"
CFLAGS = $(CFLAGS) /D "_DEBUG" /Od /Z7 $(CRUNTIME)d
LDFLAGS = $(LDFLAGS) /DEBUG
!else
CFLAGS = $(CFLAGS) /D "NDEBUG" /O2 $(CRUNTIME)
LDFLAGS = $(LDFLAGS)
!endif

!if "$(ENABLE_RAMPARTC)" == "1"
OPFLAGS = mod_rampart.lib
!else
OPFLAGS =
!endif

wsclient:
	echo off

	if not exist int.msvc mkdir int.msvc
	cl.exe $(CFLAGS) src\*.c /Foint.msvc\ /c

	link.exe $(LDFLAGS) /LIBPATH:$(AXIS2_BIN_DIR)\lib int.msvc\*.obj axutil.lib  axis2_engine.lib \
	axis2_parser.lib axiom.lib neethi_util.lib axis2_http_sender.lib $(OPFLAGS) \
	/OUT:$(AXIS2_BIN_DIR)\bin\wsclient.exe

	if exist int.msvc rmdir /s /q int.msvc
	if not exist $(AXIS2_BIN_DIR)\bin\samples\wsclient mkdir $(AXIS2_BIN_DIR)\bin\samples\wsclient
	xcopy /S /Y samples\* $(AXIS2_BIN_DIR)\bin\samples\wsclient
	
