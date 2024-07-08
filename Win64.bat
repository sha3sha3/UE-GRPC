@echo off
title Easy gRPC
set execPath=%~dp0
echo Creating working directory
mkdir grpcsource
mkdir .\protobuf\win64
mkdir .\protobuf\proto
set cmakeVer= echo | cmake --version
echo %cmakeVer% 
set gitVer = echo | git --version
echo %gitVer%
git clone -b v1.51.1  https://github.com/grpc/grpc ./grpcsource
cd ./grpcsource
git submodule update --init
mkdir OpenSSL
mkdir .\OpenSSL\Win64
mkdir .\OpenSSL\Win64\include
mkdir .\OpenSSL\Win64\lib
set /p unrealDir=What is the Unreal Engine OpenSSL directory (e.g: C:\Program Files\Epic Games\UE_5.4\Engine\Source\ThirdParty\OpenSSL\1.1.1t)? 
xcopy "%unrealDir%\include\Win64\VS2015" .\OpenSSL\Win64\include /s /e /y
xcopy "%unrealDir%\lib\Win64\VS2015\Release" .\OpenSSL\Win64\lib /s /e /y
mkdir ZLib
mkdir .\ZLib\Win64
mkdir .\ZLib\Win64\include
mkdir .\ZLib\Win64\lib
set /p unrealDir=What is the Unreal Engine ZLib directory (e.g: C:\Program Files\Epic Games\UE_5.4\Engine\Source\ThirdParty\zlib\1.3)? 
xcopy "%unrealDir%\include" .\ZLib\Win64\include /s /e /y
xcopy "%unrealDir%\lib\Win64\Release" .\ZLib\Win64\lib /s /e /y
md .build
cd .build
mkdir libout
echo 1.Visual Studio 17 2022
echo 2.Visual Studio 16 2019
echo 3.Visual Studio 15 2017
CHOICE /C 123 /M "Please select your visual studio version:"
IF ERRORLEVEL 1 GOTO VS17
IF ERRORLEVEL 2 GOTO VS16
IF ERRORLEVEL 3 GOTO VS15



:VS17
echo Visual Studio 17 2022 selected
cmake ..^
 -G "Visual Studio 17 2022"^
 -A x64^
 -DLIBRARY_OUTPUT_PATH:PATH=%execPath%grpcsource/.build/libout^
 -DgRPC_SSL_PROVIDER=package^
 -DgRPC_ZLIB_PROVIDER=package^
 -DZLIB_ROOT=%execPath%grpcsource/ZLib/Win64/*^
 -DOPENSSL_ROOT_DIR=%execPath%grpcsource/OpenSSL/Win64/*
goto :build

:VS16
echo Visual Studio 16 2019 selected
cmake ..^
 -G "Visual Studio 16 2019"^
 -A x64^
 -DLIBRARY_OUTPUT_PATH:PATH=%execPath%grpcsource/.build/libout^
 -DgRPC_SSL_PROVIDER=package^
 -DgRPC_ZLIB_PROVIDER=package^
 -DZLIB_ROOT=%execPath%grpcsource/ZLib/Win64/*^
 -DOPENSSL_ROOT_DIR=%execPath%grpcsource/OpenSSL/Win64/*
goto :build

:VS15
echo Visual Studio 15 2017 selected
cmake ..^
 -G "Visual Studio 15 2017"^
 -A x64^
 -DLIBRARY_OUTPUT_PATH:PATH=%execPath%grpcsource/.build/libout^
 -DgRPC_SSL_PROVIDER=package^
 -DgRPC_ZLIB_PROVIDER=package^
 -DZLIB_ROOT=%execPath%grpcsource/ZLib/Win64/*^
 -DOPENSSL_ROOT_DIR=%execPath%grpcsource/OpenSSL/Win64/*
goto :build

:build
cmake --build . --config Release -j %NUMBER_OF_PROCESSORS%
GOTO COPYSTATICLIBS

:COPYSTATICLIBS
echo copying static libraries
mkdir %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\third_party\cares\cares\lib\Release\cares.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_bad_any_cast_impl.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_bad_optional_access.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_bad_variant_access.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_base.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_city.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_civil_time.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_cord.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_cordz_functions.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_cordz_handle.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_cordz_info.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_cordz_sample_token.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_cord_internal.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_debugging_internal.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_demangle_internal.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_examine_stack.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_exponential_biased.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_failure_signal_handler.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_flags.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_flags_commandlineflag.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_flags_commandlineflag_internal.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_flags_config.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_flags_internal.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_flags_marshalling.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_flags_parse.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_flags_private_handle_accessor.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_flags_program_name.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_flags_reflection.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_flags_usage.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_flags_usage_internal.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_graphcycles_internal.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_hash.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_hashtablez_sampler.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_int128.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_leak_check.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_log_severity.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_low_level_hash.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_malloc_internal.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_periodic_sampler.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_random_distributions.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_random_internal_distribution_test_util.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_random_internal_platform.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_random_internal_pool_urbg.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_random_internal_randen.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_random_internal_randen_hwaes.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_random_internal_randen_hwaes_impl.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_random_internal_randen_slow.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_random_internal_seed_material.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_random_seed_gen_exception.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_random_seed_sequences.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_raw_hash_set.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_raw_logging_internal.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_scoped_set_env.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_spinlock_wait.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_stacktrace.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_status.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_statusor.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_strerror.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_strings.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_strings_internal.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_str_format_internal.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_symbolize.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_synchronization.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_throw_delegate.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_time.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\absl_time_zone.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\address_sorting.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\third_party\cares\cares\lib\Release\cares.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\gpr.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%"grpcsource\.build\libout\Release\grpc++.lib" %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%"grpcsource\.build\libout\Release\grpc++_alts.lib" %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%"grpcsource\.build\libout\Release\grpc++_error_details.lib" %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%"grpcsource\.build\libout\Release\grpc++_reflection.lib" %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%"grpcsource\.build\libout\Release\grpc++_unsecure.lib" %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\grpc.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\grpcpp_channelz.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\grpc_plugin_support.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\grpc_unsecure.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\libprotobuf-lite.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\libprotobuf.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\libprotoc.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\re2.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\testing.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
copy %execPath%grpcsource\.build\libout\Release\upb.lib %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\lib\Win64
GOTO COPYINC


:COPYINC
echo copying includes
xcopy %execPath%grpcsource\include %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\include /s /e /y
mkdir %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\include\absl
xcopy %execPath%grpcsource\third_party\abseil-cpp\absl %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\include\absl /s /e /y
mkdir %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\include\google
xcopy %execPath%grpcsource\third_party\protobuf\src\google %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\include\google /s /e /y
del /S %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\include\*.txt
del /S %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\include\*.bazel
del /S %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\include\*.py
del /S %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\include\*.cc
del /S %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\include\*.sh
del /S %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\include\*.proto
del /S %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\include\*.md
GOTO COPYPROTOC

:COPYPROTOC
copy %execPath%grpcsource\.build\third_party\protobuf\Release\protoc.exe %execPath%protobuf\win64
copy %execPath%grpcsource\.build\Release\grpc_cpp_plugin.exe %execPath%protobuf\win64
GOTO COPYBUILDCS

:COPYBUILDCS
copy %execPath%UBT\Win.GrpcLib.Build.cs %execPath%UE-EasyGrpc\Source\Thirdparty\GrpcLib\GrpcLib.Build.cs
goto PROMPTCROSSCOMPILE

:PROMPTCROSSCOMPILE
SET /P WANNACROSSCOMPILE=Do you want to cross compile for Linux x86_64 (Y/[N])?
IF /I "%WANNACROSSCOMPILE%" NEQ "Y" GOTO END
cd %execPath%
call Linux64.bat

::Coming in future updates

::SET /P WANNACROSSCOMPILEARM=Do you want to cross compile for Linux ARM64 (Y/[N])?
::IF /I "%WANNACROSSCOMPILEARM%" NEQ "Y" GOTO END
::cd %execPath%
::call LinuxArm64.bat
goto END

:END
echo You can exit this windows
pause
