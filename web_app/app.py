from app import app

@app.route('/')
@app.route('/index')
def index():
    return "Hello, World!"
if __name__ == '__main__':
    # if we are in Prod, use HOST and PORT specified
    try:
        app.run(host=str(env_settings['HOST']), port=80)
    except config.ConfigurationError:
        app.run()
