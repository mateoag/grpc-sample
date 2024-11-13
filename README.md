# gRPC-sample

## Generating Protobuf and gRPC Code

To generate the Go code from the `.proto` files, run the following command:
`make generate`

To clean the built protobufs run:
`make clean`

## Running the application

To run the gRPC server run:
`go run server.go`

To run the gRPC client run:
`python client.py`

Then on a browser open url:
`localhost:5000/say_hello?name=world`
