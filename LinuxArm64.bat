title Easy gRPC
set execPath=%~dp0
for /f %%i in ('cmd /c "wsl pwd"') do set wslExecPath=%%i
echo %wslExecPath% 
echo Creating working directory
mkdir grpcsource
mkdir .\protobuf\LinuxArm64
mkdir .\protobuf\proto
git clone -b v1.51.1  https://github.com/grpc/grpc ./grpcsource
cd ./grpcsource
git submodule update --init
:: rmdir /s cmake\build
mkdir cmake\build
cd cmake\build
mkdir libout
cd ../../
wsl sudo apt-get -y remove clang lldb lld libc++-dev libc++abi-dev
wsl sudo dpkg --add-architecture arm64
wsl sudo apt update
wsl sudo apt-get -y remove gcc
::wsl sudo apt-get -y install software-properties-common
::clang-15:arm64 same as the cross compile toolchain for UE
::wsl sudo add-apt-repository 'deb http://ftp.de.debian.org/debian bullseye main'
wsl sudo apt-get -y install clang-15:arm64 lldb-15:arm64 lld-15:arm64 libc++-15-dev:arm64 libc++abi-15-dev:arm64 cmake
for /f %%i in ('wsl pwd') do set sourceDir=%%i
mkdir OpenSSL
mkdir .\OpenSSL\LinuxArm64
mkdir .\OpenSSL\LinuxArm64\include
mkdir .\OpenSSL\LinuxArm64\lib
set /p unrealDir=What is the Unreal Engine OpenSSL directory (e.g: C:\Program Files\Epic Games\UE_5.4\Engine\Source\ThirdParty\OpenSSL\1.1.1t)? 
xcopy "%unrealDir%\include\Unix\" .\OpenSSL\LinuxArm64\include /s /e /y
xcopy "%unrealDir%\lib\Unix\aarch64-unknown-linux-gnueabi" .\OpenSSL\LinuxArm64\lib /s /e /y
mkdir ZLib
mkdir .\ZLib\LinuxArm64
mkdir .\ZLib\LinuxArm64\include
mkdir .\ZLib\LinuxArm64\lib
set /p unrealDir=What is the Unreal Engine ZLib directory (e.g: C:\Program Files\Epic Games\UE_5.4\Engine\Source\ThirdParty\zlib\1.3)? 
xcopy "%unrealDir%\include" .\ZLib\LinuxArm64\include /s /e /y
copy "%unrealDir%\lib\Unix\aarch64-unknown-linux-gnueabi\Release\libz.a" .\ZLib\LinuxArm64\lib\libz.a
wsl sudo ln -s /usr/bin/clang-15 /usr/bin/clang
wsl sudo ln -s /usr/bin/clang++-15 /usr/bin/clang++
cd cmake\build
wsl cmake ../../^
 -DCMAKE_TOOLCHAIN_FILE=%wslExecPath%/CrossCompileArm64.cmake^
 -DSOURCE_DIR:STRING=%wslExecPath%^
 -DgRPC_INSTALL=ON^
 -DgRPC_SSL_PROVIDER=package^
 -DBUILD_SHARED_LIBS=OFF^
 -DgRPC_PROTOBUF_PACKAGE_TYPE=MODULE^
 -Dprotobuf_BUILD_LIBPROTOC=ON^
 -Dprotobuf_BUILD_PROTOC_BINARIES=ON^
 -Dprotobuf_BUILD_SHARED_LIBS=OFF^
 -Dprotobuf_INSTALL=ON^
 -DgRPC_ZLIB_PROVIDER=package^
 -DZLIB_ROOT=%sourceDir%/ZLib/LinuxArm64/*^
 -DOPENSSL_ROOT_DIR=%sourceDir%/OpenSSL/LinuxArm64/*^
 -DLIBRARY_OUTPUT_PATH:PATH=%sourceDir%/cmake/build/libout^

for /f %%i in ('cmd /c "wsl echo | wsl grep cpu\\scores /proc/cpuinfo | wsl uniq | wsl awk '{print $4}'"') do set PHYSICAL_CORES=%%i
echo Pyhical cores: %PHYSICAL_CORES%
wsl make -j %PHYSICAL_CORES%

cd ../../
rmdir /s third_party\abseil-cpp\build
mkdir third_party\abseil-cpp\build
cd third_party\abseil-cpp\build
wsl cmake ../^
 -DCMAKE_TOOLCHAIN_FILE=%wslExecPath%/CrossCompileArm64.cmake^
 -DBUILD_SHARED_LIBS=ON^
 -DOPENSSL_ROOT_DIR=%sourceDir%/OpenSSL/LinuxArm64/*^
 
wsl make -j %PHYSICAL_CORES%


goto COPYSTATICLIBS



:COPYSTATICLIBS
mkdir %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
echo copying static libraries
copy %execPath%grpcsource\cmake\build\third_party\cares\cares\lib\libcares.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_bad_any_cast_impl.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_bad_optional_access.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_bad_variant_access.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_base.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_city.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_civil_time.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_cord.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_cordz_functions.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_cordz_handle.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_cordz_info.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_cordz_sample_token.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_cord_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_debugging_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_demangle_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_examine_stack.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_exponential_biased.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_failure_signal_handler.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_commandlineflag.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_commandlineflag_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_config.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_marshalling.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_parse.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_private_handle_accessor.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_program_name.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_reflection.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_usage.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_usage_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_graphcycles_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_hash.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_hashtablez_sampler.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_int128.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_leak_check.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_log_severity.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_low_level_hash.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_malloc_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_periodic_sampler.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_distributions.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_internal_distribution_test_util.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_internal_platform.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_internal_pool_urbg.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_internal_randen.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_internal_randen_hwaes.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_internal_randen_hwaes_impl.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_internal_randen_slow.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_seed_gen_exception.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_seed_sequences.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_raw_hash_set.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_raw_logging_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_scoped_set_env.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_spinlock_wait.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_stacktrace.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_status.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_statusor.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_strerror.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_strings.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_strings_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_str_format_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_symbolize.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_synchronization.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_throw_delegate.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_time.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libabsl_time_zone.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libaddress_sorting.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libgpr.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%"grpcsource\cmake\build\libout\libgrpc++.a" %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%"grpcsource\cmake\build\libout\libgrpc++_alts.a" %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%"grpcsource\cmake\build\libout\libgrpc++_error_details.a" %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%"grpcsource\cmake\build\libout\libgrpc++_reflection.a" %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%"grpcsource\cmake\build\libout\libgrpc++_unsecure.a" %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libgrpc.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libgrpcpp_channelz.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libgrpc_plugin_support.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libgrpc_unsecure.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libprotobuf-lite.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libprotobuf.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libprotoc.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libre2.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libupb.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libz.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\LinuxArm64
goto COPYDYNAMICLIBS

:COPYDYNAMICLIBS
echo copying dynamic libraries
mkdir %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\bin\LinuxArm64
copy %execPath%grpcsource\cmake\build\libout\libz.so.1.2.13 %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\bin\LinuxArm64\libz.so
copy %execPath%grpcsource\third_party\abseil-cpp\build\absl\random\libabsl_random_internal_seed_material.so.2206.0.0 %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\bin\LinuxArm64\libabsl_random_internal_seed_material.so
goto COPYPROTOC

:COPYPROTOC
copy %execPath%grpcsource\cmake\build\third_party\protobuf\protoc-3.21.6.0 %execPath%protobuf\LinuxArm64\protoc
copy %execPath%grpcsource\cmake\build\grpc_cpp_plugin %execPath%protobuf\LinuxArm64
GOTO COPYBUILDCS

:COPYBUILDCS
copy %execPath%UBT\MultiAmr64.GrpcLib.Build %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\GrpcLib.Build.cs
goto END

:END
pause
