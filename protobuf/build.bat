@echo off
title Easy gRPC
set execPath=%~dp0
mkdir build
del build\* /q

for /r %%i in (.\protoc\*) do (
    echo building %%i
    %execPath%win64\protoc --grpc_out=%execPath%build --cpp_out=%execPath%build --plugin=protoc-gen-grpc=%execPath%win64\grpc_cpp_plugin.exe  -I %execPath%protoc %%i
) 

echo building GrpcHelper.h

echo // Copyright sha3sha3. All Rights Reserved. > %execPath%headers/GrpcHelper.h
echo #pragma once >> %execPath%headers/GrpcHelper.h
echo THIRD_PARTY_INCLUDES_START >> %execPath%headers/GrpcHelper.h

for %%X in ("%execPath%\build\*.h") do echo #include "%%~nX.h"  >> %execPath%headers/GrpcHelper.h

type  %execPath%headers\Part.GrpcHelper.h >> %execPath%headers\GrpcHelper.h

echo copying source files

for %%X in ("%execPath%\build\*.cc") do copy %execPath%build\%%~nX.cc %execPath%..\UE-EasyGrpc\Source\EasyGrpc\Private

echo copying headers

for %%X in ("%execPath%\build\*.h") do copy %execPath%build\%%~nX.h %execPath%..\UE-EasyGrpc\Source\EasyGrpc\Public

copy %execPath%headers\GrpcHelper.h %execPath%..\UE-EasyGrpc\Source\EasyGrpc\Public

pause