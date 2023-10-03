-- Insert New Records
INSERT INTO EXERCISE1.tgt_customer (
  C_ACCTBAL, C_ADDRESS, C_COMMENT, C_CUSTKEY, C_MKTSEGMENT, C_NAME, C_NATIONKEY, C_PHONE, created_at
)
SELECT
  stg.C_ACCTBAL, stg.C_ADDRESS, stg.C_COMMENT, stg.C_CUSTKEY, stg.C_MKTSEGMENT, stg.C_NAME, stg.C_NATIONKEY, stg.C_PHONE,
  CURRENT_TIMESTAMP()
FROM {{ ref('stg_customer') }} AS stg
WHERE NOT EXISTS (
  SELECT 1 FROM EXERCISE1.tgt_customer AS tgt
  WHERE tgt.C_CUSTKEY = stg.C_CUSTKEY
)
;

-- Update Existing Records
UPDATE tgt
SET
  C_PHONE = stg.C_PHONE,
  updated_at = CURRENT_TIMESTAMP()
FROM EXERCISE1.tgt_customer AS tgt
JOIN {{ ref('stg_customer') }} AS stg ON tgt.C_CUSTKEY = stg.C_CUSTKEY;
