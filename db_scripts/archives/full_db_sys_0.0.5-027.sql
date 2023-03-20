--
-- File generated with SQLiteStudio v3.3.3 on Wed Jan 11 06:41:50 2023
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: company
DROP TABLE IF EXISTS company;

CREATE TABLE company (
    _pk         VARCHAR (36)  NOT NULL,
    code        VARCHAR (10)  NOT NULL,
    _updated_by VARCHAR (100) NOT NULL,
    _updated_at DATETIME      NOT NULL,
    _disabled   BOOLEAN       NOT NULL,
    description VARCHAR (10)  NOT NULL,
    PRIMARY KEY (
        _pk
    )
);


-- Table: salesproject
DROP TABLE IF EXISTS salesproject;

CREATE TABLE salesproject (
    _pk         VARCHAR (36)  NOT NULL,
    code        VARCHAR (10)  NOT NULL,
    _updated_by VARCHAR (100) NOT NULL,
    _updated_at DATETIME      NOT NULL,
    _disabled   BOOLEAN       NOT NULL,
    description VARCHAR (100) NOT NULL,
    notes       VARCHAR,
    PRIMARY KEY (
        _pk
    )
);


-- Table: solution
DROP TABLE IF EXISTS solution;

CREATE TABLE solution (
    _pk         VARCHAR (36)  NOT NULL,
    code        VARCHAR (10)  NOT NULL,
    _updated_by VARCHAR (100) NOT NULL,
    _updated_at DATETIME      NOT NULL,
    _disabled   BOOLEAN       NOT NULL,
    description VARCHAR (100) NOT NULL,
    notes       VARCHAR,
    PRIMARY KEY (
        _pk
    )
);


-- Index: ix_company__disabled
DROP INDEX IF EXISTS ix_company__disabled;

CREATE INDEX ix_company__disabled ON company (
    _disabled
);


-- Index: ix_company__updated_by
DROP INDEX IF EXISTS ix_company__updated_by;

CREATE INDEX ix_company__updated_by ON company (
    _updated_by
);


-- Index: ix_company_code
DROP INDEX IF EXISTS ix_company_code;

CREATE UNIQUE INDEX ix_company_code ON company (
    code
);


-- Index: ix_salesproject__disabled
DROP INDEX IF EXISTS ix_salesproject__disabled;

CREATE INDEX ix_salesproject__disabled ON salesproject (
    _disabled
);


-- Index: ix_salesproject__updated_by
DROP INDEX IF EXISTS ix_salesproject__updated_by;

CREATE INDEX ix_salesproject__updated_by ON salesproject (
    _updated_by
);


-- Index: ix_salesproject_code
DROP INDEX IF EXISTS ix_salesproject_code;

CREATE UNIQUE INDEX ix_salesproject_code ON salesproject (
    code
);


-- Index: ix_solution__disabled
DROP INDEX IF EXISTS ix_solution__disabled;

CREATE INDEX ix_solution__disabled ON solution (
    _disabled
);


-- Index: ix_solution__updated_by
DROP INDEX IF EXISTS ix_solution__updated_by;

CREATE INDEX ix_solution__updated_by ON solution (
    _updated_by
);


-- Index: ix_solution_code
DROP INDEX IF EXISTS ix_solution_code;

CREATE UNIQUE INDEX ix_solution_code ON solution (
    code
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
