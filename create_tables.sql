-- TPF_CORE
DROP TABLE IF EXISTS tpf_core;
CREATE table tpf_core (
    family_id INT PRIMARY KEY,
    count_prio INT,
    first_prio DATE,
    last_prio DATE,
    uspto_app_first DATE,
    uspto_app_last DATE,
    uspto_grant DATE,
    count_uspto INT,
    epo_app_first DATE,
    epo_app_last DATE,
    epo_grant DATE,
    count_epo INT,
    jpo_app_first DATE,
    jpo_app_last DATE,
    jpo_grant DATE,
    count_jpo INT,
    pct_app_first DATE,
    count_pct INT
);
COPY tpf_core(
    family_id,
    count_prio,
    first_prio,
    last_prio,
    uspto_app_first,
    uspto_app_last,
    uspto_grant,
    count_uspto,
    epo_app_first,
    epo_app_last,
    epo_grant,
    count_epo,
    jpo_app_first,
    jpo_app_last,
    jpo_grant,
    count_jpo,
    pct_app_first,
    count_pct
)
FROM '/csv_data/202208_TPF_Core.txt' DELIMITER '|' CSV HEADER;
-- TPF_APPLICANTS
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