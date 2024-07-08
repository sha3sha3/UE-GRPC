option(USE_GRPC_CONFIG OFF)

set(tools /usr/bin)
set(CMAKE_C_COMPILER ${tools}/clang)
set(CMAKE_CXX_COMPILER ${tools}/clang++)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")

set(CMAKE_SYSTEM_PROCESSOR "aarch64")
set(CPACK_PACKAGE_ARCHITECTURE "aarch64")
set(CMAKE_SYSTEM_NAME "Linux")
set(CMAKE_CROSSCOMPILING TRUE)

set(CMAKE_BUILD_TYPE Release)

set(LIBRARY_OUTPUT_PATH:PATH ${SOURCE_DIR}/cmake/build/libout)

set(THIRD_PARTY_ARCHITECTURE "LinuxArm64")