# gRPC-sample

## Setup

### Dependencies
- protoc
- go
- python

### Configuration
1. Install `protoc` using Homebrew:
    ```sh
    brew install protobuf
    ```
1. Create a virtual env
    ```sh
    python -m venv venv
    ```
1. Activate virtual env
    ```sh
    . ./venv/bin/activate
    ```
1. Install pip requirements
    ```sh
    pip install requirements.txt
    ```

## Generating Protobuf and gRPC Code

To generate the Go code from the `.proto` files, run the following command:
`make generate`

To clean the built protobufs run:
`make clean`

## Running the application

To run the gRPC server run:
`go mod tidy && go run server.go`

To run the gRPC client run:
`python client.py`

Then on a browser open url:
`localhost:5000/say_hello?name=world`
