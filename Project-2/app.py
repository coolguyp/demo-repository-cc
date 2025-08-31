from flask import Flask, request, redirect, render_template
import string, random, json, os

app = Flask(__name__, template_folder="templates")
DATA_FILE = 'data.json'

def load_data():
    if not os.path.exists(DATA_FILE):
        return {}
    with open(DATA_FILE, 'r') as f:
        return json.load(f)

def save_data(data):
    with open(DATA_FILE, 'w') as f:
        json.dump(data, f)

@app.route('/', methods=['GET', 'POST'])
def index():
    data = load_data()
    if request.method == 'POST':
        long_url = request.form['url']
        short_id = ''.join(random.choices(string.ascii_letters + string.digits, k=6))
        data[short_id] = long_url
        save_data(data)
        return render_template('index.html', short_url=request.host_url + short_id)
    return render_template('index.html', short_url=None)

@app.route('/<short_id>')
def redirect_url(short_id):
    data = load_data()
    long_url = data.get(short_id)
    if long_url:
        return redirect(long_url)
    return 'URL not found', 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
