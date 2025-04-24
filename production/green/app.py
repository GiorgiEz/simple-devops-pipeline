from flask import Flask, request, render_template, redirect, url_for
import os, sys

# Define the path to the project root and the templates folder
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
template_dir = os.path.join(project_root, 'templates')

# Create Flask app and tell it where to find templates
app = Flask(__name__, template_folder=template_dir)

# Home route: handles GET to show form, POST to process form data
@app.route('/', methods=['GET', 'POST'])
def home():
    if request.method == 'POST':
        # Get the name from the submitted form and redirect to greeting page
        name = request.form['name']
        return redirect(url_for('greet', username=name))
    # Render the form page
    return render_template('index.html')

# Greeting route: displays a personalized message
@app.route('/greet/<username>')
def greet(username):
    return f'<h1>{username}!</h1>'

# Run the Flask server on a given port (default 5000)
if __name__ == '__main__':
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 5000
    app.run(port=port)
