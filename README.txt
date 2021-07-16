1) run `./download-all.sh` and `./build-all.sh`
	* this will go through all sub-directories and call `./download.sh` and `./build.sh`
	* this builds all required docker images and calls `docker-compose up --no-start`
2) to start services, call `./run.sh`
	* this calls `docker-compose up -d`
	* runs as a daemon
3) to stop services, call `docker-compose stop`
	* call `docker-compose down` to remove services (clears state)

TODO:
- TLS certificates?
