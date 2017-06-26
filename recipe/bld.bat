mkdir build_release
if errorlevel 1 exit 1

cd build_release
if errorlevel 1 exit 1

cmake "%SRC_DIR%" ^
    -G "NMake Makefiles" ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DINSTALL_HEADERS=1 ^
    -DBUILD_SHARED_LIBS=1 ^
    -DBUILD_STATIC_LIBS=1 ^
    -DBUILD_TESTING=1
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake test
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
