title Easy gRPC
set execPath=%~dp0
for /f %%i in ('cmd /c "wsl pwd"') do set wslExecPath=%%i
echo %wslExecPath% 
echo Creating working directory
mkdir grpcsource
mkdir .\protobuf\linux64
mkdir .\protobuf\proto
git clone -b v1.51.1  https://github.com/grpc/grpc ./grpcsource
cd ./grpcsource
git submodule update --init
:: rmdir /s cmake\build
mkdir cmake\build
cd cmake\build
mkdir libout
cd ../../
wsl sudo apt update
wsl sudo apt-get -y remove gcc
wsl sudo apt-get -y install clang lldb lld libc++-dev libc++abi-dev cmake
for /f %%i in ('wsl pwd') do set sourceDir=%%i
mkdir OpenSSL
mkdir .\OpenSSL\Linux64
mkdir .\OpenSSL\Linux64\include
mkdir .\OpenSSL\Linux64\lib
set /p unrealDir=What is the Unreal Engine OpenSSL directory (e.g: C:\Program Files\Epic Games\UE_5.4\Engine\Source\ThirdParty\OpenSSL\1.1.1t)? 
xcopy "%unrealDir%\include\Unix\" .\OpenSSL\Linux64\include /s /e /y
xcopy "%unrealDir%\lib\Unix\x86_64-unknown-linux-gnu" .\OpenSSL\Linux64\lib /s /e /y
mkdir ZLib
mkdir .\ZLib\Linux64
mkdir .\ZLib\Linux64\include
mkdir .\ZLib\Linux64\lib
set /p unrealDir=What is the Unreal Engine ZLib directory (e.g: C:\Program Files\Epic Games\UE_5.4\Engine\Source\ThirdParty\zlib\1.3)? 
xcopy "%unrealDir%\include" .\ZLib\Linux64\include /s /e /y
copy "%unrealDir%\lib\Unix\x86_64-unknown-linux-gnu\Release\libz.a" .\ZLib\Linux64\lib\libz.a
cd cmake\build
wsl cmake ../../^
 -DCMAKE_BUILD_TYPE=Release^
 -DgRPC_INSTALL=ON^
 -DgRPC_SSL_PROVIDER=package^
 -DBUILD_SHARED_LIBS=OFF^
 -DgRPC_PROTOBUF_PACKAGE_TYPE=MODULE^
 -Dprotobuf_BUILD_LIBPROTOC=ON^
 -Dprotobuf_BUILD_PROTOC_BINARIES=ON^
 -Dprotobuf_BUILD_SHARED_LIBS=OFF^
 -Dprotobuf_INSTALL=ON^
 -DgRPC_ZLIB_PROVIDER=package^
 -DZLIB_ROOT=%sourceDir%/ZLib/Linux64/*^
 -DOPENSSL_ROOT_DIR=%sourceDir%/OpenSSL/Linux64/*^
 -DLIBRARY_OUTPUT_PATH:PATH=%sourceDir%/cmake/build/libout^
 -DCMAKE_C_FLAGS="${CMAKE_C_FLAGS} "^
 -DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -stdlib=libc++"

for /f %%i in ('cmd /c "wsl echo | wsl grep cpu\\scores /proc/cpuinfo | wsl uniq | wsl awk '{print $4}'"') do set PHYSICAL_CORES=%%i
echo Pyhical cores: %PHYSICAL_CORES%
wsl make -j %PHYSICAL_CORES%

cd ../../
rmdir /s third_party\abseil-cpp\build
mkdir third_party\abseil-cpp\build
cd third_party\abseil-cpp\build
wsl cmake ../^
 -DCMAKE_BUILD_TYPE=Release^
 -DBUILD_SHARED_LIBS=ON^
 -DOPENSSL_ROOT_DIR=%sourceDir%/OpenSSL/Linux64/*^
 -DCMAKE_C_FLAGS="${CMAKE_C_FLAGS} "^
 -DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -stdlib=libc++"
wsl make -j %PHYSICAL_CORES%


goto COPYSTATICLIBS



:COPYSTATICLIBS
mkdir %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
echo copying static libraries
copy %execPath%grpcsource\cmake\build\third_party\cares\cares\lib\libcares.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_bad_any_cast_impl.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_bad_optional_access.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_bad_variant_access.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_base.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_city.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_civil_time.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_cord.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_cordz_functions.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_cordz_handle.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_cordz_info.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_cordz_sample_token.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_cord_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_debugging_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_demangle_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_examine_stack.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_exponential_biased.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_failure_signal_handler.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_commandlineflag.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_commandlineflag_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_config.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_marshalling.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_parse.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_private_handle_accessor.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_program_name.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_reflection.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_usage.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_flags_usage_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_graphcycles_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_hash.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_hashtablez_sampler.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_int128.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_leak_check.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_log_severity.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_low_level_hash.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_malloc_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_periodic_sampler.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_distributions.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_internal_distribution_test_util.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_internal_platform.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_internal_pool_urbg.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_internal_randen.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_internal_randen_hwaes.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_internal_randen_hwaes_impl.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_internal_randen_slow.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_seed_gen_exception.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_random_seed_sequences.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_raw_hash_set.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_raw_logging_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_scoped_set_env.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_spinlock_wait.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_stacktrace.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_status.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_statusor.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_strerror.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_strings.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_strings_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_str_format_internal.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_symbolize.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_synchronization.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_throw_delegate.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_time.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libabsl_time_zone.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libaddress_sorting.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libgpr.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%"grpcsource\cmake\build\libout\libgrpc++.a" %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%"grpcsource\cmake\build\libout\libgrpc++_alts.a" %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%"grpcsource\cmake\build\libout\libgrpc++_error_details.a" %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%"grpcsource\cmake\build\libout\libgrpc++_reflection.a" %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%"grpcsource\cmake\build\libout\libgrpc++_unsecure.a" %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libgrpc.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libgrpcpp_channelz.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libgrpc_plugin_support.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libgrpc_unsecure.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libprotobuf-lite.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libprotobuf.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libprotoc.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libre2.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
copy %execPath%grpcsource\cmake\build\libout\libupb.a %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Linux64
goto COPYDYNAMICLIBS

:COPYDYNAMICLIBS
echo copying dynamic libraries
mkdir %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\bin\Linux64
copy %execPath%grpcsource\third_party\abseil-cpp\build\absl\random\libabsl_random_internal_seed_material.so.2206.0.0 %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\bin\Linux64\libabsl_random_internal_seed_material.so
goto COPYPROTOC

:COPYPROTOC
copy %execPath%grpcsource\cmake\build\third_party\protobuf\protoc-3.21.6.0 %execPath%protobuf\linux64\protoc
copy %execPath%grpcsource\cmake\build\grpc_cpp_plugin %execPath%protobuf\linux64
GOTO COPYBUILDCS

:COPYBUILDCS
copy %execPath%UBT\Multi.GrpcLib.Build.cs %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\GrpcLib.Build.cs
goto END

:END
pause
