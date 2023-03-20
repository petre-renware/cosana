--
-- File generated with SQLiteStudio v3.3.3 on Thu Dec 8 12:34:31 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: alembic_version
CREATE TABLE alembic_version (
    version_num VARCHAR (32) NOT NULL,
    CONSTRAINT alembic_version_pkc PRIMARY KEY (
        version_num
    )
);

INSERT INTO alembic_version (
                                version_num
                            )
                            VALUES (
                                'f1f42b323ef0'
                            );


-- Table: company
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


-- Table: sales_project
CREATE TABLE sales_project (
    _pk         VARCHAR (36)  NOT NULL,
    code        VARCHAR (10)  NOT NULL,
    _updated_by VARCHAR (100) NOT NULL,
    _updated_at DATETIME      NOT NULL,
    _disabled   BOOLEAN       NOT NULL,
    description VARCHAR (100) NOT NULL,
    notes       VARCHAR,
    company_fk  VARCHAR (36),
    PRIMARY KEY (
        _pk
    ),
    FOREIGN KEY (
        company_fk
    )
    REFERENCES company (_pk) 
);


-- Table: solution
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
CREATE INDEX ix_company__disabled ON company (
    _disabled
);


-- Index: ix_company__updated_by
CREATE INDEX ix_company__updated_by ON company (
    _updated_by
);


-- Index: ix_company_code
CREATE UNIQUE INDEX ix_company_code ON company (
    code
);


-- Index: ix_sales_project__disabled
CREATE INDEX ix_sales_project__disabled ON sales_project (
    _disabled
);


-- Index: ix_sales_project__updated_by
CREATE INDEX ix_sales_project__updated_by ON sales_project (
    _updated_by
);


-- Index: ix_sales_project_code
CREATE UNIQUE INDEX ix_sales_project_code ON sales_project (
    code
);


-- Index: ix_sales_project_company_fk
CREATE INDEX ix_sales_project_company_fk ON sales_project (
    company_fk
);


-- Index: ix_solution__disabled
CREATE INDEX ix_solution__disabled ON solution (
    _disabled
);


-- Index: ix_solution__updated_by
CREATE INDEX ix_solution__updated_by ON solution (
    _updated_by
);


-- Index: ix_solution_code
CREATE UNIQUE INDEX ix_solution_code ON solution (
    code
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
