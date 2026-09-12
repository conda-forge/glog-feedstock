rem Windows ARM64 stack walking requires a frame-pointer chain.
if "%target_platform%"=="win-arm64" set "CL=%CL% /Oy-"
mkdir build_ && cd build_

cmake -GNinja ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DBUILD_SHARED_LIBS=ON ^
    -DBUILD_TESTING=ON ^
    ..
if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1
