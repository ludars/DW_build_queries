-- This creates the H-table view of c_rm_contacts_by_project.
-- It DOES NOT NEED a live view

CREATE MATERIALIZED VIEW H_RM_CONTACTS_BY_PROJECT refresh FORCE ON demand
AS
SELECT
  CASE
    WHEN row_number() OVER (PARTITION BY pidm, PROJECT_CODE ORDER BY
      contact_date DESC , reference_num DESC, project_number ASC) = 1
    THEN 'Y'
    ELSE 'N'
  END AS last_contact_ind
, contacts.*
FROM
  (
    SELECT
      PIDM
    , BANNER_ID
    , NAME_SORT
    , ENTITY_CODE
    , REFERENCE_NUM
    , IDEN_CODE
    , CONTACT_TYPE_CODE
    , CONTACT_TYPE_DESC
    , PROJECT_CODE_1 AS PROJECT_CODE
    , PROJECT_DESC_1 AS PROJECT_DESC
    , 1              AS PROJECT_NUMBER
    , CONFID_IND
    , IDEN_CODE_ASSIGNED
    , CONTACT_DESC
    , CALL_REPORT
    , CONTACT_DATE
    , CREATE_TICKLER_IND
    , TICKLER_MESSAGE
    , TICKLER_DATE
    , TICKLER_STATUS
    , ASK_AMOUNT_1 AS ASK_AMOUNT
    , MOVE_CODE
    , MOVE_DESC
    , MOVE_SEQNO
    , PROPOSAL_CODE
    , PROPOSAL_DESC
    , PROPOSAL_SEQNO
    , CREATE_DATE
    , ACTIVITY_DATE
    , BANNER_USER_ID
    , DATA_ORIGIN
    , RECORD_START_DATE
    , RECORD_END_DATE
    FROM
      h_rm_contacts
    WHERE
      project_code_1    IS NOT NULL
    UNION ALL
    SELECT
      PIDM
    , BANNER_ID
    , NAME_SORT
    , ENTITY_CODE
    , REFERENCE_NUM
    , IDEN_CODE
    , CONTACT_TYPE_CODE
    , CONTACT_TYPE_DESC
    , PROJECT_CODE_2 AS PROJECT_CODE
    , PROJECT_DESC_2 AS PROJECT_DESC
    , 2              AS PROJECT_NUMBER
    , CONFID_IND
    , IDEN_CODE_ASSIGNED
    , CONTACT_DESC
    , CALL_REPORT
    , CONTACT_DATE
    , CREATE_TICKLER_IND
    , TICKLER_MESSAGE
    , TICKLER_DATE
    , TICKLER_STATUS
    , ASK_AMOUNT_2 AS ASK_AMOUNT
    , MOVE_CODE
    , MOVE_DESC
    , MOVE_SEQNO
    , PROPOSAL_CODE
    , PROPOSAL_DESC
    , PROPOSAL_SEQNO
    , CREATE_DATE
    , ACTIVITY_DATE
    , BANNER_USER_ID
    , DATA_ORIGIN
    , RECORD_START_DATE
    , RECORD_END_DATE
    FROM
      h_rm_contacts
    WHERE
      project_code_2    IS NOT NULL
    UNION ALL
    SELECT
      PIDM
    , BANNER_ID
    , NAME_SORT
    , ENTITY_CODE
    , REFERENCE_NUM
    , IDEN_CODE
    , CONTACT_TYPE_CODE
    , CONTACT_TYPE_DESC
    , PROJECT_CODE_3 AS PROJECT_CODE
    , PROJECT_DESC_3 AS PROJECT_DESC
    , 3              AS PROJECT_NUMBER
    , CONFID_IND
    , IDEN_CODE_ASSIGNED
    , CONTACT_DESC
    , CALL_REPORT
    , CONTACT_DATE
    , CREATE_TICKLER_IND
    , TICKLER_MESSAGE
    , TICKLER_DATE
    , TICKLER_STATUS
    , ASK_AMOUNT_3 AS ASK_AMOUNT
    , MOVE_CODE
    , MOVE_DESC
    , MOVE_SEQNO
    , PROPOSAL_CODE
    , PROPOSAL_DESC
    , PROPOSAL_SEQNO
    , CREATE_DATE
    , ACTIVITY_DATE
    , BANNER_USER_ID
    , DATA_ORIGIN
    , RECORD_START_DATE
    , RECORD_END_DATE
    FROM
      h_rm_contacts
    WHERE
      project_code_3    IS NOT NULL
    UNION ALL
    SELECT
      PIDM
    , BANNER_ID
    , NAME_SORT
    , ENTITY_CODE
    , REFERENCE_NUM
    , IDEN_CODE
    , CONTACT_TYPE_CODE
    , CONTACT_TYPE_DESC
    , PROJECT_CODE_4 AS PROJECT_CODE
    , PROJECT_DESC_4 AS PROJECT_DESC
    , 4              AS PROJECT_NUMBER
    , CONFID_IND
    , IDEN_CODE_ASSIGNED
    , CONTACT_DESC
    , CALL_REPORT
    , CONTACT_DATE
    , CREATE_TICKLER_IND
    , TICKLER_MESSAGE
    , TICKLER_DATE
    , TICKLER_STATUS
    , ASK_AMOUNT_4 AS ASK_AMOUNT
    , MOVE_CODE
    , MOVE_DESC
    , MOVE_SEQNO
    , PROPOSAL_CODE
    , PROPOSAL_DESC
    , PROPOSAL_SEQNO
    , CREATE_DATE
    , ACTIVITY_DATE
    , BANNER_USER_ID
    , DATA_ORIGIN
    , RECORD_START_DATE
    , RECORD_END_DATE
    FROM
      h_rm_contacts
    WHERE
      project_code_4    IS NOT NULL
    ORDER BY
      pidm
    , reference_num
    , project_code
  )
  contacts
ORDER BY
  pidm
, project_code
, reference_num;

-- INDEXES for MATERIALIZED VIEW
/*
  CREATE INDEX C_RM_CONT_PROJ_PIDM ON C_RM_CONTACTS_BY_PROJECT (PIDM) ;
  CREATE INDEX C_RM_CONT_PROJ_BANNER_ID ON C_RM_CONTACTS_BY_PROJECT (BANNER_ID) ;
  CREATE INDEX C_RM_CONT_PROJ_NAME ON C_RM_CONTACTS_BY_PROJECT (NAME_SORT) ;
  CREATE INDEX C_RM_CONT_PROJ_REFNO ON C_RM_CONTACTS_BY_PROJECT (REFERENCE_NUM) ;
  CREATE INDEX C_RM_CONT_PROJ_ENTITY ON C_RM_CONTACTS_BY_PROJECT (ENTITY_CODE) ;
  CREATE INDEX C_RM_CONT_PROJ_CODE ON C_RM_CONTACTS_BY_PROJECT (PROJECT_CODE) ;
  CREATE INDEX C_RM_CONT_PROJ_NUM ON C_RM_CONTACTS_BY_PROJECT (PROJECT_NUMBER) ; */
