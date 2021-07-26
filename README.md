## Environment variables

A bunch of environment variables contain configuration options that cannot be hardcoded (e.g. passwords). These are set via `args.sh`. If you don't have such a file, create one from `args.template.sh`. Make sure to `source args.sh` before calling any `docker compose` commands.

Most environment variables must be present when running the docker containers. These can be changed without re-building images or containers (only re-starting is required). Only `SPARKY_VERSION` is a build arg, that must be present when the images are built. Changes to this variable only take effect when re-building images.

## Building images

1) run `docker-compose build` to build all required docker images

## Running containers

1) run `docker-compose up -d` to run (and if required, also create) the containers (`-d` means run as daemon)

2) run `docker-compose stop` to stop the containers
	* alternatively, run `docker compose down` to stop **and remove** the containers (removes state)

## Notes

* The ports that the services will be published on can be set by environment variables. If they are not set, their default values are used. Be aware that `FRONTEND_SPARKY_HOST` in `args.sh` needs to be adapted accordingly.
	* `SPARKY_PORT` (default: `8080`)
	* `BACKEND_PORT` (default: `3000`)
	* `FRONTEND_PORT`  (default: `8000`)
* You can pass the `--project-name some-name` command line argument to `docker compose` (after the `compose`) to set a unique identifier for the deployment. This allows multiple independent instances to run in parallel (you will need to set different publish ports in this case, see above).
* Pass `--profile svn` to also start an SVN server for submissions. It will be published under port `SVN_PORT` (default: `8888`) and have an repository under `/svn/` called `SVN_REPO_NAME` (default: `submission`); thus, it is typically reachable under `http://localhost:8888/svn/submission/`. It accesses the same database as the auth service (sparky) for authentication, thus all users in the LOCAL realm can log in with the same credentials.

## TODO

- svn: RightsManagement service
- sparky: set `spring.jpa.hibernate.ddl-auto = update` in `application-release.properties` after first successful run
- backend: set `db.synchronize: false` in `production.yml` after first successful run
- an apache as front-end with TLS certificates?
	- use a `docker-compose.production.yml` file that extends `docker-compose.yml` for that?
