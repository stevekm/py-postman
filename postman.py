#!/usr/bin/env python
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/', methods=['POST'])
def entry_point():
    data = request.json
    print(data)
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)
