// Copyright (c) 2024, Mohamad Shaaban, https://github.com/sha3sha3/UE-GRPC.
#pragma once 
THIRD_PARTY_INCLUDES_START 
#include "mathtest.protoc.grpc.pb.h"  
#include "mathtest.protoc.pb.h"  
#include "google/protobuf/inlined_string_field.h"
#include "grpcpp/grpcpp.h"
THIRD_PARTY_INCLUDES_END


using grpc::Server;
using grpc::ServerBuilder;
using grpc::ServerContext;
using grpc::Status;

using grpc::Channel;
using grpc::ClientContext;
using grpc::Status;
