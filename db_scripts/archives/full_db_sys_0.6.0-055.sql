--
-- File generated with SQLiteStudio v3.3.3 on Wed Feb 15 14:53:46 2023
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: ads_evaluation
DROP TABLE IF EXISTS ads_evaluation;

CREATE TABLE ads_evaluation (
    _pk                                VARCHAR (36)  NOT NULL,
    _updated_by                        VARCHAR (100) NOT NULL,
    _updated_at                        DATETIME      NOT NULL,
    _disabled                          BOOLEAN       NOT NULL,
    sales_project_fk                   VARCHAR (36)  NOT NULL,
    remarks                            VARCHAR (100),
    _final_applicability               VARCHAR (10),
    _customer_business                 VARCHAR (10),
    _customer_financials               VARCHAR (10),
    _access_to_funds                   VARCHAR (10),
    _decisive_event                    VARCHAR (10),
    _formal_decision_making_criteria   VARCHAR (10),
    _solution_matching                 VARCHAR (10),
    _resources_required_to_sell        VARCHAR (10),
    _current_relation_with_customer    VARCHAR (10),
    _value_of_business_proposal        VARCHAR (10),
    _internal_support                  VARCHAR (10),
    _credibility                       VARCHAR (10),
    _cultural_compatibility            VARCHAR (10),
    _approach_decision_making_criteria VARCHAR (10),
    _political_aspects                 VARCHAR (10),
    _short_term_revenue                VARCHAR (10),
    _long_term_revenue                 VARCHAR (10),
    _risk                              VARCHAR (10),
    _profitability                     VARCHAR (10),
    _strategical_value                 VARCHAR (10),
    PRIMARY KEY (
        _pk
    ),
    FOREIGN KEY (
        sales_project_fk
    )
    REFERENCES salesproject (_pk) ON DELETE CASCADE
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


-- Table: ads_org_map
DROP TABLE IF EXISTS ads_org_map;

CREATE TABLE ads_org_map (
    _pk              VARCHAR (36)  NOT NULL,
    _updated_by      VARCHAR (100) NOT NULL,
    _updated_at      DATETIME      NOT NULL,
    _disabled        BOOLEAN       NOT NULL,
    sales_project_fk VARCHAR (36)  NOT NULL,
    remarks          VARCHAR (100) NOT NULL,
    PRIMARY KEY (
        _pk
    ),
    FOREIGN KEY (
        sales_project_fk
    )
    REFERENCES salesproject (_pk) ON DELETE CASCADE
);


-- Table: ads_org_map_details
DROP TABLE IF EXISTS ads_org_map_details;

CREATE TABLE ads_org_map_details (
    _pk                  VARCHAR (36)  NOT NULL,
    _updated_by          VARCHAR (100) NOT NULL,
    _updated_at          DATETIME      NOT NULL,
    _disabled            BOOLEAN       NOT NULL,
    ads_org_map_fk       VARCHAR (36)  NOT NULL,
    code                 VARCHAR (10)  NOT NULL,
    name                 VARCHAR (50)  NOT NULL,
    decision_make        BOOLEAN       NOT NULL,
    need_to_sign         BOOLEAN       NOT NULL,
    technical_evaluation BOOLEAN       NOT NULL,
    financial_evaluation BOOLEAN       NOT NULL,
    consultant           BOOLEAN       NOT NULL,
    PRIMARY KEY (
        _pk
    ),
    CONSTRAINT uix_code_per_org_map UNIQUE (
        code,
        ads_org_map_fk
    ),
    FOREIGN KEY (
        ads_org_map_fk
    )
    REFERENCES ads_org_map (_pk) ON DELETE CASCADE
                                 ON UPDATE CASCADE
);


-- Table: ads_revenue
DROP TABLE IF EXISTS ads_revenue;

CREATE TABLE ads_revenue (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100) NOT NULL,
    _updated_at              DATETIME      NOT NULL,
    _disabled                BOOLEAN       NOT NULL,
    sales_project_fk         VARCHAR (36)  NOT NULL,
    remarks                  VARCHAR (100) NOT NULL,
    max_expected             FLOAT         NOT NULL,
    min_expected             FLOAT         NOT NULL,
    allocated_budget         FLOAT         NOT NULL,
    customer_min_expectation FLOAT         NOT NULL,
    customer_max_expectation FLOAT         NOT NULL,
    market_price             FLOAT         NOT NULL,
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
    _updated_by VARCHAR (100) NOT NULL,
    _updated_at DATETIME      NOT NULL,
    _disabled   BOOLEAN       NOT NULL,
    code        VARCHAR (10)  NOT NULL,
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


-- Index: ix_ads_evaluation__approach_decision_making_criteria
DROP INDEX IF EXISTS ix_ads_evaluation__approach_decision_making_criteria;

CREATE INDEX ix_ads_evaluation__approach_decision_making_criteria ON ads_evaluation (
    _approach_decision_making_criteria
);


-- Index: ix_ads_evaluation__credibility
DROP INDEX IF EXISTS ix_ads_evaluation__credibility;

CREATE INDEX ix_ads_evaluation__credibility ON ads_evaluation (
    _credibility
);


-- Index: ix_ads_evaluation__cultural_compatibility
DROP INDEX IF EXISTS ix_ads_evaluation__cultural_compatibility;

CREATE INDEX ix_ads_evaluation__cultural_compatibility ON ads_evaluation (
    _cultural_compatibility
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


-- Index: ix_ads_evaluation__internal_support
DROP INDEX IF EXISTS ix_ads_evaluation__internal_support;

CREATE INDEX ix_ads_evaluation__internal_support ON ads_evaluation (
    _internal_support
);


-- Index: ix_ads_evaluation__long_term_revenue
DROP INDEX IF EXISTS ix_ads_evaluation__long_term_revenue;

CREATE INDEX ix_ads_evaluation__long_term_revenue ON ads_evaluation (
    _long_term_revenue
);


-- Index: ix_ads_evaluation__political_aspects
DROP INDEX IF EXISTS ix_ads_evaluation__political_aspects;

CREATE INDEX ix_ads_evaluation__political_aspects ON ads_evaluation (
    _political_aspects
);


-- Index: ix_ads_evaluation__profitability
DROP INDEX IF EXISTS ix_ads_evaluation__profitability;

CREATE INDEX ix_ads_evaluation__profitability ON ads_evaluation (
    _profitability
);


-- Index: ix_ads_evaluation__resources_required_to_sell
DROP INDEX IF EXISTS ix_ads_evaluation__resources_required_to_sell;

CREATE INDEX ix_ads_evaluation__resources_required_to_sell ON ads_evaluation (
    _resources_required_to_sell
);


-- Index: ix_ads_evaluation__risk
DROP INDEX IF EXISTS ix_ads_evaluation__risk;

CREATE INDEX ix_ads_evaluation__risk ON ads_evaluation (
    _risk
);


-- Index: ix_ads_evaluation__short_term_revenue
DROP INDEX IF EXISTS ix_ads_evaluation__short_term_revenue;

CREATE INDEX ix_ads_evaluation__short_term_revenue ON ads_evaluation (
    _short_term_revenue
);


-- Index: ix_ads_evaluation__solution_matching
DROP INDEX IF EXISTS ix_ads_evaluation__solution_matching;

CREATE INDEX ix_ads_evaluation__solution_matching ON ads_evaluation (
    _solution_matching
);


-- Index: ix_ads_evaluation__strategical_value
DROP INDEX IF EXISTS ix_ads_evaluation__strategical_value;

CREATE INDEX ix_ads_evaluation__strategical_value ON ads_evaluation (
    _strategical_value
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

CREATE UNIQUE INDEX ix_ads_evaluation_sales_project_fk ON ads_evaluation (
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


-- Index: ix_ads_org_map__disabled
DROP INDEX IF EXISTS ix_ads_org_map__disabled;

CREATE INDEX ix_ads_org_map__disabled ON ads_org_map (
    _disabled
);


-- Index: ix_ads_org_map__updated_by
DROP INDEX IF EXISTS ix_ads_org_map__updated_by;

CREATE INDEX ix_ads_org_map__updated_by ON ads_org_map (
    _updated_by
);


-- Index: ix_ads_org_map_details__disabled
DROP INDEX IF EXISTS ix_ads_org_map_details__disabled;

CREATE INDEX ix_ads_org_map_details__disabled ON ads_org_map_details (
    _disabled
);


-- Index: ix_ads_org_map_details__updated_by
DROP INDEX IF EXISTS ix_ads_org_map_details__updated_by;

CREATE INDEX ix_ads_org_map_details__updated_by ON ads_org_map_details (
    _updated_by
);


-- Index: ix_ads_org_map_details_ads_org_map_fk
DROP INDEX IF EXISTS ix_ads_org_map_details_ads_org_map_fk;

CREATE INDEX ix_ads_org_map_details_ads_org_map_fk ON ads_org_map_details (
    ads_org_map_fk
);


-- Index: ix_ads_org_map_details_code
DROP INDEX IF EXISTS ix_ads_org_map_details_code;

CREATE INDEX ix_ads_org_map_details_code ON ads_org_map_details (
    code
);


-- Index: ix_ads_org_map_details_consultant
DROP INDEX IF EXISTS ix_ads_org_map_details_consultant;

CREATE INDEX ix_ads_org_map_details_consultant ON ads_org_map_details (
    consultant
);


-- Index: ix_ads_org_map_details_decision_make
DROP INDEX IF EXISTS ix_ads_org_map_details_decision_make;

CREATE INDEX ix_ads_org_map_details_decision_make ON ads_org_map_details (
    decision_make
);


-- Index: ix_ads_org_map_details_financial_evaluation
DROP INDEX IF EXISTS ix_ads_org_map_details_financial_evaluation;

CREATE INDEX ix_ads_org_map_details_financial_evaluation ON ads_org_map_details (
    financial_evaluation
);


-- Index: ix_ads_org_map_details_name
DROP INDEX IF EXISTS ix_ads_org_map_details_name;

CREATE INDEX ix_ads_org_map_details_name ON ads_org_map_details (
    name
);


-- Index: ix_ads_org_map_details_need_to_sign
DROP INDEX IF EXISTS ix_ads_org_map_details_need_to_sign;

CREATE INDEX ix_ads_org_map_details_need_to_sign ON ads_org_map_details (
    need_to_sign
);


-- Index: ix_ads_org_map_details_technical_evaluation
DROP INDEX IF EXISTS ix_ads_org_map_details_technical_evaluation;

CREATE INDEX ix_ads_org_map_details_technical_evaluation ON ads_org_map_details (
    technical_evaluation
);


-- Index: ix_ads_org_map_sales_project_fk
DROP INDEX IF EXISTS ix_ads_org_map_sales_project_fk;

CREATE UNIQUE INDEX ix_ads_org_map_sales_project_fk ON ads_org_map (
    sales_project_fk
);


-- Index: ix_ads_revenue__disabled
DROP INDEX IF EXISTS ix_ads_revenue__disabled;

CREATE INDEX ix_ads_revenue__disabled ON ads_revenue (
    _disabled
);


-- Index: ix_ads_revenue__updated_by
DROP INDEX IF EXISTS ix_ads_revenue__updated_by;

CREATE INDEX ix_ads_revenue__updated_by ON ads_revenue (
    _updated_by
);


-- Index: ix_ads_revenue_sales_project_fk
DROP INDEX IF EXISTS ix_ads_revenue_sales_project_fk;

CREATE UNIQUE INDEX ix_ads_revenue_sales_project_fk ON ads_revenue (
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
