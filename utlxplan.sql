rem
rem $Header:tlxplan.sql big_dev/0 11-aug-95.14:02:45 achaudhr Exp $ xplainpl.sql
rem
Rem NAME
REM    UTLXPLAN.SQL
Rem  FUNCTION
Rem
Rem Esta es la tabla que se necesita crear para usar el EXPLAIN PLAN
Rem


create table PLAN_TABLE (
        statement_id    varchar2(30),
        timestamp       date,
        remarks         varchar2(80),
        operation       varchar2(30),
        options         varchar2(30),
        object_node     varchar2(128),
        object_owner    varchar2(30),
        object_name     varchar2(30),
        object_instance numeric,
        object_type     varchar2(30),
        optimizer       varchar2(255),
        search_columns  number,
        id              numeric,
        parent_id       numeric,
        position        numeric,
        cost            numeric,
        cardinality     numeric,
        bytes           numeric,
        other_tag       varchar2(255),
        partition_start varchar2(255),
        partition_stop  varchar2(255),
        partition_id    numeric,
        other           long);
    
