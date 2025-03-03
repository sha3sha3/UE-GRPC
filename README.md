<h1 align="center">
  <br>
    <img src="UE-EasyGrpc/Resources/Icon128.png" alt="Logo" width="150">
  <br>
  Easy GRPG, the easiest way to cross compile GRPC for Unreal Engine.
  <br>
</h1>

# Easy GRPC
Easy Grpc is an automation script and plugin that enable to cross compile [GRPC](https://grpc.io/) for [Unreal Engine 5](https://www.unrealengine.com/en-US) on Windows, with minimal effort and without the need for any package manager such as [Conan](https://docs.conan.io/2/), [vcpkg](https://vcpkg.io/en/).

# Features
- Cross compile on Windows.
- Cross platform support.
- Protoc generator script.
- Auto generated helper header for the plugin.
- Auto generated [UBT](https://dev.epicgames.com/documentation/en-us/unreal-engine/unreal-build-tool-in-unreal-engine?application_version=5.3) Build.cs file for your platform.

# Prerequisites
- Unreal Engine 4/5  [Epic Launcher](https://www.unrealengine.com/en-US/download) binary version or [Built from source](https://docs.unrealengine.com/4.27/en-US/ProductionPipelines/DevelopmentSetup/BuildingUnrealEngine/) version.
- [Visual Studio](https://visualstudio.microsoft.com/) 15,16 or 17 depends on your Unreal Engine version.
- [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) if you want to cross compile for linux (optional).
- [Ubuntu](https://apps.microsoft.com/search?query=Ubuntu&hl=en-us&gl=US) 20.04, 22.04, or 24.04, for cross compile (optional).

# Supported Platforms
- Windows x86-64.
- Linux x86-64.
- Linux ARM64 (need some tinkering at the moment).

# Directory Tree
```bash
.
├── protobuf
│   ├── build.bat #build your protoc files and add to UE-EasyGrpc Plugin
│   ├── headers
│   │   ├── GrpcHelper.h
│   │   └── Part.GrpcHelper.h
│   └── protoc #Directory for your protoc to build
│       └── mathtest.protoc #example from https://medium.com/@andrewvetovitz/grpc-c-introduction-45a66ca9461f
├── UBT #Unreal build tool temp files
│   ├── MultiAmr64.GrpcLib.Build.cs
│   ├── Multi.GrpcLib.Build.cs
│   └── Win.GrpcLib.Build.cs
├── UE-EasyGrpc #EasyGrpc plugin
│   ├── EasyGrpc.uplugin
│   ├── Resources
│   │   └── Icon128.png
│   └── Source
│       ├── EasyGrpc
│       │   ├── EasyGrpc.Build.cs
│       │   ├── Private
│       │   │   ├── EasyGrpc.cpp
│       │   │   └── EasyGrpcSubsystem.cpp #math test example
│       │   └── Public
│       │       ├── EasyGrpc.h
│       │       └── EasyGrpcSubsystem.h
│       └── Thirdparty
│           └── GrpcLib
│               └── Licenses
│                   ├── LICENSE.easygrpc.txt
│                   ├── LICENSE.librdkafka.txt
│                   ├── LICENSE.lz4.txt
│                   ├── LICENSE.modern-cpp-kafka.txt
│                   ├── LICENSE.openssl.txt
│                   ├── LICENSE.zlib.txt
│                   └── LICENSE.zstd.txt
├── Win64.bat #cross compile batch file
├── ThirdPartyLib.cmake
├── CrossCompileArm64.cmake
├── CrossCompile.cmake
├── GrpcConfiguration.cmake
├── LICENSE
├── Linux64.bat
├── LinuxArm64.bat
└── README.md
```
# Building UE-EasyGrpc steps
- Build GrpcLib for Windows.
- Build GrpcLib for Linux (optional).
- Build your proto files using build.bat.

# Building GrpcLib for Windows
**🚨 Warning: Attempting to clone and build this project in a directory path containing spaces may lead to unexpected errors. For best results, consider choosing a path without spaces.**

Assuming that you already fulfill the prerequisites, all what you need to do is cloning this repo to a new folder, and open CMD then navigate to the same folder and run Win64.bat by typing Win64.bat to your CMD followed by pressing ENTER.
The Automation script is going to build grpc for Windows, then create the respective windows version of GrpcLib module for Unreal engine, including the GrpcLib.Build.cs.

You are going to be asked to provide couple of inputs such as:
```bash
C:\grpc> What is the Unreal Engine OpenSSL directory (e.g: C:\Program Files\Epic Games\UE_5.4\Engine\Source\ThirdParty\OpenSSL\1.1.1t)? #provide the openssl directory including the openssl version from the Unreal Engine version where you want to build the Library for.
C:\grpc> What is the Unreal Engine ZLib directory (e.g: C:\Program Files\Epic Games\UE_5.4\Engine\Source\ThirdParty\zlib\1.3)? #provide the zlib directory including the zlib version from the Unreal Engine version where you want to build the Library for.
C:\grpc>
1.Visual Studio 17 2022
2.Visual Studio 16 2019
3.Visual Studio 15 2017
Please select your visual studio version: [1,2,3]? #select your installed Visual Studio version that depends on your Unreal Engine version

```

At the end of this process you will have GrpcLib built for windows.

# Building GrpcLib for Linux
This step assums that you have WSL2 and Ubuntu installed on your Windows machine and you have already built GrpcLib for Windows.
At the end of building GrpcLib for Windows you will be asked:
```
C:\grpc> Do you want to cross compile for Linux x86_64 (Y/[N])?
```
In case you want to proceed, type Y and Enter. The Automation script is going to prepare the build environment inside WSL. [Clang](https://clang.llvm.org/) is going to be installed since Unreal Engine likes [Libc++](https://libcxx.llvm.org/) and this is the trick. Instead of using [GCC](https://gcc.gnu.org/) with [Libstdc++](https://gcc.gnu.org/onlinedocs/libstdc++/) which will build GrpcLib without any issue, but using it inside Unreal Engine will give you compilation errors, we will be using Libc++.

Often you will be asked to provide the password for your root Ubuntu user.

```
C:\grpc> [sudo] password for username:
```

Similar to Windows build, you will be asked again  to provide OpenSSL and ZLib Unreal Engine directories.

```bash
C:\grpc> What is the Unreal Engine OpenSSL directory (e.g: C:\Program Files\Epic Games\UE_5.4\Engine\Source\ThirdParty\OpenSSL\1.1.1t)? #provide the openssl directory including the openssl version from the Unreal Engine version where you want to build the Library for.
C:\grpc> What is the Unreal Engine ZLib directory (e.g: C:\Program Files\Epic Games\UE_5.4\Engine\Source\ThirdParty\zlib\1.3)? #provide the zlib directory including the zlib version from the Unreal Engine version where you want to build the Library for.
```
When you start seeing such thing that means your toolchain is identified by CMAKE and cmake files are being generated.

```
-- The C compiler identification is Clang 10.0.0
-- The CXX compiler identification is Clang 10.0.0
-- Check for working C compiler: /usr/bin/cc
-- Check for working C compiler: /usr/bin/cc -- works
```
When you start seeing such thing, that mean cmake files generated correctly and the build just started. Please grab a cup of coffee and sit back because the automation script is going to use all the physical cores on your machine to speed up things (you can modify it ofc) 😵‍💫.
```bash
Scanning dependencies of target time_zone
[  0%] Built target spinlock_wait
Scanning dependencies of target strerror
[  0%] Linking CXX static library ../../../../libout/libabsl_exponential_biased.a
[  0%] Building CXX object third_party/abseil-cpp/absl/base/CMakeFiles/strerror.dir/internal/strerror.cc.o
[  0%] Built target exponential_biased
Scanning dependencies of target address_sorting
[  0%] Linking CXX static library ../../../../libout/libabsl_random_seed_gen_exception.a
[  0%] Linking CXX static library ../../../../libout/libabsl_log_severity.a
```
At the end of the build you will get:
```
C:\grpc> You can exit this windows
```

# Build Your Proto files

Now we have built GrpcLib and we need to build our services proto files. All what we need to do is to  place all of them under /protobuf/protoc directory, then run build.bat. It will generate protobuf code wrappers and the GrpcHelper.h helper header file using protoc compiler that is compiled at the first step and then copy them to the proper directory inside UE-EasyGrpc.

You will get such a message that should include all your proto files.

```
building C:\grpc\protobuf\.\protoc\mathtest.protoc
building GrpcHelper.h
copying source files
        1 file(s) copied.
        1 file(s) copied.
copying headers
        1 file(s) copied.
        1 file(s) copied.
        1 file(s) copied.
Press any key to continue . . .
```

At this stage you can copy UE-EasyGrpc to your directory and you are good to go!!
