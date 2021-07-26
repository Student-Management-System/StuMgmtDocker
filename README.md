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

2) run `docker-compose stop` to stop the containers
	* alternatively, run `docker-compose down` to stop **and remove** the containers (removes state)

## Notes

* The ports that the services will be published on can be set by environment variables. If they are not set, their default values are used. Be aware that `FRONTEND_SPARKY_HOST` in `args.sh` needs to be adapted accordingly.
	* `SPARKY_PORT` (default: `8080`)
	* `BACKEND_PORT` (default: `3000`)
	* `FRONTEND_PORT`  (default: `8000`)
* You can pass the `--project-name some-name` command line argument to `docker-compose` (after the `compose`) to set a unique identifier for the deployment. This allows multiple independent instances to run in parallel (you will need to set different publish ports in this case, see above).
* Run `docker-compose up -d svn` to also start an SVN server for submissions.
	* Note that you also need to pass `--profile svn` to the build command to build the svn image.
	* Typically, the SVN server can only be started after the course in the student management system has been created. You will need to pass the following environment variables to the docker container:
		* `SVN_COURSE`: the ID of the course that the submission server is for (e.g. `java-wise2021`)
		* `SVN_MGMT_USER`: the username of a teacher in the course
		* `SVN_MGMT_PW`: the password of the teacher-user
	* You also need to register the rights-management service on the SVN server as a subscriber to the course in the student management system. The URL for that is: `http://svn:4000/rest/update`
	* The SVN itself will be published under port `SVN_PORT` (default: `8888`) and have a repository under `/svn/` called `SVN_REPO_NAME` (default: `submission`); thus, it is typically reachable under `http://localhost:8888/svn/submission/`.
	* The SVN server uses the auth service (sparky) for authentication, thus all users can log in with the same credentials.

## TODO

- sparky: set `spring.jpa.hibernate.ddl-auto = update` in `application-release.properties` after first successful run
- backend: set `db.synchronize: false` in `production.yml` after first successful run
