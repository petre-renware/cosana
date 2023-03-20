--
-- File generated with SQLiteStudio v3.3.3 on Tue Jan 24 19:19:21 2023
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: ads_evaluation
DROP TABLE IF EXISTS ads_evaluation;

CREATE TABLE ads_evaluation (
    _pk                              VARCHAR (36)  NOT NULL,
    _customer_business               VARCHAR (10),
    _updated_by                      VARCHAR (100) NOT NULL,
    _updated_at                      DATETIME      NOT NULL,
    _disabled                        BOOLEAN       NOT NULL,
    sales_project_fk                 VARCHAR (36)  NOT NULL,
    remarks                          VARCHAR (100),
    _final_applicability             VARCHAR (10),
    _customer_financials             VARCHAR (10),
    _access_to_funds                 VARCHAR (10),
    _decisive_event                  VARCHAR (10),
    _formal_decision_making_criteria VARCHAR (10),
    _solution_matching               VARCHAR (10),
    _resources_required_to_sell      VARCHAR (10),
    _current_relation_with_customer  VARCHAR (10),
    _value_of_business_proposal      VARCHAR (10),
    PRIMARY KEY (
        _pk
    ),
    FOREIGN KEY (
        sales_project_fk
    )
    REFERENCES salesproject (_pk) ON DELETE CASCADE
                                  ON UPDATE CASCADE
);


-- Table: ads_general_data
DROP TABLE IF EXISTS ads_general_data;

CREATE TABLE ads_general_data (
    _pk                VARCHAR (36)  NOT NULL,
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
    _updated_by VARCHAR (100) NOT NULL,
    _updated_at DATETIME      NOT NULL,
    _disabled   BOOLEAN       NOT NULL,
    description VARCHAR (100) NOT NULL,
    notes       VARCHAR,
    PRIMARY KEY (
        _pk
    )
);


-- Index: ix_ads_evaluation__access_to_funds
DROP INDEX IF EXISTS ix_ads_evaluation__access_to_funds;

CREATE INDEX ix_ads_evaluation__access_to_funds ON ads_evaluation (
    _access_to_funds
);


-- Index: ix_ads_evaluation__current_relation_with_customer
DROP INDEX IF EXISTS ix_ads_evaluation__current_relation_with_customer;

CREATE INDEX ix_ads_evaluation__current_relation_with_customer ON ads_evaluation (
    _current_relation_with_customer
);


-- Index: ix_ads_evaluation__customer_business
DROP INDEX IF EXISTS ix_ads_evaluation__customer_business;

CREATE INDEX ix_ads_evaluation__customer_business ON ads_evaluation (
    _customer_business
);


-- Index: ix_ads_evaluation__customer_financials
DROP INDEX IF EXISTS ix_ads_evaluation__customer_financials;

CREATE INDEX ix_ads_evaluation__customer_financials ON ads_evaluation (
    _customer_financials
);


-- Index: ix_ads_evaluation__decisive_event
DROP INDEX IF EXISTS ix_ads_evaluation__decisive_event;

CREATE INDEX ix_ads_evaluation__decisive_event ON ads_evaluation (
    _decisive_event
);


-- Index: ix_ads_evaluation__disabled
DROP INDEX IF EXISTS ix_ads_evaluation__disabled;

CREATE INDEX ix_ads_evaluation__disabled ON ads_evaluation (
    _disabled
);


-- Index: ix_ads_evaluation__final_applicability
DROP INDEX IF EXISTS ix_ads_evaluation__final_applicability;

CREATE INDEX ix_ads_evaluation__final_applicability ON ads_evaluation (
    _final_applicability
);


-- Index: ix_ads_evaluation__formal_decision_making_criteria
DROP INDEX IF EXISTS ix_ads_evaluation__formal_decision_making_criteria;

CREATE INDEX ix_ads_evaluation__formal_decision_making_criteria ON ads_evaluation (
    _formal_decision_making_criteria
);


-- Index: ix_ads_evaluation__resources_required_to_sell
DROP INDEX IF EXISTS ix_ads_evaluation__resources_required_to_sell;

CREATE INDEX ix_ads_evaluation__resources_required_to_sell ON ads_evaluation (
    _resources_required_to_sell
);


-- Index: ix_ads_evaluation__solution_matching
DROP INDEX IF EXISTS ix_ads_evaluation__solution_matching;

CREATE INDEX ix_ads_evaluation__solution_matching ON ads_evaluation (
    _solution_matching
);


-- Index: ix_ads_evaluation__updated_by
DROP INDEX IF EXISTS ix_ads_evaluation__updated_by;

CREATE INDEX ix_ads_evaluation__updated_by ON ads_evaluation (
    _updated_by
);


-- Index: ix_ads_evaluation__value_of_business_proposal
DROP INDEX IF EXISTS ix_ads_evaluation__value_of_business_proposal;

CREATE INDEX ix_ads_evaluation__value_of_business_proposal ON ads_evaluation (
    _value_of_business_proposal
);


-- Index: ix_ads_evaluation_sales_project_fk
DROP INDEX IF EXISTS ix_ads_evaluation_sales_project_fk;

CREATE INDEX ix_ads_evaluation_sales_project_fk ON ads_evaluation (
    sales_project_fk
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


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
