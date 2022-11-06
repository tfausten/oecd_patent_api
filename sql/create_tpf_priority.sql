DROP TABLE IF EXISTS tpf_pct;
CREATE TYPE PATENT_LINKAGE AS ENUM ('PRIO', 'CONTN', 'TECH', 'PCT');
CREATE TABLE tpf_pct (
    family_id INT REFERENCES tpf_core (family_id),
    patent_nbr VARCHAR(20),
    parent_type PATENT_LINKAGE,
    appln_id INT
);
COPY tpf_pct(
    family_id,
    patent_nbr,
    parent_type,
    appln_id
)
FROM '/csv_data/202208_TPF_Priority.txt' DELIMITER '|' CSV HEADER;