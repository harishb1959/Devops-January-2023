from flask import Flask
import socket, json

app = Flask(__name__)

@app.route('/')
def get_ip():
    hostname = socket.gethostname()
    get_ip_address = socket.gethostbyname(hostname)
    return get_ip_address

@app.route('/health')
def get_app_name():
    return json.dumps({'success':True}), 200, {'ContentType':'application/json'}

if __name__ == '__main__':
    app.run(host="0.0.0.0", port="8080")    