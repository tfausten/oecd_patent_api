DROP TABLE IF EXISTS tpf_uspto;
CREATE TABLE tpf_uspto (
    family_id INT REFERENCES tpf_core (family_id),
    uspto_nbr VARCHAR(20),
    appln_id INT,
    title VARCHAR(1000)
);
COPY tpf_uspto(
    family_id,
    uspto_nbr,
    appln_id,
    title
)
FROM '/csv_data/202208_TPF_USPTO.txt' DELIMITER '|' CSV HEADER;