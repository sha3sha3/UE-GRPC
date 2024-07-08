// Copyright (c) 2024, Mohamad Shaaban, https://github.com/sha3sha3/UE-GRPC.

#pragma once

#include "Modules/ModuleManager.h"

class FEasyGrpcModule : public IModuleInterface
{
public:

	/** IModuleInterface implementation */
	virtual void StartupModule() override;
	virtual void ShutdownModule() override;
};
