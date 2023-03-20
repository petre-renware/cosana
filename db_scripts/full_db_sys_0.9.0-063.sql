--
-- File generated with SQLiteStudio v3.3.3 on Wed Mar 1 04:34:51 2023
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: ads_decision_criteria
CREATE TABLE ads_decision_criteria (
    _pk              VARCHAR (36)  NOT NULL,
    remarks          VARCHAR (100) NOT NULL,
    _updated_by      VARCHAR (100) NOT NULL,
    _updated_at      DATETIME      NOT NULL,
    _disabled        BOOLEAN       NOT NULL,
    sales_project_fk VARCHAR (36)  NOT NULL,
    CONSTRAINT pk_ads_decision_criteria PRIMARY KEY (
        _pk
    ),
    CONSTRAINT fk_ads_decision_criteria_sales_project_fk_salesproject FOREIGN KEY (
        sales_project_fk
    )
    REFERENCES salesproject (_pk) ON DELETE CASCADE
                                  ON UPDATE CASCADE
);


-- Table: ads_decision_criteria_details_1criterialist
CREATE TABLE ads_decision_criteria_details_1criterialist (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100) NOT NULL,
    _updated_at              DATETIME      NOT NULL,
    _disabled                BOOLEAN       NOT NULL,
    ads_decision_criteria_fk VARCHAR (36)  NOT NULL,
    name                     VARCHAR (50)  NOT NULL,
    our_status               VARCHAR (20)  NOT NULL,
    CONSTRAINT pk_ads_decision_criteria_details_1criterialist PRIMARY KEY (
        _pk
    ),
    CONSTRAINT uix_name_per_solution UNIQUE (
        name,
        ads_decision_criteria_fk
    ),
    CONSTRAINT fk_ads_decision_criteria_details_1criterialist_ads_decision_criteria_fk_ads_decision_criteria FOREIGN KEY (
        ads_decision_criteria_fk
    )
    REFERENCES ads_decision_criteria (_pk) ON DELETE CASCADE
                                           ON UPDATE CASCADE
);


-- Table: ads_decision_criteria_details_2maptoperson
CREATE TABLE ads_decision_criteria_details_2maptoperson (
    _pk                                            VARCHAR (36)  NOT NULL,
    _updated_by                                    VARCHAR (100) NOT NULL,
    _updated_at                                    DATETIME      NOT NULL,
    _disabled                                      BOOLEAN       NOT NULL,
    ads_decision_criteria_details_1criterialist_fk VARCHAR (36)  NOT NULL,
    ads_relationships_details_fk                   VARCHAR (36),
    client_importance                              VARCHAR (20)  NOT NULL,
    CONSTRAINT pk_ads_decision_criteria_details_2maptoperson PRIMARY KEY (
        _pk
    ),
    CONSTRAINT uix_person_per_criteria UNIQUE (
        ads_decision_criteria_details_1criterialist_fk,
        ads_relationships_details_fk
    ),
    CONSTRAINT fk_ads_decision_criteria_details_2maptoperson_ads_decision_criteria_details_1criterialist_fk_ads_decision_criteria_details_1criterialist FOREIGN KEY (
        ads_decision_criteria_details_1criterialist_fk
    )
    REFERENCES ads_decision_criteria_details_1criterialist (_pk) ON DELETE CASCADE
                                                                 ON UPDATE CASCADE,
    CONSTRAINT fk_ads_decision_criteria_details_2maptoperson_ads_relationships_details_fk_ads_relationships_details FOREIGN KEY (
        ads_relationships_details_fk
    )
    REFERENCES ads_relationships_details (_pk) ON DELETE CASCADE
                                               ON UPDATE CASCADE
);


-- Table: ads_evaluation
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
    CONSTRAINT pk_ads_evaluation PRIMARY KEY (
        _pk
    ),
    CONSTRAINT fk_ads_evaluation_sales_project_fk_salesproject FOREIGN KEY (
        sales_project_fk
    )
    REFERENCES salesproject (_pk) ON DELETE CASCADE
);

INSERT INTO ads_evaluation (
                               _pk,
                               _updated_by,
                               _updated_at,
                               _disabled,
                               sales_project_fk,
                               remarks,
                               _final_applicability,
                               _customer_business,
                               _customer_financials,
                               _access_to_funds,
                               _decisive_event,
                               _formal_decision_making_criteria,
                               _solution_matching,
                               _resources_required_to_sell,
                               _current_relation_with_customer,
                               _value_of_business_proposal,
                               _internal_support,
                               _credibility,
                               _cultural_compatibility,
                               _approach_decision_making_criteria,
                               _political_aspects,
                               _short_term_revenue,
                               _long_term_revenue,
                               _risk,
                               _profitability,
                               _strategical_value
                           )
                           VALUES (
                               '7abd1fad-59ea-4453-b838-0d12c45288e7',
                               'anonymus',
                               '2023-02-19 15:43:00.301945',
                               0,
                               '09c8b36a-035d-49b2-acef-3b63783977a2',
                               'introdus de Petre ca elemnte mediane (valori de mijloc !)',
                               'A_001_002',
                               'A_002_002',
                               'A_003_002',
                               'A_004_002',
                               'A_005_002',
                               'B_006_002',
                               'B_007_002',
                               'B_008_003',
                               'B_009_002',
                               'B_010_002',
                               'C_011_002',
                               'C_012_002',
                               'C_013_002',
                               'C_014_002',
                               'C_015_002',
                               'D_016_002',
                               'D_017_002',
                               'D_019_002',
                               'D_018_002',
                               'D_020_002'
                           );

INSERT INTO ads_evaluation (
                               _pk,
                               _updated_by,
                               _updated_at,
                               _disabled,
                               sales_project_fk,
                               remarks,
                               _final_applicability,
                               _customer_business,
                               _customer_financials,
                               _access_to_funds,
                               _decisive_event,
                               _formal_decision_making_criteria,
                               _solution_matching,
                               _resources_required_to_sell,
                               _current_relation_with_customer,
                               _value_of_business_proposal,
                               _internal_support,
                               _credibility,
                               _cultural_compatibility,
                               _approach_decision_making_criteria,
                               _political_aspects,
                               _short_term_revenue,
                               _long_term_revenue,
                               _risk,
                               _profitability,
                               _strategical_value
                           )
                           VALUES (
                               'e745118b-5fc9-4c32-bba2-f2cbdafe3c17',
                               'anonymus',
                               '2023-02-22 17:17:52.826508',
                               0,
                               '05761692-a971-4f04-8c3a-67ad1d9628c2',
                               'CRITERIILE DE MAI JOS NU SUNT SUFICIENTE. Nu pot alege cu suficienta acuratete un criteriu. De exemplu: 
Customer business: Business recovery.
Customer financials: WELL  
Acces to funds: trebuie separat NO de I DO NOT KNOW. In general as prefera criterii unice.
Se scrie greu in acest spatiu pt Remarks.
',
                               'A_001_003',
                               'A_002_003',
                               'A_003_003',
                               'A_004_001',
                               'A_005_003',
                               'B_006_002',
                               'B_007_003',
                               'B_008_002',
                               'B_009_002',
                               'B_010_003',
                               'C_011_002',
                               'C_012_003',
                               'C_013_001',
                               'C_014_003',
                               'C_015_001',
                               'D_016_002',
                               'D_017_003',
                               'D_019_001',
                               'D_018_001',
                               'D_020_002'
                           );


-- Table: ads_general_data
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
    CONSTRAINT pk_ads_general_data PRIMARY KEY (
        _pk
    ),
    CONSTRAINT fk_ads_general_data_sales_project_fk_salesproject FOREIGN KEY (
        sales_project_fk
    )
    REFERENCES salesproject (_pk) ON DELETE CASCADE
);

INSERT INTO ads_general_data (
                                 _pk,
                                 _updated_by,
                                 _updated_at,
                                 _disabled,
                                 sales_project_fk,
                                 decisive_event,
                                 competition,
                                 potential_problems,
                                 team_members,
                                 client_company
                             )
                             VALUES (
                                 '58c6a74e-c2e3-48eb-ae2a-e960493f2248',
                                 'anonymus',
                                 '2023-02-19 15:40:58.697406',
                                 0,
                                 '09c8b36a-035d-49b2-acef-3b63783977a2',
                                 'de @ 230219 h18:25',
                                 'co @ 230219 h18:25',
                                 'pp @ 230219 h18:25',
                                 'tm @ 230219 h18:25',
                                 'cc @ 230219 h18:25'
                             );

INSERT INTO ads_general_data (
                                 _pk,
                                 _updated_by,
                                 _updated_at,
                                 _disabled,
                                 sales_project_fk,
                                 decisive_event,
                                 competition,
                                 potential_problems,
                                 team_members,
                                 client_company
                             )
                             VALUES (
                                 '9bd66f88-56ff-43a1-b673-ca4a303d7c13',
                                 'anonymus',
                                 '2023-02-22 17:05:29.155761',
                                 0,
                                 '05761692-a971-4f04-8c3a-67ad1d9628c2',
                                 'Cresterea fortei de vanzare a companiei in 2003',
                                 'Competitie 1 - companie germana bine pozitionata pe piata noastra.
Competitie 2 - companie americana / new entry',
                                 'Management indecis.
IT reticent.',
                                 'Liviu, Anca, Horia',
                                 'Principalii clienti sunt din domeniul UTILITATILOR.'
                             );


-- Table: ads_org_map
CREATE TABLE ads_org_map (
    _pk              VARCHAR (36)  NOT NULL,
    _updated_by      VARCHAR (100) NOT NULL,
    _updated_at      DATETIME      NOT NULL,
    _disabled        BOOLEAN       NOT NULL,
    sales_project_fk VARCHAR (36)  NOT NULL,
    remarks          VARCHAR (100) NOT NULL,
    CONSTRAINT pk_ads_org_map PRIMARY KEY (
        _pk
    ),
    CONSTRAINT fk_ads_org_map_sales_project_fk_salesproject FOREIGN KEY (
        sales_project_fk
    )
    REFERENCES salesproject (_pk) ON DELETE CASCADE
);

INSERT INTO ads_org_map (
                            _pk,
                            _updated_by,
                            _updated_at,
                            _disabled,
                            sales_project_fk,
                            remarks
                        )
                        VALUES (
                            'a4bed9eb-5035-47d3-9153-6805e6ab43e2',
                            'anonymus',
                            '2023-02-19 15:44:42.227731',
                            0,
                            '09c8b36a-035d-49b2-acef-3b63783977a2',
                            'ceva ce contine cam strictul minim de care "te lovesti" intr-un cont'
                        );


-- Table: ads_org_map_details
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
    CONSTRAINT pk_ads_org_map_details PRIMARY KEY (
        _pk
    ),
    CONSTRAINT fk_ads_org_map_details_ads_org_map_fk_ads_org_map FOREIGN KEY (
        ads_org_map_fk
    )
    REFERENCES ads_org_map (_pk) ON DELETE CASCADE
                                 ON UPDATE CASCADE,
    CONSTRAINT uix_code_per_org_map UNIQUE (
        code,
        ads_org_map_fk
    )
);

INSERT INTO ads_org_map_details (
                                    _pk,
                                    _updated_by,
                                    _updated_at,
                                    _disabled,
                                    ads_org_map_fk,
                                    code,
                                    name,
                                    decision_make,
                                    need_to_sign,
                                    technical_evaluation,
                                    financial_evaluation,
                                    consultant
                                )
                                VALUES (
                                    'ad484237-7357-4371-bea2-560188b9e0c3',
                                    'anonymus',
                                    '2023-02-19 15:45:10.259668',
                                    0,
                                    'a4bed9eb-5035-47d3-9153-6805e6ab43e2',
                                    'GM',
                                    'general manager',
                                    1,
                                    1,
                                    0,
                                    0,
                                    0
                                );

INSERT INTO ads_org_map_details (
                                    _pk,
                                    _updated_by,
                                    _updated_at,
                                    _disabled,
                                    ads_org_map_fk,
                                    code,
                                    name,
                                    decision_make,
                                    need_to_sign,
                                    technical_evaluation,
                                    financial_evaluation,
                                    consultant
                                )
                                VALUES (
                                    '4c4b9cfb-61db-4a95-807b-7df711fa1883',
                                    'anonymus',
                                    '2023-02-19 15:45:31.059267',
                                    0,
                                    'a4bed9eb-5035-47d3-9153-6805e6ab43e2',
                                    'FM',
                                    'financial manager',
                                    0,
                                    1,
                                    0,
                                    1,
                                    0
                                );

INSERT INTO ads_org_map_details (
                                    _pk,
                                    _updated_by,
                                    _updated_at,
                                    _disabled,
                                    ads_org_map_fk,
                                    code,
                                    name,
                                    decision_make,
                                    need_to_sign,
                                    technical_evaluation,
                                    financial_evaluation,
                                    consultant
                                )
                                VALUES (
                                    'af785866-2434-483d-a2a1-d8ea02d3608e',
                                    'anonymus',
                                    '2023-02-21 01:57:54.307553',
                                    0,
                                    'a4bed9eb-5035-47d3-9153-6805e6ab43e2',
                                    'IT',
                                    'it manager',
                                    0,
                                    0,
                                    1,
                                    0,
                                    1
                                );

INSERT INTO ads_org_map_details (
                                    _pk,
                                    _updated_by,
                                    _updated_at,
                                    _disabled,
                                    ads_org_map_fk,
                                    code,
                                    name,
                                    decision_make,
                                    need_to_sign,
                                    technical_evaluation,
                                    financial_evaluation,
                                    consultant
                                )
                                VALUES (
                                    '3a0fade9-f88a-41bc-98d3-a496bb047203',
                                    'anonymus',
                                    '2023-02-19 15:46:37.385424',
                                    0,
                                    'a4bed9eb-5035-47d3-9153-6805e6ab43e2',
                                    'ADM',
                                    'board of directors',
                                    1,
                                    0,
                                    0,
                                    1,
                                    0
                                );

INSERT INTO ads_org_map_details (
                                    _pk,
                                    _updated_by,
                                    _updated_at,
                                    _disabled,
                                    ads_org_map_fk,
                                    code,
                                    name,
                                    decision_make,
                                    need_to_sign,
                                    technical_evaluation,
                                    financial_evaluation,
                                    consultant
                                )
                                VALUES (
                                    '24b885dc-957c-438a-8a48-6adedc25391f',
                                    'anonymus',
                                    '2023-02-21 01:03:39.084847',
                                    0,
                                    'a4bed9eb-5035-47d3-9153-6805e6ab43e2',
                                    'COMISE',
                                    'comisia de evaluare tehnica - for gov',
                                    1,
                                    0,
                                    1,
                                    0,
                                    1
                                );


-- Table: ads_relationships
CREATE TABLE ads_relationships (
    _pk              VARCHAR (36)  NOT NULL,
    _updated_by      VARCHAR (100) NOT NULL,
    _updated_at      DATETIME      NOT NULL,
    _disabled        BOOLEAN       NOT NULL,
    sales_project_fk VARCHAR (36)  NOT NULL,
    remarks          VARCHAR (100) NOT NULL,
    CONSTRAINT pk_ads_relationships PRIMARY KEY (
        _pk
    ),
    CONSTRAINT fk_ads_relationships_sales_project_fk_salesproject FOREIGN KEY (
        sales_project_fk
    )
    REFERENCES salesproject (_pk) ON DELETE CASCADE
                                  ON UPDATE CASCADE
);

INSERT INTO ads_relationships (
                                  _pk,
                                  _updated_by,
                                  _updated_at,
                                  _disabled,
                                  sales_project_fk,
                                  remarks
                              )
                              VALUES (
                                  'xxx',
                                  'anonymus',
                                  '2023-02-25 05:57:09.163165',
                                  0,
                                  '09c8b36a-035d-49b2-acef-3b63783977a2',
                                  'x-remarks /updated @230225 h08:00'
                              );


-- Table: ads_relationships_details
CREATE TABLE ads_relationships_details (
    _pk                    VARCHAR (36)  NOT NULL,
    _updated_by            VARCHAR (100) NOT NULL,
    _updated_at            DATETIME      NOT NULL,
    _disabled              BOOLEAN       NOT NULL,
    ads_relationships_fk   VARCHAR (36)  NOT NULL,
    name                   VARCHAR (50)  NOT NULL,
    position               VARCHAR (36)  NOT NULL,
    change_adaptability    VARCHAR (20)  NOT NULL,
    our_status_in_relation VARCHAR (20)  NOT NULL,
    contact_status         VARCHAR (20)  NOT NULL,
    CONSTRAINT pk_ads_relationships_details PRIMARY KEY (
        _pk
    ),
    CONSTRAINT fk_ads_relationships_details_ads_relationships_fk_ads_relationships FOREIGN KEY (
        ads_relationships_fk
    )
    REFERENCES ads_relationships (_pk) ON DELETE CASCADE
                                       ON UPDATE CASCADE,
    CONSTRAINT fk_ads_relationships_details_position_ads_org_map_details FOREIGN KEY (
        position
    )
    REFERENCES ads_org_map_details (_pk) ON DELETE RESTRICT
                                         ON UPDATE RESTRICT,
    CONSTRAINT uix_name_per_relationships UNIQUE (
        name,
        ads_relationships_fk
    )
);

INSERT INTO ads_relationships_details (
                                          _pk,
                                          _updated_by,
                                          _updated_at,
                                          _disabled,
                                          ads_relationships_fk,
                                          name,
                                          position,
                                          change_adaptability,
                                          our_status_in_relation,
                                          contact_status
                                      )
                                      VALUES (
                                          'pkd1',
                                          'anonymus',
                                          '2023-02-22 03:49:54.755954',
                                          0,
                                          'xxx',
                                          'Petre_1 general manager',
                                          'ad484237-7357-4371-bea2-560188b9e0c3',
                                          'Visionary',
                                          'Supporter',
                                          'Briefly-Contacted'
                                      );

INSERT INTO ads_relationships_details (
                                          _pk,
                                          _updated_by,
                                          _updated_at,
                                          _disabled,
                                          ads_relationships_fk,
                                          name,
                                          position,
                                          change_adaptability,
                                          our_status_in_relation,
                                          contact_status
                                      )
                                      VALUES (
                                          'pkd2',
                                          'petre_2',
                                          '2023-02-21 15:39:30.207873',
                                          0,
                                          'xxx',
                                          'Petre_2 IT manaege',
                                          'af785866-2434-483d-a2a1-d8ea02d3608e',
                                          'Innovator',
                                          'Mentor',
                                          'Multiple-Contacts'
                                      );

INSERT INTO ads_relationships_details (
                                          _pk,
                                          _updated_by,
                                          _updated_at,
                                          _disabled,
                                          ads_relationships_fk,
                                          name,
                                          position,
                                          change_adaptability,
                                          our_status_in_relation,
                                          contact_status
                                      )
                                      VALUES (
                                          '3f7fda32-8717-4a03-9215-87a7997aa068',
                                          'anonymus',
                                          '2023-02-22 04:02:03.732838',
                                          0,
                                          'xxx',
                                          'Popescu Marian',
                                          '3a0fade9-f88a-41bc-98d3-a496bb047203',
                                          'Pragmatic',
                                          'Neutral',
                                          'Briefly-Contacted'
                                      );


-- Table: ads_revenue
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
    CONSTRAINT pk_ads_revenue PRIMARY KEY (
        _pk
    ),
    CONSTRAINT fk_ads_revenue_sales_project_fk_salesproject FOREIGN KEY (
        sales_project_fk
    )
    REFERENCES salesproject (_pk) ON DELETE CASCADE
);

INSERT INTO ads_revenue (
                            _pk,
                            _updated_by,
                            _updated_at,
                            _disabled,
                            sales_project_fk,
                            remarks,
                            max_expected,
                            min_expected,
                            allocated_budget,
                            customer_min_expectation,
                            customer_max_expectation,
                            market_price
                        )
                        VALUES (
                            '5dfca271-078e-498b-83b6-238190c68eed',
                            'anonymus',
                            '2023-02-19 15:48:57.601344',
                            0,
                            '09c8b36a-035d-49b2-acef-3b63783977a2',
                            'asa a fost identificata de colegul Marian',
                            30000.0,
                            10000.0,
                            15000.0,
                            10000.0,
                            15000.0,
                            25000.0
                        );


-- Table: ads_solution
CREATE TABLE ads_solution (
    _pk              VARCHAR (36)  NOT NULL,
    _updated_by      VARCHAR (100) NOT NULL,
    _updated_at      DATETIME      NOT NULL,
    _disabled        BOOLEAN       NOT NULL,
    sales_project_fk VARCHAR (36)  NOT NULL,
    remarks          VARCHAR (100) NOT NULL,
    name             VARCHAR (100) NOT NULL,
    description      VARCHAR (100) NOT NULL,
    CONSTRAINT pk_ads_solution PRIMARY KEY (
        _pk
    ),
    CONSTRAINT fk_ads_solution_sales_project_fk_salesproject FOREIGN KEY (
        sales_project_fk
    )
    REFERENCES salesproject (_pk) ON DELETE CASCADE
                                  ON UPDATE CASCADE
);

INSERT INTO ads_solution (
                             _pk,
                             _updated_by,
                             _updated_at,
                             _disabled,
                             sales_project_fk,
                             remarks,
                             name,
                             description
                         )
                         VALUES (
                             'testPK',
                             'anonymus',
                             '2023-02-25 06:16:23.588470',
                             0,
                             '09c8b36a-035d-49b2-acef-3b63783977a2',
                             'inregistrare de test api GET /upd 230225 h08:16',
                             'solutie de test intro de Petre /upd 230225 h08:16',
                             'descriere solutie de test /upd 230225 h08:16'
                         );


-- Table: ads_solution_details
CREATE TABLE ads_solution_details (
    _pk             VARCHAR (36)  NOT NULL,
    _updated_by     VARCHAR (100) NOT NULL,
    _updated_at     DATETIME      NOT NULL,
    _disabled       BOOLEAN       NOT NULL,
    ads_solution_fk VARCHAR (36)  NOT NULL,
    name            VARCHAR (50)  NOT NULL,
    strength        VARCHAR (20)  NOT NULL,
    feature_type    VARCHAR (20)  NOT NULL,
    CONSTRAINT pk_ads_solution_details PRIMARY KEY (
        _pk
    ),
    CONSTRAINT fk_ads_solution_details_ads_solution_fk_ads_solution FOREIGN KEY (
        ads_solution_fk
    )
    REFERENCES ads_solution (_pk) ON DELETE CASCADE
                                  ON UPDATE CASCADE,
    CONSTRAINT uix_name_per_solution UNIQUE (
        name,
        ads_solution_fk
    )
);

INSERT INTO ads_solution_details (
                                     _pk,
                                     _updated_by,
                                     _updated_at,
                                     _disabled,
                                     ads_solution_fk,
                                     name,
                                     strength,
                                     feature_type
                                 )
                                 VALUES (
                                     '89271aaa-e168-4902-9fe4-589ffeaea02e',
                                     'anonymus',
                                     '2023-02-25 13:57:00.968735',
                                     0,
                                     'testPK',
                                     'element 2',
                                     'Strong',
                                     'Characteristic'
                                 );

INSERT INTO ads_solution_details (
                                     _pk,
                                     _updated_by,
                                     _updated_at,
                                     _disabled,
                                     ads_solution_fk,
                                     name,
                                     strength,
                                     feature_type
                                 )
                                 VALUES (
                                     '8d88150c-54bf-48df-bd5e-4ba07ae8ddb1',
                                     'anonymus',
                                     '2023-02-25 13:56:51.099727',
                                     0,
                                     'testPK',
                                     'si inca un element intro de Petre tot  @230225 h15:55',
                                     'Weak',
                                     'Benefit'
                                 );


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
                                '194f4ccf54ac'
                            );


-- Table: company
CREATE TABLE company (
    _pk         VARCHAR (36)  NOT NULL,
    _updated_by VARCHAR (100) NOT NULL,
    _updated_at DATETIME      NOT NULL,
    _disabled   BOOLEAN       NOT NULL,
    description VARCHAR (10)  NOT NULL,
    CONSTRAINT pk_company PRIMARY KEY (
        _pk
    )
);


-- Table: salesproject
CREATE TABLE salesproject (
    _pk         VARCHAR (36)  NOT NULL,
    _updated_by VARCHAR (100) NOT NULL,
    _updated_at DATETIME      NOT NULL,
    _disabled   BOOLEAN       NOT NULL,
    code        VARCHAR (10)  NOT NULL,
    description VARCHAR (100) NOT NULL,
    notes       VARCHAR,
    CONSTRAINT pk_salesproject PRIMARY KEY (
        _pk
    )
);

INSERT INTO salesproject (
                             _pk,
                             _updated_by,
                             _updated_at,
                             _disabled,
                             code,
                             description,
                             notes
                         )
                         VALUES (
                             '09c8b36a-035d-49b2-acef-3b63783977a2',
                             'anonymus',
                             '2023-02-19 15:39:30.207873',
                             0,
                             'COSANA',
                             'proiect COSANA',
                             'full and complete test'
                         );

INSERT INTO salesproject (
                             _pk,
                             _updated_by,
                             _updated_at,
                             _disabled,
                             code,
                             description,
                             notes
                         )
                         VALUES (
                             '6aece913-f670-44f2-a3e6-8385819971f4',
                             'anonymus',
                             '2023-02-19 15:40:14.842810',
                             0,
                             'ARSTORM',
                             'proiect ARSTOTM',
                             'teste pentru coplete new business domains'
                         );

INSERT INTO salesproject (
                             _pk,
                             _updated_by,
                             _updated_at,
                             _disabled,
                             code,
                             description,
                             notes
                         )
                         VALUES (
                             '05761692-a971-4f04-8c3a-67ad1d9628c2',
                             'anonymus',
                             '2023-02-22 17:00:40.065824',
                             0,
                             'S100',
                             'Proiect PRIMUL TEST ',
                             'Sa vad ce am inteles pana acum.'
                         );


-- Table: solution
CREATE TABLE solution (
    _pk         VARCHAR (36)  NOT NULL,
    _updated_by VARCHAR (100) NOT NULL,
    _updated_at DATETIME      NOT NULL,
    _disabled   BOOLEAN       NOT NULL,
    description VARCHAR (100) NOT NULL,
    notes       VARCHAR,
    CONSTRAINT pk_solution PRIMARY KEY (
        _pk
    )
);


-- Index: ix_ads_decision_criteria__disabled
CREATE INDEX ix_ads_decision_criteria__disabled ON ads_decision_criteria (
    _disabled
);


-- Index: ix_ads_decision_criteria__updated_by
CREATE INDEX ix_ads_decision_criteria__updated_by ON ads_decision_criteria (
    _updated_by
);


-- Index: ix_ads_decision_criteria_details_1criterialist__disabled
CREATE INDEX ix_ads_decision_criteria_details_1criterialist__disabled ON ads_decision_criteria_details_1criterialist (
    _disabled
);


-- Index: ix_ads_decision_criteria_details_1criterialist__updated_by
CREATE INDEX ix_ads_decision_criteria_details_1criterialist__updated_by ON ads_decision_criteria_details_1criterialist (
    _updated_by
);


-- Index: ix_ads_decision_criteria_details_1criterialist_ads_decision_criteria_fk
CREATE INDEX ix_ads_decision_criteria_details_1criterialist_ads_decision_criteria_fk ON ads_decision_criteria_details_1criterialist (
    ads_decision_criteria_fk
);


-- Index: ix_ads_decision_criteria_details_1criterialist_name
CREATE INDEX ix_ads_decision_criteria_details_1criterialist_name ON ads_decision_criteria_details_1criterialist (
    name
);


-- Index: ix_ads_decision_criteria_details_1criterialist_our_status
CREATE INDEX ix_ads_decision_criteria_details_1criterialist_our_status ON ads_decision_criteria_details_1criterialist (
    our_status
);


-- Index: ix_ads_decision_criteria_details_2maptoperson__disabled
CREATE INDEX ix_ads_decision_criteria_details_2maptoperson__disabled ON ads_decision_criteria_details_2maptoperson (
    _disabled
);


-- Index: ix_ads_decision_criteria_details_2maptoperson__updated_by
CREATE INDEX ix_ads_decision_criteria_details_2maptoperson__updated_by ON ads_decision_criteria_details_2maptoperson (
    _updated_by
);


-- Index: ix_ads_decision_criteria_details_2maptoperson_ads_decision_criteria_details_1criterialist_fk
CREATE INDEX ix_ads_decision_criteria_details_2maptoperson_ads_decision_criteria_details_1criterialist_fk ON ads_decision_criteria_details_2maptoperson (
    ads_decision_criteria_details_1criterialist_fk
);


-- Index: ix_ads_decision_criteria_details_2maptoperson_ads_relationships_details_fk
CREATE INDEX ix_ads_decision_criteria_details_2maptoperson_ads_relationships_details_fk ON ads_decision_criteria_details_2maptoperson (
    ads_relationships_details_fk
);


-- Index: ix_ads_decision_criteria_details_2maptoperson_client_importance
CREATE INDEX ix_ads_decision_criteria_details_2maptoperson_client_importance ON ads_decision_criteria_details_2maptoperson (
    client_importance
);


-- Index: ix_ads_decision_criteria_remarks
CREATE INDEX ix_ads_decision_criteria_remarks ON ads_decision_criteria (
    remarks
);


-- Index: ix_ads_decision_criteria_sales_project_fk
CREATE UNIQUE INDEX ix_ads_decision_criteria_sales_project_fk ON ads_decision_criteria (
    sales_project_fk
);


-- Index: ix_ads_evaluation__access_to_funds
CREATE INDEX ix_ads_evaluation__access_to_funds ON ads_evaluation (
    _access_to_funds
);


-- Index: ix_ads_evaluation__approach_decision_making_criteria
CREATE INDEX ix_ads_evaluation__approach_decision_making_criteria ON ads_evaluation (
    _approach_decision_making_criteria
);


-- Index: ix_ads_evaluation__credibility
CREATE INDEX ix_ads_evaluation__credibility ON ads_evaluation (
    _credibility
);


-- Index: ix_ads_evaluation__cultural_compatibility
CREATE INDEX ix_ads_evaluation__cultural_compatibility ON ads_evaluation (
    _cultural_compatibility
);


-- Index: ix_ads_evaluation__current_relation_with_customer
CREATE INDEX ix_ads_evaluation__current_relation_with_customer ON ads_evaluation (
    _current_relation_with_customer
);


-- Index: ix_ads_evaluation__customer_business
CREATE INDEX ix_ads_evaluation__customer_business ON ads_evaluation (
    _customer_business
);


-- Index: ix_ads_evaluation__customer_financials
CREATE INDEX ix_ads_evaluation__customer_financials ON ads_evaluation (
    _customer_financials
);


-- Index: ix_ads_evaluation__decisive_event
CREATE INDEX ix_ads_evaluation__decisive_event ON ads_evaluation (
    _decisive_event
);


-- Index: ix_ads_evaluation__disabled
CREATE INDEX ix_ads_evaluation__disabled ON ads_evaluation (
    _disabled
);


-- Index: ix_ads_evaluation__final_applicability
CREATE INDEX ix_ads_evaluation__final_applicability ON ads_evaluation (
    _final_applicability
);


-- Index: ix_ads_evaluation__formal_decision_making_criteria
CREATE INDEX ix_ads_evaluation__formal_decision_making_criteria ON ads_evaluation (
    _formal_decision_making_criteria
);


-- Index: ix_ads_evaluation__internal_support
CREATE INDEX ix_ads_evaluation__internal_support ON ads_evaluation (
    _internal_support
);


-- Index: ix_ads_evaluation__long_term_revenue
CREATE INDEX ix_ads_evaluation__long_term_revenue ON ads_evaluation (
    _long_term_revenue
);


-- Index: ix_ads_evaluation__political_aspects
CREATE INDEX ix_ads_evaluation__political_aspects ON ads_evaluation (
    _political_aspects
);


-- Index: ix_ads_evaluation__profitability
CREATE INDEX ix_ads_evaluation__profitability ON ads_evaluation (
    _profitability
);


-- Index: ix_ads_evaluation__resources_required_to_sell
CREATE INDEX ix_ads_evaluation__resources_required_to_sell ON ads_evaluation (
    _resources_required_to_sell
);


-- Index: ix_ads_evaluation__risk
CREATE INDEX ix_ads_evaluation__risk ON ads_evaluation (
    _risk
);


-- Index: ix_ads_evaluation__short_term_revenue
CREATE INDEX ix_ads_evaluation__short_term_revenue ON ads_evaluation (
    _short_term_revenue
);


-- Index: ix_ads_evaluation__solution_matching
CREATE INDEX ix_ads_evaluation__solution_matching ON ads_evaluation (
    _solution_matching
);


-- Index: ix_ads_evaluation__strategical_value
CREATE INDEX ix_ads_evaluation__strategical_value ON ads_evaluation (
    _strategical_value
);


-- Index: ix_ads_evaluation__updated_by
CREATE INDEX ix_ads_evaluation__updated_by ON ads_evaluation (
    _updated_by
);


-- Index: ix_ads_evaluation__value_of_business_proposal
CREATE INDEX ix_ads_evaluation__value_of_business_proposal ON ads_evaluation (
    _value_of_business_proposal
);


-- Index: ix_ads_evaluation_sales_project_fk
CREATE UNIQUE INDEX ix_ads_evaluation_sales_project_fk ON ads_evaluation (
    sales_project_fk
);


-- Index: ix_ads_general_data__disabled
CREATE INDEX ix_ads_general_data__disabled ON ads_general_data (
    _disabled
);


-- Index: ix_ads_general_data__updated_by
CREATE INDEX ix_ads_general_data__updated_by ON ads_general_data (
    _updated_by
);


-- Index: ix_ads_general_data_sales_project_fk
CREATE UNIQUE INDEX ix_ads_general_data_sales_project_fk ON ads_general_data (
    sales_project_fk
);


-- Index: ix_ads_org_map__disabled
CREATE INDEX ix_ads_org_map__disabled ON ads_org_map (
    _disabled
);


-- Index: ix_ads_org_map__updated_by
CREATE INDEX ix_ads_org_map__updated_by ON ads_org_map (
    _updated_by
);


-- Index: ix_ads_org_map_details__disabled
CREATE INDEX ix_ads_org_map_details__disabled ON ads_org_map_details (
    _disabled
);


-- Index: ix_ads_org_map_details__updated_by
CREATE INDEX ix_ads_org_map_details__updated_by ON ads_org_map_details (
    _updated_by
);


-- Index: ix_ads_org_map_details_ads_org_map_fk
CREATE INDEX ix_ads_org_map_details_ads_org_map_fk ON ads_org_map_details (
    ads_org_map_fk
);


-- Index: ix_ads_org_map_details_code
CREATE INDEX ix_ads_org_map_details_code ON ads_org_map_details (
    code
);


-- Index: ix_ads_org_map_details_consultant
CREATE INDEX ix_ads_org_map_details_consultant ON ads_org_map_details (
    consultant
);


-- Index: ix_ads_org_map_details_decision_make
CREATE INDEX ix_ads_org_map_details_decision_make ON ads_org_map_details (
    decision_make
);


-- Index: ix_ads_org_map_details_financial_evaluation
CREATE INDEX ix_ads_org_map_details_financial_evaluation ON ads_org_map_details (
    financial_evaluation
);


-- Index: ix_ads_org_map_details_name
CREATE INDEX ix_ads_org_map_details_name ON ads_org_map_details (
    name
);


-- Index: ix_ads_org_map_details_need_to_sign
CREATE INDEX ix_ads_org_map_details_need_to_sign ON ads_org_map_details (
    need_to_sign
);


-- Index: ix_ads_org_map_details_technical_evaluation
CREATE INDEX ix_ads_org_map_details_technical_evaluation ON ads_org_map_details (
    technical_evaluation
);


-- Index: ix_ads_org_map_sales_project_fk
CREATE UNIQUE INDEX ix_ads_org_map_sales_project_fk ON ads_org_map (
    sales_project_fk
);


-- Index: ix_ads_relationships__disabled
CREATE INDEX ix_ads_relationships__disabled ON ads_relationships (
    _disabled
);


-- Index: ix_ads_relationships__updated_by
CREATE INDEX ix_ads_relationships__updated_by ON ads_relationships (
    _updated_by
);


-- Index: ix_ads_relationships_details__disabled
CREATE INDEX ix_ads_relationships_details__disabled ON ads_relationships_details (
    _disabled
);


-- Index: ix_ads_relationships_details__updated_by
CREATE INDEX ix_ads_relationships_details__updated_by ON ads_relationships_details (
    _updated_by
);


-- Index: ix_ads_relationships_details_ads_relationships_fk
CREATE INDEX ix_ads_relationships_details_ads_relationships_fk ON ads_relationships_details (
    ads_relationships_fk
);


-- Index: ix_ads_relationships_details_change_adaptability
CREATE INDEX ix_ads_relationships_details_change_adaptability ON ads_relationships_details (
    change_adaptability
);


-- Index: ix_ads_relationships_details_contact_status
CREATE INDEX ix_ads_relationships_details_contact_status ON ads_relationships_details (
    contact_status
);


-- Index: ix_ads_relationships_details_name
CREATE INDEX ix_ads_relationships_details_name ON ads_relationships_details (
    name
);


-- Index: ix_ads_relationships_details_our_status_in_relation
CREATE INDEX ix_ads_relationships_details_our_status_in_relation ON ads_relationships_details (
    our_status_in_relation
);


-- Index: ix_ads_relationships_details_position
CREATE INDEX ix_ads_relationships_details_position ON ads_relationships_details (
    position
);


-- Index: ix_ads_relationships_sales_project_fk
CREATE UNIQUE INDEX ix_ads_relationships_sales_project_fk ON ads_relationships (
    sales_project_fk
);


-- Index: ix_ads_revenue__disabled
CREATE INDEX ix_ads_revenue__disabled ON ads_revenue (
    _disabled
);


-- Index: ix_ads_revenue__updated_by
CREATE INDEX ix_ads_revenue__updated_by ON ads_revenue (
    _updated_by
);


-- Index: ix_ads_revenue_sales_project_fk
CREATE UNIQUE INDEX ix_ads_revenue_sales_project_fk ON ads_revenue (
    sales_project_fk
);


-- Index: ix_ads_solution__disabled
CREATE INDEX ix_ads_solution__disabled ON ads_solution (
    _disabled
);


-- Index: ix_ads_solution__updated_by
CREATE INDEX ix_ads_solution__updated_by ON ads_solution (
    _updated_by
);


-- Index: ix_ads_solution_details__disabled
CREATE INDEX ix_ads_solution_details__disabled ON ads_solution_details (
    _disabled
);


-- Index: ix_ads_solution_details__updated_by
CREATE INDEX ix_ads_solution_details__updated_by ON ads_solution_details (
    _updated_by
);


-- Index: ix_ads_solution_details_ads_solution_fk
CREATE INDEX ix_ads_solution_details_ads_solution_fk ON ads_solution_details (
    ads_solution_fk
);


-- Index: ix_ads_solution_details_feature_type
CREATE INDEX ix_ads_solution_details_feature_type ON ads_solution_details (
    feature_type
);


-- Index: ix_ads_solution_details_name
CREATE INDEX ix_ads_solution_details_name ON ads_solution_details (
    name
);


-- Index: ix_ads_solution_details_strength
CREATE INDEX ix_ads_solution_details_strength ON ads_solution_details (
    strength
);


-- Index: ix_ads_solution_name
CREATE INDEX ix_ads_solution_name ON ads_solution (
    name
);


-- Index: ix_ads_solution_sales_project_fk
CREATE UNIQUE INDEX ix_ads_solution_sales_project_fk ON ads_solution (
    sales_project_fk
);


-- Index: ix_company__disabled
CREATE INDEX ix_company__disabled ON company (
    _disabled
);


-- Index: ix_company__updated_by
CREATE INDEX ix_company__updated_by ON company (
    _updated_by
);


-- Index: ix_salesproject__disabled
CREATE INDEX ix_salesproject__disabled ON salesproject (
    _disabled
);


-- Index: ix_salesproject__updated_by
CREATE INDEX ix_salesproject__updated_by ON salesproject (
    _updated_by
);


-- Index: ix_salesproject_code
CREATE UNIQUE INDEX ix_salesproject_code ON salesproject (
    code
);


-- Index: ix_solution__disabled
CREATE INDEX ix_solution__disabled ON solution (
    _disabled
);


-- Index: ix_solution__updated_by
CREATE INDEX ix_solution__updated_by ON solution (
    _updated_by
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
