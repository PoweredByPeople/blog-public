from app import app

app.run(host=str(env_settings['HOST']), port=80)
