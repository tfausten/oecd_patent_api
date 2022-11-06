DROP TABLE IF EXISTS tpf_jpo;
CREATE TABLE tpf_jpo (
    family_id INT REFERENCES tpf_core (family_id),
    jpo_nbr VARCHAR(20),
    appln_id INT,
    title VARCHAR(1000)
);
COPY tpf_jpo(
    family_id,
    jpo_nbr,
    appln_id,
    title
)
FROM '/csv_data/202208_TPF_JPO.txt' DELIMITER '|' CSV HEADER;