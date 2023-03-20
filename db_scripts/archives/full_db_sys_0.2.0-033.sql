--
-- File generated with SQLiteStudio v3.3.3 on Mon Jan 16 17:36:09 2023
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: ads_general_data
DROP TABLE IF EXISTS ads_general_data;

CREATE TABLE ads_general_data (
    _pk                VARCHAR (36)  NOT NULL,
    code               VARCHAR (10)  NOT NULL,
    _updated_by        VARCHAR (100) NOT NULL,
    _updated_at        DATETIME      NOT NULL,
    _disabled          BOOLEAN       NOT NULL,
    sales_project_fk   VARCHAR (36)  NOT NULL,
    decisive_event     VARCHAR (100),
    competition        VARCHAR (100),
    potential_problems VARCHAR (100),
    team_members       VARCHAR (100),
    client_company     VARCHAR (100),
    PRIMARY KEY (
        _pk
    ),
    FOREIGN KEY (
        sales_project_fk
    )
    REFERENCES salesproject (_pk) ON DELETE CASCADE
);


-- Table: alembic_version
DROP TABLE IF EXISTS alembic_version;

CREATE TABLE alembic_version (
    version_num VARCHAR (32) NOT NULL,
    CONSTRAINT alembic_version_pkc PRIMARY KEY (
        version_num
    )
);


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


-- Index: ix_ads_general_data__disabled
DROP INDEX IF EXISTS ix_ads_general_data__disabled;

CREATE INDEX ix_ads_general_data__disabled ON ads_general_data (
    _disabled
);


-- Index: ix_ads_general_data__updated_by
DROP INDEX IF EXISTS ix_ads_general_data__updated_by;

CREATE INDEX ix_ads_general_data__updated_by ON ads_general_data (
    _updated_by
);


-- Index: ix_ads_general_data_code
DROP INDEX IF EXISTS ix_ads_general_data_code;

CREATE UNIQUE INDEX ix_ads_general_data_code ON ads_general_data (
    code
);


-- Index: ix_ads_general_data_sales_project_fk
DROP INDEX IF EXISTS ix_ads_general_data_sales_project_fk;

CREATE UNIQUE INDEX ix_ads_general_data_sales_project_fk ON ads_general_data (
    sales_project_fk
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
