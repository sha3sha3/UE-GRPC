// Copyright (c) 2024, Mohamad Shaaban, https://github.com/sha3sha3/UE-GRPC.




#include "EasyGrpcSubsystem.h"
#include "GrpcHelper.h"


using mathtest::MathTest;
using mathtest::MathRequest;
using mathtest::MathReply;

//Example from https://medium.com/@andrewvetovitz/grpc-c-introduction-45a66ca9461f
namespace grpc_math_server {
    class MathServiceImplementation final : public MathTest::Service {
        Status sendRequest(
            ServerContext* context,
            const MathRequest* request,
            MathReply* reply
        ) override {
            int a = request->a();
            int b = request->b();

            reply->set_result(a * b);

            return Status::OK;
        }
    };

    void Run(std::string ip) {
        std::string address(ip);
        MathServiceImplementation service;

        ServerBuilder builder;

        builder.AddListeningPort(address, grpc::InsecureServerCredentials());
        builder.RegisterService(&service);

        std::unique_ptr<Server> server(builder.BuildAndStart());
        std::cout << "Server listening on port: " << address << std::endl;

        server->Wait();
    }
}

namespace grpc_math_client {
    class MathTestClient {
    public:
        MathTestClient(std::shared_ptr<Channel> channel) : stub_(MathTest::NewStub(channel)) {}

        int sendRequest(int a, int b) {
            MathRequest request;

            request.set_a(a);
            request.set_b(b);

            MathReply reply;

            ClientContext context;

            Status status = stub_->sendRequest(&context, request, &reply);

            if (status.ok()) {
                return reply.result();
            }
            else {
                std::cout << status.error_code() << ": " << status.error_message() << std::endl;
                return -1;
            }
        }

    private:
        std::unique_ptr<MathTest::Stub> stub_;
    };

    void Run(std::string ip) {
        std::string address(ip);
        MathTestClient client(
            grpc::CreateChannel(
                address,
                grpc::InsecureChannelCredentials()
            )
        );

        int response;

        int a = 5;
        int b = 10;

        response = client.sendRequest(a, b);

        UE_LOG(LogTemp, Warning, TEXT("Result: %d"), response);
    }
}

void UEasyGrpcSubsystem::Initialize(FSubsystemCollectionBase& Collection)
{


}

void UEasyGrpcSubsystem::Deinitialize()
{
	
}

void UEasyGrpcSubsystem::TestFunction()
{
   // grpc_math_server::Run();
    grpc_math_client::Run("127.0.0.1:5000");
}





