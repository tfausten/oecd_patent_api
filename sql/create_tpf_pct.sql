DROP TABLE IF EXISTS tpf_pct;
CREATE TABLE tpf_pct (
    family_id INT REFERENCES tpf_core (family_id),
    pct_nbr VARCHAR(20),
    appln_id INT
);
COPY tpf_pct(
    family_id,
    pct_nbr,
    appln_id
)
FROM '/csv_data/202208_TPF_PCT.txt' DELIMITER '|' CSV HEADER;