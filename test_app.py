from app import app

def test_greet_route():
    with app.test_client() as client:
        response = client.get('/greet/Alice')
        assert response.status_code == 200
        assert b'Hello, Alice!' in response.data
