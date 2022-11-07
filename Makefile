RAW_DATA_DIR=$(shell pwd)/data/OECD_TPF_202208/OECD_TPF_20220820221013171426

POSTGRES_USER=postgres
POSTGRES_PASSWORD=password
POSTGRES_DB=oecd_patent
POSTGRES_DATA_DIR=$(shell pwd)/data/postgres

requirements:
	sudo apt update
	sudo apt install -y unzip p7zip-full postgresql-client-14

csv_data:
	unzip -n ${RAW_DATA_DIR}.zip \
		-d ${RAW_DATA_DIR}
	7z x "${RAW_DATA_DIR}/*.7z" \
		-o${RAW_DATA_DIR}

DOCKER_COMPOSE=docker compose -f docker-compose/docker-compose.yaml
up:
	${DOCKER_COMPOSE} up ${ARGS} -d
down:
	${DOCKER_COMPOSE} down ${ARGS}
restart:
	${DOCKER_COMPOSE} restart ${ARGS}
	

PSQL_SHELL=PGPASSWORD=${POSTGRES_PASSWORD} psql -h localhost -U ${POSTGRES_USER}
psql_shell:
	${PSQL_SHELL} -d ${POSTGRES_DB} ${ARGS}

db:
	${PSQL_SHELL} -c "CREATE DATABASE ${POSTGRES_DB};"

tables:
	${PSQL_SHELL} -d ${POSTGRES_DB} -f sql/create_tpf_core.sql
	${PSQL_SHELL} -d ${POSTGRES_DB} -f sql/create_tpf_applicants.sql
	${PSQL_SHELL} -d ${POSTGRES_DB} -f sql/create_tpf_cpc.sql
	${PSQL_SHELL} -d ${POSTGRES_DB} -f sql/create_tpf_epo.sql
	${PSQL_SHELL} -d ${POSTGRES_DB} -f sql/create_tpf_inventors.sql
	${PSQL_SHELL} -d ${POSTGRES_DB} -f sql/create_tpf_ipc.sql
	${PSQL_SHELL} -d ${POSTGRES_DB} -f sql/create_tpf_jpo.sql
	${PSQL_SHELL} -d ${POSTGRES_DB} -f sql/create_tpf_pct.sql
	${PSQL_SHELL} -d ${POSTGRES_DB} -f sql/create_tpf_priority.sql
	${PSQL_SHELL} -d ${POSTGRES_DB} -f sql/create_tpf_uspto.sql

drop_db:
	${PSQL_SHELL} -c "DROP DATABASE ${POSTGRES_DB};"
