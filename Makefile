PROTO_DIR := proto
GO_OUT_DIR := gen/go
PYTHON_OUT_DIR := gen/python

.PHONY: all clean

all: generate

generate:
	# Ensure the output directories exist
	mkdir -p $(GO_OUT_DIR) $(PYTHON_OUT_DIR)
	# Generate the Go and Python protobuf code
	protoc --proto_path=$(PROTO_DIR) --go_out=$(GO_OUT_DIR) --python_out=$(PYTHON_OUT_DIR) --pyi_out=$(PYTHON_OUT_DIR) $(PROTO_DIR)/*.proto
	# Generate the Go gRPC code
	protoc --proto_path=$(PROTO_DIR) --go-grpc_out=$(GO_OUT_DIR) $(PROTO_DIR)/*.proto
	# Generate the Python gRPC code using grpc_tools.protoc
	python -m grpc_tools.protoc --proto_path=$(PROTO_DIR) --grpc_python_out=$(PYTHON_OUT_DIR) $(PROTO_DIR)/*.proto

clean:
	rm -rf $(GO_OUT_DIR)/*
	rm -rf $(PYTHON_OUT_DIR)/*