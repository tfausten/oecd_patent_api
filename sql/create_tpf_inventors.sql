DROP TABLE IF EXISTS tpf_inventors;
CREATE TABLE tpf_inventors (
    family_id INT REFERENCES tpf_core (family_id),
    inventor VARCHAR(100),
    address VARCHAR(255),
    country VARCHAR(2),
    inventor_count INT,
    inventor_share FLOAT
);
COPY tpf_inventors(
    family_id,
    inventor,
    address,
    country,
    inventor_count,
    inventor_share
)
FROM '/csv_data/202208_TPF_Inventors.txt' DELIMITER '|' CSV HEADER;