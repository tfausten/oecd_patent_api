RAW_DATA_DIR=$(shell pwd)/data/OECD_TPF_202208/OECD_TPF_20220820221013171426

POSTGRES_IMAGE=postgres:14.5-bullseye
POSTGRES_USER=patent_api
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

postgres_up:
	docker run -itd --rm -p 5432:5432 \
		-e POSTGRES_USER=${POSTGRES_USER} -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
		-v ${POSTGRES_DATA_DIR}:/var/lib/postgresql/data \
		-v ${RAW_DATA_DIR}:/csv_data \
		--name postgresql ${POSTGRES_IMAGE}

postgres_down:
	docker stop postgresql

PSQL_SHELL=PGPASSWORD=${POSTGRES_PASSWORD} psql -h localhost -U ${POSTGRES_USER}
psql_shell:
	${PSQL_SHELL} -d ${POSTGRES_DB}

create_db:
	${PSQL_SHELL} -c "CREATE DATABASE ${POSTGRES_DB};"

create_tables:
	${PSQL_SHELL} -d ${POSTGRES_DB} -f create_tables.sql

drop_db:
	${PSQL_SHELL} -c "DROP DATABASE ${POSTGRES_DB};"
