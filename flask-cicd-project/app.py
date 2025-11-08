from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from Flask! CI/CD is working with GitHub Actions!"

if __name__ == '__main__':
    # Production environment lo 0.0.0.0 ni use cheyali
    app.run(host='0.0.0.0', port=5000)