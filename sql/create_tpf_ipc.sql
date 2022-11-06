DROP TABLE IF EXISTS tpf_ipc;
CREATE TABLE tpf_ipc (
    family_id INT REFERENCES tpf_core (family_id),
    appln_id INT,
    appln_auth VARCHAR(2),
    ipc VARCHAR(20),
    count_ipc SMALLINT
);
COPY tpf_ipc(
    family_id,
    appln_id,
    appln_auth,
    ipc,
    count_ipc
)
FROM '/csv_data/202208_TPF_IPC.txt' DELIMITER '|' CSV HEADER;