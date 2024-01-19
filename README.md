# REST-TTS-Edge-Dockerfize
TTS using  Balacoon TTS light, REST API wrapper with FastAPI and Docker, for your text-to-speech needs on small device like raspberry-pi🤖

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/S6S613677)

## Installation
1. run `./setup.sh` to download the model `en_us_hifi92_light_cpu.addon`
1. To build image, run `docker build . --tag my/tts-api`
1. To run image, run`docker run -d -p 7861:7861 -v ./audio:/code/audio -v ./model:/code/model --name tts-api my/tts-api`
*⚠️ Note: Make sure to have the `-v` volume parameter to avoid redownloading models.*
1. Go to `http://127.0.0.1:7861/api/` to check the app

## USAGE
1. To convert text to speech, use the `POST` endpoint `/api/tts/`
with payload of `{message:"read this",name:"arnold",sample_rate:1.0}`. `message` is the text to be read and `name` is the file name for th wav while `sample_rate` controls the sampling rate. this returns the filename of the audio.
1. To read back converted speech, use the `GET` endpoint `/api/voice/`
with audio filename set a query params `name`  e.g. `.../api/voice?name=sample01.wav`
1. All generated audio are saved in `audio/outputs` folder with the file name `<sample>_<timestamp>`.
1. Check `http://localhost:7861/docs` for OpenAPI documentation