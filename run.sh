docker build . --tag eyay/tts-service
docker run -d -p 7861:7861 -v ./audio:/code/audio -v ./model:/code/model --name tts eyay/tts-service