1) `source args.sh` to make the required environment variables available to subsequent commands
	* if required, create an appropriate args.sh from args.template.sh
	* the pipe character `|` is generally not allowed in the values, as it leads to problems for the sed command

2) run `docker compose build` to build all required docker images

3) run `docker compose up -d` to run (and if required, also create) the containers (-d means run as daemon)

4) run `docker compose stop` to stop the containers
	* run `docker compose down` to stop **and remove** the containers (removes state)

TODO:
- sparky: set spring.jpa.hibernate.ddl-auto = update in application-release.properties after first successful run
- backend: set db.synchronize: false in production.yml after first successful run
- an apache as front-end with TLS certificates?
