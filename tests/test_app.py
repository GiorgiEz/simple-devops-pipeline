import sys
import os

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from app import app


def test_greet_route():
    """ Tests the greet route by checking if the response contains the expected text."""
    with app.test_client() as client:
        response = client.get('/greet/Alice')
        assert response.status_code == 200
        assert b'Hello, Alice!' in response.data
