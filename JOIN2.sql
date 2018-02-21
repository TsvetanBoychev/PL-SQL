CREATE TABLE import_from_excel_ceco (
    id            VARCHAR2(4 BYTE) NOT NULL PRIMARY KEY,
    firstname1    VARCHAR2(10 BYTE),
    lastname1     VARCHAR2(10 BYTE),
    firstname2    VARCHAR2(10 BYTE),
    lastname2     VARCHAR2(10 BYTE),
    city          VARCHAR2(40 BYTE),
    country       VARCHAR2(10 BYTE),
    date_import   DATE
)
-----------------------------------------------------------------------------------------

SELECT
    *
FROM
    import_from_excel_ceco;

DROP TABLE import_from_excel_ceco;
--------------------------------------------------------

SELECT
    b.firstname AS firstname1,
    b.lastname AS lastname1,
    a.firstname AS firstname2,
    a.lastname AS lastname2,
    b.city,
    b.country
FROM
    import_from_excel_ceco a,
    import_from_excel_ceco b
WHERE
    a.id <> b.id
    AND   a.city = b.city
    AND   a.country = b.country
ORDER BY
    a.country;