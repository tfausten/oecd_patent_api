DROP TABLE IF EXISTS tpf_epo;
CREATE TABLE tpf_epo (
    family_id INT REFERENCES tpf_core (family_id),
    epo_nbr VARCHAR(20),
    appln_id INT,
    title VARCHAR(900)
);
COPY tpf_epo(
    family_id,
    epo_nbr,
    appln_id,
    title
)
FROM '/csv_data/202208_TPF_EPO.txt' DELIMITER '|' CSV HEADER;