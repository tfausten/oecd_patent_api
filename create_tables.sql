CREATE TABLE tpf_applicants (
    Family_id INT,
    Applicant VARCHAR(255),
    Address VARCHAR(100),
    Country VARCHAR(2),
    Applicant_Count INT,
    Applicant_Share FLOAT
);
COPY tpf_applicants(Family_id, Applicant, Address, Country, Applicant_Count, Applicant_Share)
FROM '/csv_data/202208_TPF_Applicants.txt' DELIMITER '|' CSV HEADER;