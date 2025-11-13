SELECT
    sample_id
    , dna_sequence
    , species
    , SUBSTR(dna_sequence, 1, 3) = "ATG" AS has_start
    , SUBSTR(dna_sequence, LENGTH(dna_sequence) - 2, 3) IN ("TAA", "TAG", "TGA") AS has_stop
    , LENGTH(REPLACE(dna_sequence, "ATAT", "")) != LENGTH(dna_sequence) AS has_atat
    , LENGTH(REPLACE(dna_sequence, "GGG", "")) != LENGTH(dna_sequence) AS has_ggg
FROM
    Samples
;
