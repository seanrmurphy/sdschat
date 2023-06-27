# sdschat

Fastchat implementation for SDSC. 

## How to run this app in SDSC

```
runai submit sdschat-$USER -i caviri/sdschat:latest --service-type=portforward --port 8000:8000 --port 7860:7860 --attach --interactive --node-type "A100" -g 0.5
```

## How to build this image?

```
docker build -t caviri/sdschat:latest . 
```

```
docker run -it --rm -p 7860:7860 -p 8000:8000 caviri/sdschat:latest 
```