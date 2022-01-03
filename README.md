## Environment variables

A bunch of environment variables contain configuration options that cannot be hardcoded (e.g. passwords). There are run-time environment variables and build-time arguments:

* Run-time environment variables are set via `args.sh`. If you don't have such a file, create one from `args.template.sh`. Make sure to `source args.sh` before starting containers.

* Build-time arguments are set in `build-args.sh`. Make sure to `source build-args.sh` before building images.

## Building images

0) `source build-args.sh`

1) run `docker-compose build` to build all required docker images

## Running containers

0) `source args.sh`

1) run `docker-compose up -d` to run (and if required, also create) the containers (`-d` means run as daemon)
	* You may run `docker-compose --profile frontend up -d` to run all containers, including containers, which are intended to demonstrate the frontend services.
	* You may open <http://localhost>, when running the `frontend` profile. This page provides a list of all available services and API routes.

2) run `docker-compose stop` to stop the containers
	* alternatively, run `docker-compose down` to stop **and remove** the containers (removes state)

## Notes

* The ports that the services will be published on can be set by environment variables. If they are not set, their default values are used. Be aware that `FRONTEND_SPARKY_HOST` in `args.sh` needs to be adapted accordingly.
	* `SPARKY_PORT` (default: `8080`)
	* `BACKEND_PORT` (default: `3000`)
	* `FRONTEND_PORT` (default: `8000`)
	* `SUBMISSION_SERVER_PORT` (default: `8001`)
	* `PISTON_PORT` (default `2000`; only used when running the `frontend` profile)
	* `WEB_IDE_PORT` (default `8002`; only used when running the `frontend` profile)
	* `SHOWCASE_PORT` (default `80`; only used when running the `frontend` profile)
* You can pass the `--project-name some-name` command line argument to `docker-compose` (after the `compose`) to set a unique identifier for the deployment. This allows multiple independent instances to run in parallel (you will need to set different publish ports in this case, see above).

## TODO

- sparky: set `spring.jpa.hibernate.ddl-auto = update` in `application-release.properties` after first successful run
- backend: set `db.synchronize: false` in `production.yml` after first successful run
