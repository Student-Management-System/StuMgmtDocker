1) `source args.sh` to make the required environment variables available to subsequent commands
	* if required, create an appropriate args.sh from args.template.sh
	* the pipe character `|` is generally not allowed in the values, as it leads to problems for the sed command

2) run `docker compose build` to build all required docker images

3) run `docker compose up -d` to run (and if required, also create) the containers (-d means run as daemon)

4) run `docker compose stop` to stop the containers
	* run `docker compose down` to stop **and remove** the containers (removes state)

* The ports that the services will be published on can be set by environment variables. If they are not set, their default values are used.
	* SPARKY_PORT (default: 8080)
	* BACKEND_PORT (default: 3000)
	* FRONTEND_PORT  (default: 8000)
* You can pass the `--project-name some-name` command line argument to `docker compose` (after the `compose`) to set a unique identifier for the deployment. This allows multiple independent instances to run in parallel (you will need to set different publish ports in this case, see above).

TODO:
- sparky: set spring.jpa.hibernate.ddl-auto = update in application-release.properties after first successful run
- backend: set db.synchronize: false in production.yml after first successful run
- an apache as front-end with TLS certificates?
