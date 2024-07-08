// Copyright (c) 2024, Mohamad Shaaban, https://github.com/sha3sha3/UE-GRPC.

#pragma once

#include "Kismet/BlueprintFunctionLibrary.h"
#include "Subsystems/GameInstanceSubsystem.h"
#include "Templates/SharedPointer.h"
#include "EasyGrpcSubsystem.generated.h"


UCLASS()
class EASYGRPC_API UEasyGrpcSubsystem : public UEngineSubsystem
{
	GENERATED_BODY()


public:
	virtual void Initialize(FSubsystemCollectionBase& Collection) override;
	virtual void Deinitialize() override;

	UFUNCTION(BlueprintCallable, meta = (DisplayName = "Grpc Test"), Category = "EasyGrpc")
		 void TestFunction();
private:

};
