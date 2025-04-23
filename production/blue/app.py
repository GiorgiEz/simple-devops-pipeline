from flask import Flask, request, render_template, redirect, url_for
import os, sys


project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
template_dir = os.path.join(project_root, 'templates')
app = Flask(__name__, template_folder=template_dir)

@app.route('/', methods=['GET', 'POST'])
def home():
    if request.method == 'POST':
        name = request.form['name']
        return redirect(url_for('greet', username=name))
    return render_template('index.html')

@app.route('/greet/<username>')
def greet(username):
    return f'<h1>Hello, {username}!</h1>'


if __name__ == '__main__':
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 5000
    app.run(port=port)
