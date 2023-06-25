# README


### Run with docker

```
if [ -d storage ]; then
  echo "The storage directory exists."
else
  echo "The storage directory does not exist."
  mkdir storage
fi
docker run -it --rm -p 12306:3000 -v ./storage:/rails/storage -e SECRET_KEY_BASE=16a24a9387ac nbkhic/my_stuff:v0.1

```

### Enviroment

* ruby version: ruby 3.1.1
* database: sqlite
* fontend: bootstrap 5.3




