// Copyright (c) 2024, Mohamad Shaaban, https://github.com/sha3sha3/UE-GRPC.

#include "EasyGrpc.h"
#include "GrpcHelper.h"
#include <string>
#define LOCTEXT_NAMESPACE "FEasyGrpcModule"
using namespace std;


void FEasyGrpcModule::StartupModule()
{

}

void FEasyGrpcModule::ShutdownModule()
{
	// This function may be called during shutdown to clean up your module.  For modules that support dynamic reloading,
	// we call this function before unloading the module.
	
}

#undef LOCTEXT_NAMESPACE
	
IMPLEMENT_MODULE(FEasyGrpcModule, EasyGrpc)