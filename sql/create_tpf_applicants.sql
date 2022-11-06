DROP TABLE IF EXISTS tpf_applicants;
CREATE TABLE tpf_applicants (
    family_id INT REFERENCES tpf_core (family_id),
    applicant VARCHAR(255),
    address VARCHAR(255),
    country VARCHAR(2),
    applicant_count INT,
    applicant_share FLOAT
);
COPY tpf_applicants(
    family_id, 
    applicant,
    address,
    country,
    applicant_count,
    applicant_share
)
FROM '/csv_data/202208_TPF_Applicants.txt' DELIMITER '|' CSV HEADER;