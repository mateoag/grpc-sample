from flask import Flask, request, jsonify
import grpc
import sys
import os
sys.path.append(os.path.join(os.path.dirname(__file__), 'gen', 'python'))

# Import the generated classes
import gen.python.helloworld_pb2 as helloworld_pb2
import gen.python.helloworld_pb2_grpc as helloworld_pb2_grpc

app = Flask(__name__)

@app.route('/say_hello', methods=['GET'])
def say_hello():
    name = request.args.get('name', 'world')
    with grpc.insecure_channel('localhost:50051') as channel:
        stub = helloworld_pb2_grpc.GreeterStub(channel)
        grpc_request = helloworld_pb2.HelloRequest(name=name)
        response = stub.SayHello(grpc_request)
        return jsonify({'message': response.message})

if __name__ == '__main__':
    app.run(debug=True)