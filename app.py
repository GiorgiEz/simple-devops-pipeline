from flask import Flask, request, render_template, redirect, url_for

app = Flask(__name__)

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
    app.run(debug=True)
