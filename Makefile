POSTGRES_IMAGE=postgres:14.5-bullseye
POSTGRES_USER=patent_api
POSTGRES_PASSWORD=password

requirements:
	sudo apt update
	sudo apt install -y unzip p7zip-full postgresql-client-14

csv_data:
	unzip -n data/OECD_TPF_202208/OECD_TPF_20220820221013171426.zip \
		-d data/OECD_TPF_202208/OECD_TPF_20220820221013171426

	7z x "data/OECD_TPF_202208/OECD_TPF_20220820221013171426/*.7z" \
		-odata/OECD_TPF_202208/OECD_TPF_20220820221013171426

postgres_up:
	docker run -itd --rm -e POSTGRES_USER=${POSTGRES_USER} -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} -p 5432:5432 \
		-v $(shell pwd)/postgres_data:/var/lib/postgresql/data --name postgresql ${POSTGRES_IMAGE}

postgres_down:
	docker stop postgresql

psql_shell:
	PGPASSWORD=${POSTGRES_PASSWORD} psql -h localhost -U ${POSTGRES_USER}
