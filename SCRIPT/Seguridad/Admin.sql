--Ejecutar desde System

--Schema Administrador

CREATE USER F1005855668 identified by finalbases DEFAULT TABLESPACE DEFRMUNDO TEMPORARY TABLESPACE TEMRMULTINIVEL;

GRANT CONNECT, CREATE SESSION, CREATE ROLE, CREATE USER TO F1005855668 WITH ADMIN OPTION;

GRANT SELECT ON CATEGORY TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON PRODUCT TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON DETAILSALE TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON COUNTRY TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON ZONE TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON CITY TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON ARTICLE TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON SALE TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON SALEQUALIFICATION TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON DETAILPAYMENT TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON PERSON TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON CLIENT TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON BANK TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON CARD TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON AGENTSALES TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON HISTORICALTYPEAGENT TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON HISTORICALCRV TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON CONTACT TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON TYPECONTACT TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON TYPEAGENTSALES TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON OBJECT TO F1005855668 WITH GRANT OPTION;


GRANT INSERT ON SALE TO F1005855668 WITH GRANT OPTION;
GRANT INSERT ON DETAILSALE TO F1005855668 WITH GRANT OPTION;
GRANT INSERT ON DETAILPAYMENT TO F1005855668 WITH GRANT OPTION;
GRANT INSERT ON HISTORICALCRV TO F1005855668 WITH GRANT OPTION;
GRANT INSERT ON PERSON TO F1005855668 WITH GRANT OPTION;
GRANT INSERT ON CLIENT TO F1005855668 WITH GRANT OPTION;
GRANT INSERT ON CONTACT TO F1005855668 WITH GRANT OPTION;
GRANT INSERT ON HISTORICALCRV TO F1005855668 WITH GRANT OPTION;
GRANT INSERT ON SALEQUALIFICATION TO F1005855668 WITH GRANT OPTION;

GRANT SELECT ON VARS TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON HISTORICALVARS TO F1005855668 WITH GRANT OPTION;

GRANT SELECT ON AUDITR TO F1005855668 WITH GRANT OPTION;

GRANT UPDATE ON PERSON TO F1005855668 WITH GRANT OPTION;
GRANT UPDATE ON CLIENT TO F1005855668 WITH GRANT OPTION;
GRANT UPDATE ON ARTICLE TO F1005855668 WITH GRANT OPTION;


GRANT SELECT ON MULTINIVEL.SEQ_VENTA_IDVENTA TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON MULTINIVEL.SEQ_DETALLEVENTA_ID TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON MULTINIVEL.SEQ_DETALLEPAGO_IDDETALLEPAGO TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON MULTINIVEL.SEQ_ITEM_IDITEM TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON MULTINIVEL.SEQ_HISTORICOCRV_ID TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON MULTINIVEL.SEQ_CALIFICACIONVENTA_ID TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON MULTINIVEL.SEQ_CONTACTO_IDCONTACTO TO F1005855668 WITH GRANT OPTION;
GRANT SELECT ON MULTINIVEL.SEQ_HISTORICOCRV_ID TO F1005855668 WITH GRANT OPTION;

GRANT EXECUTE ON MULTINIVEL.PK_PROCEDIMIENTOS TO F1005855668 WITH GRANT OPTION;