DROP TABLE IF EXISTS tpf_cpc;
CREATE TABLE tpf_cpc (
    family_id INT REFERENCES tpf_core (family_id),
    appln_id INT,
    appln_auth VARCHAR(2),
    cpc VARCHAR(20),
    count_cpc INT
);
COPY tpf_cpc(
    family_id,
    appln_id,
    appln_auth,
    cpc,
    count_cpc
)
FROM '/csv_data/202208_TPF_CPC.txt' DELIMITER '|' CSV HEADER;