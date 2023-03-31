--
-- File generated with SQLiteStudio v3.3.3 on Fri Mar 31 05:22:04 2023
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: ads_decision_criteria
CREATE TABLE ads_decision_criteria (
    _pk                      VARCHAR (36)  NOT NULL,
    remarks                  VARCHAR (100) NOT NULL,
    _updated_by              VARCHAR (100) NOT NULL,
    _updated_at              DATETIME      NOT NULL,
    _disabled                BOOLEAN       NOT NULL,
    sales_project_fk         VARCHAR (36)  NOT NULL,
    _useless_to_keep_history BOOLEAN,
    CONSTRAINT pk_ads_decision_criteria PRIMARY KEY (
        _pk
    ),
    CONSTRAINT fk_ads_decision_criteria_sales_project_fk_salesproject FOREIGN KEY (
        sales_project_fk
    )
    REFERENCES salesproject (_pk) ON DELETE CASCADE
                                  ON UPDATE CASCADE
);

INSERT INTO ads_decision_criteria (
                                      _pk,
                                      remarks,
                                      _updated_by,
                                      _updated_at,
                                      _disabled,
                                      sales_project_fk,
                                      _useless_to_keep_history
                                  )
                                  VALUES (
                                      'PKtest1',
                                      'test@230301 /updated @230308 h06:30',
                                      'anonymus',
                                      '2023-03-08 03:59:16.554886',
                                      0,
                                      '09c8b36a-035d-49b2-acef-3b63783977a2',
                                      NULL
                                  );

INSERT INTO ads_decision_criteria (
                                      _pk,
                                      remarks,
                                      _updated_by,
                                      _updated_at,
                                      _disabled,
                                      sales_project_fk,
                                      _useless_to_keep_history
                                  )
                                  VALUES (
                                      '1348b2b9-e82e-4571-8de0-efc230b9ac42',
                                      'Ce inseamna Our status? Inseamna cumva cum se pozitioneaza solutia noastra fata de criteriul cumparatorului?
Dupa ce introduc un nou criteriu sunt scos din fereastra Decision criteria si dus in General data. Dar eu vreau sa raman aici.',
                                      'anonymus',
                                      '2023-03-11 11:38:00.410335',
                                      0,
                                      '05761692-a971-4f04-8c3a-67ad1d9628c2',
                                      NULL
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
    _useless_to_keep_history BOOLEAN,
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

INSERT INTO ads_decision_criteria_details_1criterialist (
                                                            _pk,
                                                            _updated_by,
                                                            _updated_at,
                                                            _disabled,
                                                            ads_decision_criteria_fk,
                                                            name,
                                                            our_status,
                                                            _useless_to_keep_history
                                                        )
                                                        VALUES (
                                                            'crit_1_PK',
                                                            'anonymus',
                                                            '2023-03-28 01:33:56.516027',
                                                            0,
                                                            'PKtest1',
                                                            'crit_1',
                                                            'Strong',
                                                            NULL
                                                        );

INSERT INTO ads_decision_criteria_details_1criterialist (
                                                            _pk,
                                                            _updated_by,
                                                            _updated_at,
                                                            _disabled,
                                                            ads_decision_criteria_fk,
                                                            name,
                                                            our_status,
                                                            _useless_to_keep_history
                                                        )
                                                        VALUES (
                                                            'crit_2_PK',
                                                            'anonymus',
                                                            '2023-03-09 15:27:27.531937',
                                                            0,
                                                            'PKtest1',
                                                            'crit 2',
                                                            'Weak',
                                                            NULL
                                                        );

INSERT INTO ads_decision_criteria_details_1criterialist (
                                                            _pk,
                                                            _updated_by,
                                                            _updated_at,
                                                            _disabled,
                                                            ads_decision_criteria_fk,
                                                            name,
                                                            our_status,
                                                            _useless_to_keep_history
                                                        )
                                                        VALUES (
                                                            'crit_3_PK',
                                                            'anonymus',
                                                            '2023-03-10 13:25:46.737300',
                                                            0,
                                                            'PKtest1',
                                                            'crit_3',
                                                            'Weak',
                                                            NULL
                                                        );

INSERT INTO ads_decision_criteria_details_1criterialist (
                                                            _pk,
                                                            _updated_by,
                                                            _updated_at,
                                                            _disabled,
                                                            ads_decision_criteria_fk,
                                                            name,
                                                            our_status,
                                                            _useless_to_keep_history
                                                        )
                                                        VALUES (
                                                            'crit_4_PK',
                                                            'anonymus',
                                                            '2023-03-10 04:59:29.621077',
                                                            0,
                                                            'PKtest1',
                                                            'crit_4',
                                                            'Weak',
                                                            NULL
                                                        );

INSERT INTO ads_decision_criteria_details_1criterialist (
                                                            _pk,
                                                            _updated_by,
                                                            _updated_at,
                                                            _disabled,
                                                            ads_decision_criteria_fk,
                                                            name,
                                                            our_status,
                                                            _useless_to_keep_history
                                                        )
                                                        VALUES (
                                                            'f1a993e1-f475-4d62-84d7-67b7dd3bf08c',
                                                            'anonymus',
                                                            '2023-03-11 11:42:04.765643',
                                                            0,
                                                            '1348b2b9-e82e-4571-8de0-efc230b9ac42',
                                                            'Raportarile cerute de legislatie',
                                                            'Strong',
                                                            NULL
                                                        );

INSERT INTO ads_decision_criteria_details_1criterialist (
                                                            _pk,
                                                            _updated_by,
                                                            _updated_at,
                                                            _disabled,
                                                            ads_decision_criteria_fk,
                                                            name,
                                                            our_status,
                                                            _useless_to_keep_history
                                                        )
                                                        VALUES (
                                                            '06890673-565d-4eae-9ffd-a396dc657fb2',
                                                            'anonymus',
                                                            '2023-03-11 11:42:27.456489',
                                                            0,
                                                            '1348b2b9-e82e-4571-8de0-efc230b9ac42',
                                                            'Referintele de la companii cu peste 300 angajati',
                                                            'Strong',
                                                            NULL
                                                        );

INSERT INTO ads_decision_criteria_details_1criterialist (
                                                            _pk,
                                                            _updated_by,
                                                            _updated_at,
                                                            _disabled,
                                                            ads_decision_criteria_fk,
                                                            name,
                                                            our_status,
                                                            _useless_to_keep_history
                                                        )
                                                        VALUES (
                                                            'd86e548d-899e-4485-872d-231d712be41f',
                                                            'anonymus',
                                                            '2023-03-11 11:42:34.492027',
                                                            0,
                                                            '1348b2b9-e82e-4571-8de0-efc230b9ac42',
                                                            'Flexibilitatea calculelor salariale.',
                                                            'Weak',
                                                            NULL
                                                        );


-- Table: ads_decision_criteria_details_1criterialist_version
CREATE TABLE ads_decision_criteria_details_1criterialist_version (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100),
    _updated_at              DATETIME,
    _disabled                BOOLEAN,
    ads_decision_criteria_fk VARCHAR (36),
    name                     VARCHAR (50),
    our_status               VARCHAR (20),
    transaction_id           INTEGER       NOT NULL,
    end_transaction_id       INTEGER,
    operation_type           SMALLINT      NOT NULL,
    _useless_to_keep_history BOOLEAN,
    CONSTRAINT pk_ads_decision_criteria_details_1criterialist_version PRIMARY KEY (
        _pk,
        transaction_id
    )
);

INSERT INTO ads_decision_criteria_details_1criterialist_version (
                                                                    _pk,
                                                                    _updated_by,
                                                                    _updated_at,
                                                                    _disabled,
                                                                    ads_decision_criteria_fk,
                                                                    name,
                                                                    our_status,
                                                                    transaction_id,
                                                                    end_transaction_id,
                                                                    operation_type,
                                                                    _useless_to_keep_history
                                                                )
                                                                VALUES (
                                                                    'crit_1_PK',
                                                                    'anonymus',
                                                                    '2023-03-28 01:32:27.137882',
                                                                    0,
                                                                    'PKtest1',
                                                                    'crit_1',
                                                                    'Strong',
                                                                    6,
                                                                    7,
                                                                    1,
                                                                    NULL
                                                                );

INSERT INTO ads_decision_criteria_details_1criterialist_version (
                                                                    _pk,
                                                                    _updated_by,
                                                                    _updated_at,
                                                                    _disabled,
                                                                    ads_decision_criteria_fk,
                                                                    name,
                                                                    our_status,
                                                                    transaction_id,
                                                                    end_transaction_id,
                                                                    operation_type,
                                                                    _useless_to_keep_history
                                                                )
                                                                VALUES (
                                                                    'crit_1_PK',
                                                                    'anonymus',
                                                                    '2023-03-28 01:33:56.516027',
                                                                    0,
                                                                    'PKtest1',
                                                                    'crit_1',
                                                                    'Strong',
                                                                    7,
                                                                    NULL,
                                                                    1,
                                                                    NULL
                                                                );


-- Table: ads_decision_criteria_details_2maptoperson
CREATE TABLE ads_decision_criteria_details_2maptoperson (
    _pk                                            VARCHAR (36)  NOT NULL,
    _updated_by                                    VARCHAR (100) NOT NULL,
    _updated_at                                    DATETIME      NOT NULL,
    _disabled                                      BOOLEAN       NOT NULL,
    ads_decision_criteria_details_1criterialist_fk VARCHAR (36)  NOT NULL,
    ads_relationships_details_fk                   VARCHAR (36)  NOT NULL,
    client_importance                              VARCHAR (20)  NOT NULL,
    _useless_to_keep_history                       BOOLEAN,
    CONSTRAINT pk_ads_decision_criteria_details_2maptoperson PRIMARY KEY (
        _pk
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
                                               ON UPDATE CASCADE,
    CONSTRAINT uix_person_per_criteria UNIQUE (
        ads_decision_criteria_details_1criterialist_fk,
        ads_relationships_details_fk
    )
);

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           'mypk1',
                                                           'anonymus',
                                                           '2023-03-09 15:27:27.532924',
                                                           0,
                                                           'crit_2_PK',
                                                           'PK_persoana_1',
                                                           'Top',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           'mypk2',
                                                           'anonymus',
                                                           '2023-03-09 15:27:27.532964',
                                                           0,
                                                           'crit_2_PK',
                                                           'PK_persoana_2',
                                                           'Low',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           'mypk3',
                                                           'anonymus',
                                                           '2023-03-28 01:33:56.531998',
                                                           0,
                                                           'crit_1_PK',
                                                           'PK_persoana_3',
                                                           'Medium',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           'mypk4',
                                                           'anonymus',
                                                           '2023-03-28 01:33:56.532010',
                                                           0,
                                                           'crit_1_PK',
                                                           'PK_persoana_2',
                                                           'Top',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           'mypk5',
                                                           'anonymus',
                                                           '2023-03-09 15:27:27.532987',
                                                           0,
                                                           'crit_2_PK',
                                                           'PK_persoana_3',
                                                           'Medium',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           'mypk6',
                                                           'anonymus',
                                                           '2023-03-28 01:33:56.532016',
                                                           0,
                                                           'crit_1_PK',
                                                           'PK_persoana_1',
                                                           'Neutral',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           'mypk7',
                                                           'anonymus',
                                                           '2023-03-28 01:33:56.532020',
                                                           0,
                                                           'crit_1_PK',
                                                           'PK_persoana_4',
                                                           'Medium',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           'mypk8',
                                                           'anonymus',
                                                           '2023-03-09 15:27:27.550835',
                                                           0,
                                                           'crit_2_PK',
                                                           'PK_persoana_4',
                                                           'UNKNOWN',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           '057129e9-8084-483a-8215-111dd03c2d0f',
                                                           'anonymus',
                                                           '2023-03-10 13:25:46.738020',
                                                           0,
                                                           'crit_3_PK',
                                                           'PK_persoana_1',
                                                           'UNKNOWN',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           '0a3624b6-9952-4ea2-aa02-016cf74c51cf',
                                                           'anonymus',
                                                           '2023-03-10 13:25:46.754585',
                                                           0,
                                                           'crit_3_PK',
                                                           'PK_persoana_2',
                                                           'UNKNOWN',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           '6dc8531a-11fa-43ea-a1a7-236e657e4588',
                                                           'anonymus',
                                                           '2023-03-10 13:25:46.754721',
                                                           0,
                                                           'crit_3_PK',
                                                           'PK_persoana_3',
                                                           'UNKNOWN',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           'e32f7eb9-4350-4ffb-8a86-c01542755873',
                                                           'anonymus',
                                                           '2023-03-10 13:25:46.754807',
                                                           0,
                                                           'crit_3_PK',
                                                           'PK_persoana_4',
                                                           'UNKNOWN',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           'e4b2822e-bcc3-46eb-852e-16a5dd48c232',
                                                           'anonymus',
                                                           '2023-03-11 11:42:27.456732',
                                                           0,
                                                           '06890673-565d-4eae-9ffd-a396dc657fb2',
                                                           'b415814e-a0be-4c36-8ed7-75ae7196ff16',
                                                           'Top',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           'd59b2090-be79-4e64-bba9-b5a3bd58812a',
                                                           'anonymus',
                                                           '2023-03-11 11:42:27.456721',
                                                           0,
                                                           '06890673-565d-4eae-9ffd-a396dc657fb2',
                                                           '0b3ad677-67c4-468f-a6da-abf5f44675b6',
                                                           'Top',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           '77bb61b7-423d-4e31-92fd-abba934ffb37',
                                                           'anonymus',
                                                           '2023-03-11 11:42:04.765878',
                                                           0,
                                                           'f1a993e1-f475-4d62-84d7-67b7dd3bf08c',
                                                           'b415814e-a0be-4c36-8ed7-75ae7196ff16',
                                                           'Medium',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           'bb8f2733-1866-437e-b6a1-0fb948001c2b',
                                                           'anonymus',
                                                           '2023-03-11 11:42:04.765893',
                                                           0,
                                                           'f1a993e1-f475-4d62-84d7-67b7dd3bf08c',
                                                           '0b3ad677-67c4-468f-a6da-abf5f44675b6',
                                                           'Top',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           '43c75459-0f78-49d3-8288-e6e96dcf579f',
                                                           'anonymus',
                                                           '2023-03-11 11:42:34.492301',
                                                           0,
                                                           'd86e548d-899e-4485-872d-231d712be41f',
                                                           'b415814e-a0be-4c36-8ed7-75ae7196ff16',
                                                           'Low',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           '41630d5d-f313-4a1b-97a7-0cb5f67fb658',
                                                           'anonymus',
                                                           '2023-03-11 11:42:34.492289',
                                                           0,
                                                           'd86e548d-899e-4485-872d-231d712be41f',
                                                           '0b3ad677-67c4-468f-a6da-abf5f44675b6',
                                                           'UNKNOWN',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           'e114ffcd-3ba6-41f5-a6d1-338bf984cba1',
                                                           'anonymus',
                                                           '2023-03-11 11:42:04.766567',
                                                           0,
                                                           'f1a993e1-f475-4d62-84d7-67b7dd3bf08c',
                                                           '137aef2d-6149-4b4a-ac34-dda60aebb884',
                                                           'Top',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           '00fee5ed-1767-40ab-afef-3a2d6d9488e2',
                                                           'anonymus',
                                                           '2023-03-11 11:42:27.457045',
                                                           0,
                                                           '06890673-565d-4eae-9ffd-a396dc657fb2',
                                                           '137aef2d-6149-4b4a-ac34-dda60aebb884',
                                                           'Medium',
                                                           NULL
                                                       );

INSERT INTO ads_decision_criteria_details_2maptoperson (
                                                           _pk,
                                                           _updated_by,
                                                           _updated_at,
                                                           _disabled,
                                                           ads_decision_criteria_details_1criterialist_fk,
                                                           ads_relationships_details_fk,
                                                           client_importance,
                                                           _useless_to_keep_history
                                                       )
                                                       VALUES (
                                                           '0e245c50-cbca-4c54-af46-9dbeb76b31f4',
                                                           'anonymus',
                                                           '2023-03-11 11:42:34.492603',
                                                           0,
                                                           'd86e548d-899e-4485-872d-231d712be41f',
                                                           '137aef2d-6149-4b4a-ac34-dda60aebb884',
                                                           'Top',
                                                           NULL
                                                       );


-- Table: ads_decision_criteria_details_2maptoperson_version
CREATE TABLE ads_decision_criteria_details_2maptoperson_version (
    _pk                                            VARCHAR (36)  NOT NULL,
    _updated_by                                    VARCHAR (100),
    _updated_at                                    DATETIME,
    _disabled                                      BOOLEAN,
    ads_decision_criteria_details_1criterialist_fk VARCHAR (36),
    ads_relationships_details_fk                   VARCHAR (36),
    client_importance                              VARCHAR (20),
    transaction_id                                 INTEGER       NOT NULL,
    end_transaction_id                             INTEGER,
    operation_type                                 SMALLINT      NOT NULL,
    _useless_to_keep_history                       BOOLEAN,
    CONSTRAINT pk_ads_decision_criteria_details_2maptoperson_version PRIMARY KEY (
        _pk,
        transaction_id
    )
);

INSERT INTO ads_decision_criteria_details_2maptoperson_version (
                                                                   _pk,
                                                                   _updated_by,
                                                                   _updated_at,
                                                                   _disabled,
                                                                   ads_decision_criteria_details_1criterialist_fk,
                                                                   ads_relationships_details_fk,
                                                                   client_importance,
                                                                   transaction_id,
                                                                   end_transaction_id,
                                                                   operation_type,
                                                                   _useless_to_keep_history
                                                               )
                                                               VALUES (
                                                                   'mypk3',
                                                                   'anonymus',
                                                                   '2023-03-28 01:32:27.176691',
                                                                   0,
                                                                   'crit_1_PK',
                                                                   'PK_persoana_3',
                                                                   'Neutral',
                                                                   6,
                                                                   7,
                                                                   1,
                                                                   NULL
                                                               );

INSERT INTO ads_decision_criteria_details_2maptoperson_version (
                                                                   _pk,
                                                                   _updated_by,
                                                                   _updated_at,
                                                                   _disabled,
                                                                   ads_decision_criteria_details_1criterialist_fk,
                                                                   ads_relationships_details_fk,
                                                                   client_importance,
                                                                   transaction_id,
                                                                   end_transaction_id,
                                                                   operation_type,
                                                                   _useless_to_keep_history
                                                               )
                                                               VALUES (
                                                                   'mypk4',
                                                                   'anonymus',
                                                                   '2023-03-28 01:32:27.176726',
                                                                   0,
                                                                   'crit_1_PK',
                                                                   'PK_persoana_2',
                                                                   'Top',
                                                                   6,
                                                                   7,
                                                                   1,
                                                                   NULL
                                                               );

INSERT INTO ads_decision_criteria_details_2maptoperson_version (
                                                                   _pk,
                                                                   _updated_by,
                                                                   _updated_at,
                                                                   _disabled,
                                                                   ads_decision_criteria_details_1criterialist_fk,
                                                                   ads_relationships_details_fk,
                                                                   client_importance,
                                                                   transaction_id,
                                                                   end_transaction_id,
                                                                   operation_type,
                                                                   _useless_to_keep_history
                                                               )
                                                               VALUES (
                                                                   'mypk6',
                                                                   'anonymus',
                                                                   '2023-03-28 01:32:27.176740',
                                                                   0,
                                                                   'crit_1_PK',
                                                                   'PK_persoana_1',
                                                                   'Neutral',
                                                                   6,
                                                                   7,
                                                                   1,
                                                                   NULL
                                                               );

INSERT INTO ads_decision_criteria_details_2maptoperson_version (
                                                                   _pk,
                                                                   _updated_by,
                                                                   _updated_at,
                                                                   _disabled,
                                                                   ads_decision_criteria_details_1criterialist_fk,
                                                                   ads_relationships_details_fk,
                                                                   client_importance,
                                                                   transaction_id,
                                                                   end_transaction_id,
                                                                   operation_type,
                                                                   _useless_to_keep_history
                                                               )
                                                               VALUES (
                                                                   'mypk7',
                                                                   'anonymus',
                                                                   '2023-03-28 01:32:27.176751',
                                                                   0,
                                                                   'crit_1_PK',
                                                                   'PK_persoana_4',
                                                                   'Medium',
                                                                   6,
                                                                   7,
                                                                   1,
                                                                   NULL
                                                               );

INSERT INTO ads_decision_criteria_details_2maptoperson_version (
                                                                   _pk,
                                                                   _updated_by,
                                                                   _updated_at,
                                                                   _disabled,
                                                                   ads_decision_criteria_details_1criterialist_fk,
                                                                   ads_relationships_details_fk,
                                                                   client_importance,
                                                                   transaction_id,
                                                                   end_transaction_id,
                                                                   operation_type,
                                                                   _useless_to_keep_history
                                                               )
                                                               VALUES (
                                                                   'mypk3',
                                                                   'anonymus',
                                                                   '2023-03-28 01:33:56.531998',
                                                                   0,
                                                                   'crit_1_PK',
                                                                   'PK_persoana_3',
                                                                   'Medium',
                                                                   7,
                                                                   NULL,
                                                                   1,
                                                                   NULL
                                                               );

INSERT INTO ads_decision_criteria_details_2maptoperson_version (
                                                                   _pk,
                                                                   _updated_by,
                                                                   _updated_at,
                                                                   _disabled,
                                                                   ads_decision_criteria_details_1criterialist_fk,
                                                                   ads_relationships_details_fk,
                                                                   client_importance,
                                                                   transaction_id,
                                                                   end_transaction_id,
                                                                   operation_type,
                                                                   _useless_to_keep_history
                                                               )
                                                               VALUES (
                                                                   'mypk4',
                                                                   'anonymus',
                                                                   '2023-03-28 01:33:56.532010',
                                                                   0,
                                                                   'crit_1_PK',
                                                                   'PK_persoana_2',
                                                                   'Top',
                                                                   7,
                                                                   NULL,
                                                                   1,
                                                                   NULL
                                                               );

INSERT INTO ads_decision_criteria_details_2maptoperson_version (
                                                                   _pk,
                                                                   _updated_by,
                                                                   _updated_at,
                                                                   _disabled,
                                                                   ads_decision_criteria_details_1criterialist_fk,
                                                                   ads_relationships_details_fk,
                                                                   client_importance,
                                                                   transaction_id,
                                                                   end_transaction_id,
                                                                   operation_type,
                                                                   _useless_to_keep_history
                                                               )
                                                               VALUES (
                                                                   'mypk6',
                                                                   'anonymus',
                                                                   '2023-03-28 01:33:56.532016',
                                                                   0,
                                                                   'crit_1_PK',
                                                                   'PK_persoana_1',
                                                                   'Neutral',
                                                                   7,
                                                                   NULL,
                                                                   1,
                                                                   NULL
                                                               );

INSERT INTO ads_decision_criteria_details_2maptoperson_version (
                                                                   _pk,
                                                                   _updated_by,
                                                                   _updated_at,
                                                                   _disabled,
                                                                   ads_decision_criteria_details_1criterialist_fk,
                                                                   ads_relationships_details_fk,
                                                                   client_importance,
                                                                   transaction_id,
                                                                   end_transaction_id,
                                                                   operation_type,
                                                                   _useless_to_keep_history
                                                               )
                                                               VALUES (
                                                                   'mypk7',
                                                                   'anonymus',
                                                                   '2023-03-28 01:33:56.532020',
                                                                   0,
                                                                   'crit_1_PK',
                                                                   'PK_persoana_4',
                                                                   'Medium',
                                                                   7,
                                                                   NULL,
                                                                   1,
                                                                   NULL
                                                               );


-- Table: ads_decision_criteria_version
CREATE TABLE ads_decision_criteria_version (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100),
    _updated_at              DATETIME,
    _disabled                BOOLEAN,
    sales_project_fk         VARCHAR (36),
    remarks                  VARCHAR (100),
    transaction_id           INTEGER       NOT NULL,
    end_transaction_id       INTEGER,
    operation_type           SMALLINT      NOT NULL,
    _useless_to_keep_history BOOLEAN,
    CONSTRAINT pk_ads_decision_criteria_version PRIMARY KEY (
        _pk,
        transaction_id
    )
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
    _useless_to_keep_history           BOOLEAN,
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
                               _strategical_value,
                               _useless_to_keep_history
                           )
                           VALUES (
                               '7abd1fad-59ea-4453-b838-0d12c45288e7',
                               'anonymus',
                               '2023-03-28 01:30:24.849199',
                               0,
                               '09c8b36a-035d-49b2-acef-3b63783977a2',
                               'introdus de Petre ca elemnte mediane (valori de mijloc !)',
                               'A_001_003',
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
                               'D_020_002',
                               NULL
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
                               _strategical_value,
                               _useless_to_keep_history
                           )
                           VALUES (
                               'e745118b-5fc9-4c32-bba2-f2cbdafe3c17',
                               'anonymus',
                               '2023-03-11 11:18:43.618119',
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
                               'D_019_002',
                               'D_018_003',
                               'D_020_001',
                               NULL
                           );


-- Table: ads_evaluation_version
CREATE TABLE ads_evaluation_version (
    _pk                                VARCHAR (36)  NOT NULL,
    _updated_by                        VARCHAR (100),
    _updated_at                        DATETIME,
    _disabled                          BOOLEAN,
    sales_project_fk                   VARCHAR (36),
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
    transaction_id                     INTEGER       NOT NULL,
    end_transaction_id                 INTEGER,
    operation_type                     SMALLINT      NOT NULL,
    _useless_to_keep_history           BOOLEAN,
    CONSTRAINT pk_ads_evaluation_version PRIMARY KEY (
        _pk,
        transaction_id
    )
);

INSERT INTO ads_evaluation_version (
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
                                       _strategical_value,
                                       transaction_id,
                                       end_transaction_id,
                                       operation_type,
                                       _useless_to_keep_history
                                   )
                                   VALUES (
                                       '7abd1fad-59ea-4453-b838-0d12c45288e7',
                                       'anonymus',
                                       '2023-03-28 01:29:45.154754',
                                       0,
                                       '09c8b36a-035d-49b2-acef-3b63783977a2',
                                       'introdus de Petre ca elemnte mediane (valori de mijloc !)',
                                       'A_001_001',
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
                                       'D_020_002',
                                       4,
                                       5,
                                       1,
                                       NULL
                                   );

INSERT INTO ads_evaluation_version (
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
                                       _strategical_value,
                                       transaction_id,
                                       end_transaction_id,
                                       operation_type,
                                       _useless_to_keep_history
                                   )
                                   VALUES (
                                       '7abd1fad-59ea-4453-b838-0d12c45288e7',
                                       'anonymus',
                                       '2023-03-28 01:30:24.849199',
                                       0,
                                       '09c8b36a-035d-49b2-acef-3b63783977a2',
                                       'introdus de Petre ca elemnte mediane (valori de mijloc !)',
                                       'A_001_003',
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
                                       'D_020_002',
                                       5,
                                       NULL,
                                       1,
                                       NULL
                                   );


-- Table: ads_general_data
CREATE TABLE ads_general_data (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100) NOT NULL,
    _updated_at              DATETIME      NOT NULL,
    _disabled                BOOLEAN       NOT NULL,
    sales_project_fk         VARCHAR (36)  NOT NULL,
    decisive_event           VARCHAR (100),
    competition              VARCHAR (100),
    potential_problems       VARCHAR (100),
    team_members             VARCHAR (100),
    client_company           VARCHAR (100),
    _useless_to_keep_history BOOLEAN,
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
                                 client_company,
                                 _useless_to_keep_history
                             )
                             VALUES (
                                 '58c6a74e-c2e3-48eb-ae2a-e960493f2248',
                                 'anonymus',
                                 '2023-03-28 01:29:01.264087',
                                 0,
                                 '09c8b36a-035d-49b2-acef-3b63783977a2',
                                 'de @ 230328 @ 04:40',
                                 'co @ 230328 @ 04:40',
                                 'pp @ 230328 @ 04:40',
                                 'tm @ 230328 @ 04:40',
                                 'cc @ 230328 @ 04:40',
                                 NULL
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
                                 client_company,
                                 _useless_to_keep_history
                             )
                             VALUES (
                                 '9bd66f88-56ff-43a1-b673-ca4a303d7c13',
                                 'anonymus',
                                 '2023-03-02 15:39:10.099936',
                                 0,
                                 '05761692-a971-4f04-8c3a-67ad1d9628c2',
                                 'Cresterea fortei de vanzare a companiei in 2003',
                                 'Competitie 1 - companie germana bine pozitionata pe piata noastra.
Competitie 2 - companie americana / new entry',
                                 'Management indecis.
IT reticent.',
                                 'Liviu, Anca, Horia, Vasile.',
                                 'Principalii clienti sunt din domeniul UTILITATILOR.',
                                 NULL
                             );


-- Table: ads_general_data_version
CREATE TABLE ads_general_data_version (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100),
    _updated_at              DATETIME,
    _disabled                BOOLEAN,
    sales_project_fk         VARCHAR (36),
    decisive_event           VARCHAR (100),
    competition              VARCHAR (100),
    potential_problems       VARCHAR (100),
    team_members             VARCHAR (100),
    client_company           VARCHAR (100),
    transaction_id           INTEGER       NOT NULL,
    end_transaction_id       INTEGER,
    operation_type           SMALLINT      NOT NULL,
    _useless_to_keep_history BOOLEAN,
    CONSTRAINT pk_ads_general_data_version PRIMARY KEY (
        _pk,
        transaction_id
    )
);

INSERT INTO ads_general_data_version (
                                         _pk,
                                         _updated_by,
                                         _updated_at,
                                         _disabled,
                                         sales_project_fk,
                                         decisive_event,
                                         competition,
                                         potential_problems,
                                         team_members,
                                         client_company,
                                         transaction_id,
                                         end_transaction_id,
                                         operation_type,
                                         _useless_to_keep_history
                                     )
                                     VALUES (
                                         '58c6a74e-c2e3-48eb-ae2a-e960493f2248',
                                         'anonymus',
                                         '2023-03-28 01:26:02.897654',
                                         0,
                                         '09c8b36a-035d-49b2-acef-3b63783977a2',
                                         'de @ 230328 @ 04:30',
                                         'co @ 230328 @ 04:30',
                                         'pp @ 230328 @ 04:30',
                                         'tm @ 230328 @ 04:30',
                                         'cc @ 230328 @ 04:30',
                                         1,
                                         2,
                                         1,
                                         NULL
                                     );

INSERT INTO ads_general_data_version (
                                         _pk,
                                         _updated_by,
                                         _updated_at,
                                         _disabled,
                                         sales_project_fk,
                                         decisive_event,
                                         competition,
                                         potential_problems,
                                         team_members,
                                         client_company,
                                         transaction_id,
                                         end_transaction_id,
                                         operation_type,
                                         _useless_to_keep_history
                                     )
                                     VALUES (
                                         '58c6a74e-c2e3-48eb-ae2a-e960493f2248',
                                         'anonymus',
                                         '2023-03-28 01:27:10.104471',
                                         0,
                                         '09c8b36a-035d-49b2-acef-3b63783977a2',
                                         'de @ 230328 @ 04:35',
                                         'co @ 230328 @ 04:35',
                                         'pp @ 230328 @ 04:35',
                                         'tm @ 230328 @ 04:35',
                                         'cc @ 230328 @ 04:35',
                                         2,
                                         3,
                                         1,
                                         NULL
                                     );

INSERT INTO ads_general_data_version (
                                         _pk,
                                         _updated_by,
                                         _updated_at,
                                         _disabled,
                                         sales_project_fk,
                                         decisive_event,
                                         competition,
                                         potential_problems,
                                         team_members,
                                         client_company,
                                         transaction_id,
                                         end_transaction_id,
                                         operation_type,
                                         _useless_to_keep_history
                                     )
                                     VALUES (
                                         '58c6a74e-c2e3-48eb-ae2a-e960493f2248',
                                         'anonymus',
                                         '2023-03-28 01:29:01.264087',
                                         0,
                                         '09c8b36a-035d-49b2-acef-3b63783977a2',
                                         'de @ 230328 @ 04:40',
                                         'co @ 230328 @ 04:40',
                                         'pp @ 230328 @ 04:40',
                                         'tm @ 230328 @ 04:40',
                                         'cc @ 230328 @ 04:40',
                                         3,
                                         NULL,
                                         1,
                                         NULL
                                     );


-- Table: ads_org_map
CREATE TABLE ads_org_map (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100) NOT NULL,
    _updated_at              DATETIME      NOT NULL,
    _disabled                BOOLEAN       NOT NULL,
    sales_project_fk         VARCHAR (36)  NOT NULL,
    remarks                  VARCHAR (100) NOT NULL,
    _useless_to_keep_history BOOLEAN,
    CONSTRAINT pk_ads_org_map PRIMARY KEY (
        _pk
    ),
    CONSTRAINT fk_ads_org_map_sales_project_fk_salesproject FOREIGN KEY (
        sales_project_fk
    )
    REFERENCES salesproject (_pk) ON DELETE CASCADE
                                  ON UPDATE CASCADE
);

INSERT INTO ads_org_map (
                            _pk,
                            _updated_by,
                            _updated_at,
                            _disabled,
                            sales_project_fk,
                            remarks,
                            _useless_to_keep_history
                        )
                        VALUES (
                            'a4bed9eb-5035-47d3-9153-6805e6ab43e2',
                            'anonymus',
                            '2023-02-19 15:44:42.227731',
                            0,
                            '09c8b36a-035d-49b2-acef-3b63783977a2',
                            'ceva ce contine cam strictul minim de care "te lovesti" intr-un cont',
                            NULL
                        );

INSERT INTO ads_org_map (
                            _pk,
                            _updated_by,
                            _updated_at,
                            _disabled,
                            sales_project_fk,
                            remarks,
                            _useless_to_keep_history
                        )
                        VALUES (
                            '0b643ddc-3e63-4801-a1e6-34822e97638a',
                            'anonymus',
                            '2023-03-02 15:39:58.379671',
                            0,
                            '05761692-a971-4f04-8c3a-67ad1d9628c2',
                            'Progres in relatia cu seful IT; discutie "aprinsa" timp de 3 ore despre functionalitatile oferite de aplicatie.
De fapt aici se introduc persoanele de la potentialul client?',
                            NULL
                        );


-- Table: ads_org_map_details
CREATE TABLE ads_org_map_details (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100) NOT NULL,
    _updated_at              DATETIME      NOT NULL,
    _disabled                BOOLEAN       NOT NULL,
    ads_org_map_fk           VARCHAR (36)  NOT NULL,
    code                     VARCHAR (10)  NOT NULL,
    name                     VARCHAR (50)  NOT NULL,
    decision_make            BOOLEAN       NOT NULL,
    need_to_sign             BOOLEAN       NOT NULL,
    technical_evaluation     BOOLEAN       NOT NULL,
    financial_evaluation     BOOLEAN       NOT NULL,
    consultant               BOOLEAN       NOT NULL,
    _useless_to_keep_history BOOLEAN,
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
                                    consultant,
                                    _useless_to_keep_history
                                )
                                VALUES (
                                    'ad484237-7357-4371-bea2-560188b9e0c3',
                                    'anonymus',
                                    '2023-02-19 15:45:10.259668',
                                    0,
                                    'a4bed9eb-5035-47d3-9153-6805e6ab43e2',
                                    'GM',
                                    'pozitie_1',
                                    1,
                                    1,
                                    0,
                                    0,
                                    0,
                                    NULL
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
                                    consultant,
                                    _useless_to_keep_history
                                )
                                VALUES (
                                    '4c4b9cfb-61db-4a95-807b-7df711fa1883',
                                    'anonymus',
                                    '2023-02-19 15:45:31.059267',
                                    0,
                                    'a4bed9eb-5035-47d3-9153-6805e6ab43e2',
                                    'FM',
                                    'pozitie_2',
                                    0,
                                    1,
                                    0,
                                    1,
                                    0,
                                    NULL
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
                                    consultant,
                                    _useless_to_keep_history
                                )
                                VALUES (
                                    'af785866-2434-483d-a2a1-d8ea02d3608e',
                                    'anonymus',
                                    '2023-02-21 01:57:54.307553',
                                    0,
                                    'a4bed9eb-5035-47d3-9153-6805e6ab43e2',
                                    'IT',
                                    'pozitie_3',
                                    0,
                                    0,
                                    1,
                                    0,
                                    1,
                                    NULL
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
                                    consultant,
                                    _useless_to_keep_history
                                )
                                VALUES (
                                    '3a0fade9-f88a-41bc-98d3-a496bb047203',
                                    'anonymus',
                                    '2023-02-19 15:46:37.385424',
                                    0,
                                    'a4bed9eb-5035-47d3-9153-6805e6ab43e2',
                                    'ADM',
                                    'pozitie_4',
                                    1,
                                    0,
                                    0,
                                    1,
                                    0,
                                    NULL
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
                                    consultant,
                                    _useless_to_keep_history
                                )
                                VALUES (
                                    '24b885dc-957c-438a-8a48-6adedc25391f',
                                    'anonymus',
                                    '2023-02-21 01:03:39.084847',
                                    0,
                                    'a4bed9eb-5035-47d3-9153-6805e6ab43e2',
                                    'COMISE',
                                    'pozitie_5',
                                    1,
                                    0,
                                    1,
                                    0,
                                    1,
                                    NULL
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
                                    consultant,
                                    _useless_to_keep_history
                                )
                                VALUES (
                                    '5bc6b8e5-5300-4107-a1d2-7773c6fd1d5d',
                                    'anonymus',
                                    '2023-03-02 15:18:10.324173',
                                    0,
                                    '0b643ddc-3e63-4801-a1e6-34822e97638a',
                                    '44',
                                    'Account Manager',
                                    0,
                                    1,
                                    0,
                                    0,
                                    0,
                                    NULL
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
                                    consultant,
                                    _useless_to_keep_history
                                )
                                VALUES (
                                    '1084c18f-f8c5-4f41-8182-a99bdb5120a5',
                                    'anonymus',
                                    '2023-03-02 15:17:30.831871',
                                    0,
                                    '0b643ddc-3e63-4801-a1e6-34822e97638a',
                                    '4',
                                    'Director Comercial',
                                    1,
                                    0,
                                    0,
                                    0,
                                    0,
                                    NULL
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
                                    consultant,
                                    _useless_to_keep_history
                                )
                                VALUES (
                                    '883c4d94-8d8a-44b5-9800-6d2c372caf6f',
                                    'anonymus',
                                    '2023-03-02 15:20:34.394457',
                                    0,
                                    '0b643ddc-3e63-4801-a1e6-34822e97638a',
                                    '444',
                                    'Consultant vanzari',
                                    0,
                                    0,
                                    1,
                                    0,
                                    0,
                                    NULL
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
                                    consultant,
                                    _useless_to_keep_history
                                )
                                VALUES (
                                    'a538fa26-0fd3-49fe-a152-f6358f1366a9',
                                    'anonymus',
                                    '2023-03-02 15:21:54.295713',
                                    0,
                                    '0b643ddc-3e63-4801-a1e6-34822e97638a',
                                    '4444',
                                    'Consultant financiar 1',
                                    0,
                                    0,
                                    0,
                                    1,
                                    0,
                                    NULL
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
                                    consultant,
                                    _useless_to_keep_history
                                )
                                VALUES (
                                    '59416ad7-c2c9-4a1d-953c-eaa21e895e3e',
                                    'anonymus',
                                    '2023-03-02 15:22:58.307249',
                                    0,
                                    '0b643ddc-3e63-4801-a1e6-34822e97638a',
                                    '44444',
                                    'Consultant proiect - Senior',
                                    0,
                                    0,
                                    0,
                                    0,
                                    1,
                                    NULL
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
                                    consultant,
                                    _useless_to_keep_history
                                )
                                VALUES (
                                    'd0227270-41da-495a-ae19-38effb8cfa6b',
                                    'anonymus',
                                    '2023-03-02 15:43:18.740530',
                                    0,
                                    '0b643ddc-3e63-4801-a1e6-34822e97638a',
                                    '445',
                                    'Consultant vanzari 2',
                                    0,
                                    0,
                                    1,
                                    0,
                                    0,
                                    NULL
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
                                    consultant,
                                    _useless_to_keep_history
                                )
                                VALUES (
                                    '364fb5de-b6ea-4bb7-a308-a5b79878d4e5',
                                    'anonymus',
                                    '2023-03-11 11:41:25.167558',
                                    0,
                                    '0b643ddc-3e63-4801-a1e6-34822e97638a',
                                    '3',
                                    'Director HR',
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    NULL
                                );


-- Table: ads_org_map_details_version
CREATE TABLE ads_org_map_details_version (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100),
    _updated_at              DATETIME,
    _disabled                BOOLEAN,
    ads_org_map_fk           VARCHAR (36),
    code                     VARCHAR (10),
    name                     VARCHAR (50),
    decision_make            BOOLEAN,
    need_to_sign             BOOLEAN,
    technical_evaluation     BOOLEAN,
    financial_evaluation     BOOLEAN,
    consultant               BOOLEAN,
    transaction_id           INTEGER       NOT NULL,
    end_transaction_id       INTEGER,
    operation_type           SMALLINT      NOT NULL,
    _useless_to_keep_history BOOLEAN,
    CONSTRAINT pk_ads_org_map_details_version PRIMARY KEY (
        _pk,
        transaction_id
    )
);


-- Table: ads_org_map_version
CREATE TABLE ads_org_map_version (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100),
    _updated_at              DATETIME,
    _disabled                BOOLEAN,
    sales_project_fk         VARCHAR (36),
    remarks                  VARCHAR (100),
    transaction_id           INTEGER       NOT NULL,
    end_transaction_id       INTEGER,
    operation_type           SMALLINT      NOT NULL,
    _useless_to_keep_history BOOLEAN,
    CONSTRAINT pk_ads_org_map_version PRIMARY KEY (
        _pk,
        transaction_id
    )
);


-- Table: ads_relationships
CREATE TABLE ads_relationships (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100) NOT NULL,
    _updated_at              DATETIME      NOT NULL,
    _disabled                BOOLEAN       NOT NULL,
    sales_project_fk         VARCHAR (36)  NOT NULL,
    remarks                  VARCHAR (100) NOT NULL,
    _useless_to_keep_history BOOLEAN,
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
                                  remarks,
                                  _useless_to_keep_history
                              )
                              VALUES (
                                  'relatioship_1_PK',
                                  'anonymus',
                                  '2023-02-25 05:57:09.163165',
                                  0,
                                  '09c8b36a-035d-49b2-acef-3b63783977a2',
                                  'x-remarks /updated @230225 h08:00',
                                  NULL
                              );

INSERT INTO ads_relationships (
                                  _pk,
                                  _updated_by,
                                  _updated_at,
                                  _disabled,
                                  sales_project_fk,
                                  remarks,
                                  _useless_to_keep_history
                              )
                              VALUES (
                                  '352a45a3-926f-47b0-b0e6-cc226488ff1a',
                                  'anonymus',
                                  '2023-03-02 15:34:08.895427',
                                  0,
                                  '05761692-a971-4f04-8c3a-67ad1d9628c2',
                                  'Si de aici se genereaza A NEW ORGANIZATION MAP?',
                                  NULL
                              );


-- Table: ads_relationships_details
CREATE TABLE ads_relationships_details (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100) NOT NULL,
    _updated_at              DATETIME      NOT NULL,
    _disabled                BOOLEAN       NOT NULL,
    ads_relationships_fk     VARCHAR (36)  NOT NULL,
    name                     VARCHAR (50)  NOT NULL,
    position                 VARCHAR (36)  NOT NULL,
    change_adaptability      VARCHAR (20)  NOT NULL,
    our_status_in_relation   VARCHAR (20)  NOT NULL,
    contact_status           VARCHAR (20)  NOT NULL,
    _useless_to_keep_history BOOLEAN,
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
                                          contact_status,
                                          _useless_to_keep_history
                                      )
                                      VALUES (
                                          'PK_persoana_1',
                                          'anonymus',
                                          '2023-02-22 03:49:54.755954',
                                          0,
                                          'relatioship_1_PK',
                                          'persoana_1',
                                          'ad484237-7357-4371-bea2-560188b9e0c3',
                                          'Visionary',
                                          'Supporter',
                                          'Briefly-Contacted',
                                          NULL
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
                                          contact_status,
                                          _useless_to_keep_history
                                      )
                                      VALUES (
                                          'PK_persoana_2',
                                          'petre_2',
                                          '2023-02-21 15:39:30.207873',
                                          0,
                                          'relatioship_1_PK',
                                          'persoana_2',
                                          'af785866-2434-483d-a2a1-d8ea02d3608e',
                                          'Innovator',
                                          'Mentor',
                                          'Multiple-Contacts',
                                          NULL
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
                                          contact_status,
                                          _useless_to_keep_history
                                      )
                                      VALUES (
                                          'PK_persoana_3',
                                          'anonymus',
                                          '2023-02-22 04:02:03.732838',
                                          0,
                                          'relatioship_1_PK',
                                          'persoana_3',
                                          '3a0fade9-f88a-41bc-98d3-a496bb047203',
                                          'Pragmatic',
                                          'Neutral',
                                          'Briefly-Contacted',
                                          NULL
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
                                          contact_status,
                                          _useless_to_keep_history
                                      )
                                      VALUES (
                                          'PK_persoana_4',
                                          'anonymus',
                                          '2023-03-10 16:58:24.770498',
                                          0,
                                          'relatioship_1_PK',
                                          'persoana_4',
                                          '4c4b9cfb-61db-4a95-807b-7df711fa1883',
                                          'Visionary',
                                          'Enemy',
                                          'Multiple-Contacts',
                                          NULL
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
                                          contact_status,
                                          _useless_to_keep_history
                                      )
                                      VALUES (
                                          'b415814e-a0be-4c36-8ed7-75ae7196ff16',
                                          'anonymus',
                                          '2023-03-02 15:35:53.010475',
                                          0,
                                          '352a45a3-926f-47b0-b0e6-cc226488ff1a',
                                          'Vasile IONESCU',
                                          '59416ad7-c2c9-4a1d-953c-eaa21e895e3e',
                                          'Pragmatic',
                                          'Neutral',
                                          'Multiple-Contacts',
                                          NULL
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
                                          contact_status,
                                          _useless_to_keep_history
                                      )
                                      VALUES (
                                          '0b3ad677-67c4-468f-a6da-abf5f44675b6',
                                          'anonymus',
                                          '2023-03-11 11:27:38.734119',
                                          0,
                                          '352a45a3-926f-47b0-b0e6-cc226488ff1a',
                                          'Ion POPESCU',
                                          'a538fa26-0fd3-49fe-a152-f6358f1366a9',
                                          'Conservative',
                                          'Neutral',
                                          'Multiple-Contacts',
                                          NULL
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
                                          contact_status,
                                          _useless_to_keep_history
                                      )
                                      VALUES (
                                          '137aef2d-6149-4b4a-ac34-dda60aebb884',
                                          'anonymus',
                                          '2023-03-11 11:41:42.363960',
                                          0,
                                          '352a45a3-926f-47b0-b0e6-cc226488ff1a',
                                          'Gigi GEORGESCU',
                                          '364fb5de-b6ea-4bb7-a308-a5b79878d4e5',
                                          'Visionary',
                                          'Neutral',
                                          'Briefly-Contacted',
                                          NULL
                                      );


-- Table: ads_relationships_details_version
CREATE TABLE ads_relationships_details_version (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100),
    _updated_at              DATETIME,
    _disabled                BOOLEAN,
    ads_relationships_fk     VARCHAR (36),
    name                     VARCHAR (50),
    position                 VARCHAR (36),
    change_adaptability      VARCHAR (20),
    our_status_in_relation   VARCHAR (20),
    contact_status           VARCHAR (20),
    transaction_id           INTEGER       NOT NULL,
    end_transaction_id       INTEGER,
    operation_type           SMALLINT      NOT NULL,
    _useless_to_keep_history BOOLEAN,
    CONSTRAINT pk_ads_relationships_details_version PRIMARY KEY (
        _pk,
        transaction_id
    )
);


-- Table: ads_relationships_version
CREATE TABLE ads_relationships_version (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100),
    _updated_at              DATETIME,
    _disabled                BOOLEAN,
    sales_project_fk         VARCHAR (36),
    remarks                  VARCHAR (100),
    transaction_id           INTEGER       NOT NULL,
    end_transaction_id       INTEGER,
    operation_type           SMALLINT      NOT NULL,
    _useless_to_keep_history BOOLEAN,
    CONSTRAINT pk_ads_relationships_version PRIMARY KEY (
        _pk,
        transaction_id
    )
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
    _useless_to_keep_history BOOLEAN,
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
                            market_price,
                            _useless_to_keep_history
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
                            25000.0,
                            NULL
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
                            market_price,
                            _useless_to_keep_history
                        )
                        VALUES (
                            'bde68860-0b81-47e4-b36e-0c3d242bb279',
                            'anonymus',
                            '2023-03-11 11:14:41.703917',
                            0,
                            '05761692-a971-4f04-8c3a-67ad1d9628c2',
                            'Ramane de vazut!',
                            1000000.,
                            50000.0,
                            40000.0,
                            30000.0,
                            40000.0,
                            0.0,
                            NULL
                        );


-- Table: ads_revenue_version
CREATE TABLE ads_revenue_version (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100),
    _updated_at              DATETIME,
    _disabled                BOOLEAN,
    sales_project_fk         VARCHAR (36),
    remarks                  VARCHAR (100),
    max_expected             FLOAT,
    min_expected             FLOAT,
    allocated_budget         FLOAT,
    customer_min_expectation FLOAT,
    customer_max_expectation FLOAT,
    market_price             FLOAT,
    transaction_id           INTEGER       NOT NULL,
    end_transaction_id       INTEGER,
    operation_type           SMALLINT      NOT NULL,
    _useless_to_keep_history BOOLEAN,
    CONSTRAINT pk_ads_revenue_version PRIMARY KEY (
        _pk,
        transaction_id
    )
);


-- Table: ads_solution
CREATE TABLE ads_solution (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100) NOT NULL,
    _updated_at              DATETIME      NOT NULL,
    _disabled                BOOLEAN       NOT NULL,
    sales_project_fk         VARCHAR (36)  NOT NULL,
    remarks                  VARCHAR (100) NOT NULL,
    name                     VARCHAR (100) NOT NULL,
    description              VARCHAR (100) NOT NULL,
    _useless_to_keep_history BOOLEAN,
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
                             description,
                             _useless_to_keep_history
                         )
                         VALUES (
                             'testPK',
                             'anonymus',
                             '2023-02-25 06:16:23.588470',
                             0,
                             '09c8b36a-035d-49b2-acef-3b63783977a2',
                             'inregistrare de test api GET /upd 230225 h08:16',
                             'solutie de test intro de Petre /upd 230225 h08:16',
                             'descriere solutie de test /upd 230225 h08:16',
                             NULL
                         );

INSERT INTO ads_solution (
                             _pk,
                             _updated_by,
                             _updated_at,
                             _disabled,
                             sales_project_fk,
                             remarks,
                             name,
                             description,
                             _useless_to_keep_history
                         )
                         VALUES (
                             '5e9778e3-db4b-4e4f-ade5-f33edac3ac5c',
                             'anonymus',
                             '2023-03-11 11:22:44.611129',
                             0,
                             '05761692-a971-4f04-8c3a-67ad1d9628c2',
                             'Versiunea pentru peste 100 -500 angajati',
                             'MRU-CS ',
                             'Sistem Informatic pentru managementul resurselor umane si calculul salariilor. ',
                             NULL
                         );


-- Table: ads_solution_details
CREATE TABLE ads_solution_details (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100) NOT NULL,
    _updated_at              DATETIME      NOT NULL,
    _disabled                BOOLEAN       NOT NULL,
    ads_solution_fk          VARCHAR (36)  NOT NULL,
    name                     VARCHAR (50)  NOT NULL,
    strength                 VARCHAR (20)  NOT NULL,
    feature_type             VARCHAR (20)  NOT NULL,
    _useless_to_keep_history BOOLEAN,
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
                                     feature_type,
                                     _useless_to_keep_history
                                 )
                                 VALUES (
                                     '89271aaa-e168-4902-9fe4-589ffeaea02e',
                                     'anonymus',
                                     '2023-02-25 13:57:00.968735',
                                     0,
                                     'testPK',
                                     'element 2',
                                     'Strong',
                                     'Characteristic',
                                     NULL
                                 );

INSERT INTO ads_solution_details (
                                     _pk,
                                     _updated_by,
                                     _updated_at,
                                     _disabled,
                                     ads_solution_fk,
                                     name,
                                     strength,
                                     feature_type,
                                     _useless_to_keep_history
                                 )
                                 VALUES (
                                     '8d88150c-54bf-48df-bd5e-4ba07ae8ddb1',
                                     'anonymus',
                                     '2023-02-25 13:56:51.099727',
                                     0,
                                     'testPK',
                                     'si inca un element intro de Petre tot  @230225 h15:55',
                                     'Weak',
                                     'Benefit',
                                     NULL
                                 );

INSERT INTO ads_solution_details (
                                     _pk,
                                     _updated_by,
                                     _updated_at,
                                     _disabled,
                                     ads_solution_fk,
                                     name,
                                     strength,
                                     feature_type,
                                     _useless_to_keep_history
                                 )
                                 VALUES (
                                     '52165b4c-5824-45d3-94c6-f236f235cbe1',
                                     'anonymus',
                                     '2023-03-11 11:25:03.609592',
                                     0,
                                     '5e9778e3-db4b-4e4f-ade5-f33edac3ac5c',
                                     'MRU-CS (nu stiu daca am pus bine; ce inseamna ''Solution Element''?)',
                                     'Strong',
                                     'Advantage',
                                     NULL
                                 );


-- Table: ads_solution_details_version
CREATE TABLE ads_solution_details_version (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100),
    _updated_at              DATETIME,
    _disabled                BOOLEAN,
    ads_solution_fk          VARCHAR (36),
    name                     VARCHAR (50),
    strength                 VARCHAR (20),
    feature_type             VARCHAR (20),
    transaction_id           INTEGER       NOT NULL,
    end_transaction_id       INTEGER,
    operation_type           SMALLINT      NOT NULL,
    _useless_to_keep_history BOOLEAN,
    CONSTRAINT pk_ads_solution_details_version PRIMARY KEY (
        _pk,
        transaction_id
    )
);


-- Table: ads_solution_version
CREATE TABLE ads_solution_version (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100),
    _updated_at              DATETIME,
    _disabled                BOOLEAN,
    sales_project_fk         VARCHAR (36),
    remarks                  VARCHAR (100),
    name                     VARCHAR (100),
    description              VARCHAR (100),
    transaction_id           INTEGER       NOT NULL,
    end_transaction_id       INTEGER,
    operation_type           SMALLINT      NOT NULL,
    _useless_to_keep_history BOOLEAN,
    CONSTRAINT pk_ads_solution_version PRIMARY KEY (
        _pk,
        transaction_id
    )
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
                                'ac9d78395fb2'
                            );


-- Table: company
CREATE TABLE company (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100) NOT NULL,
    _updated_at              DATETIME      NOT NULL,
    _disabled                BOOLEAN       NOT NULL,
    description              VARCHAR (10)  NOT NULL,
    _useless_to_keep_history BOOLEAN,
    CONSTRAINT pk_company PRIMARY KEY (
        _pk
    )
);


-- Table: salesproject
CREATE TABLE salesproject (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100) NOT NULL,
    _updated_at              DATETIME      NOT NULL,
    _disabled                BOOLEAN       NOT NULL,
    code                     VARCHAR (10)  NOT NULL,
    description              VARCHAR (100) NOT NULL,
    notes                    VARCHAR,
    _useless_to_keep_history BOOLEAN,
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
                             notes,
                             _useless_to_keep_history
                         )
                         VALUES (
                             '09c8b36a-035d-49b2-acef-3b63783977a2',
                             'anonymus',
                             '2023-02-19 15:39:30.207873',
                             0,
                             'COSANA',
                             'proiect COSANA',
                             'full and complete test',
                             NULL
                         );

INSERT INTO salesproject (
                             _pk,
                             _updated_by,
                             _updated_at,
                             _disabled,
                             code,
                             description,
                             notes,
                             _useless_to_keep_history
                         )
                         VALUES (
                             '6aece913-f670-44f2-a3e6-8385819971f4',
                             'anonymus',
                             '2023-02-19 15:40:14.842810',
                             0,
                             'ARSTORM',
                             'proiect ARSTOTM',
                             'teste pentru coplete new business domains',
                             NULL
                         );

INSERT INTO salesproject (
                             _pk,
                             _updated_by,
                             _updated_at,
                             _disabled,
                             code,
                             description,
                             notes,
                             _useless_to_keep_history
                         )
                         VALUES (
                             '05761692-a971-4f04-8c3a-67ad1d9628c2',
                             'anonymus',
                             '2023-03-11 11:12:06.801977',
                             0,
                             'S100',
                             'Proiect PRIMUL TEST ',
                             'Sa vad ce am inteles pana acum.',
                             NULL
                         );


-- Table: solution
CREATE TABLE solution (
    _pk                      VARCHAR (36)  NOT NULL,
    _updated_by              VARCHAR (100) NOT NULL,
    _updated_at              DATETIME      NOT NULL,
    _disabled                BOOLEAN       NOT NULL,
    description              VARCHAR (100) NOT NULL,
    notes                    VARCHAR,
    _useless_to_keep_history BOOLEAN,
    CONSTRAINT pk_solution PRIMARY KEY (
        _pk
    )
);


-- Table: transaction
CREATE TABLE [transaction] (
    issued_at   DATETIME,
    id          INTEGER      NOT NULL,
    remote_addr VARCHAR (50),
    CONSTRAINT pk_transaction PRIMARY KEY (
        id
    )
);

INSERT INTO [transaction] (
                              issued_at,
                              id,
                              remote_addr
                          )
                          VALUES (
                              '2023-03-28 01:26:02.885486',
                              1,
                              NULL
                          );

INSERT INTO [transaction] (
                              issued_at,
                              id,
                              remote_addr
                          )
                          VALUES (
                              '2023-03-28 01:27:10.085141',
                              2,
                              NULL
                          );

INSERT INTO [transaction] (
                              issued_at,
                              id,
                              remote_addr
                          )
                          VALUES (
                              '2023-03-28 01:29:01.247036',
                              3,
                              NULL
                          );

INSERT INTO [transaction] (
                              issued_at,
                              id,
                              remote_addr
                          )
                          VALUES (
                              '2023-03-28 01:29:45.132058',
                              4,
                              NULL
                          );

INSERT INTO [transaction] (
                              issued_at,
                              id,
                              remote_addr
                          )
                          VALUES (
                              '2023-03-28 01:30:24.829135',
                              5,
                              NULL
                          );

INSERT INTO [transaction] (
                              issued_at,
                              id,
                              remote_addr
                          )
                          VALUES (
                              '2023-03-28 01:32:27.171725',
                              6,
                              NULL
                          );

INSERT INTO [transaction] (
                              issued_at,
                              id,
                              remote_addr
                          )
                          VALUES (
                              '2023-03-28 01:33:56.530113',
                              7,
                              NULL
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


-- Index: ix_ads_decision_criteria_details_1criterialist_version__disabled
CREATE INDEX ix_ads_decision_criteria_details_1criterialist_version__disabled ON ads_decision_criteria_details_1criterialist_version (
    _disabled
);


-- Index: ix_ads_decision_criteria_details_1criterialist_version__updated_by
CREATE INDEX ix_ads_decision_criteria_details_1criterialist_version__updated_by ON ads_decision_criteria_details_1criterialist_version (
    _updated_by
);


-- Index: ix_ads_decision_criteria_details_1criterialist_version_ads_decision_criteria_fk
CREATE INDEX ix_ads_decision_criteria_details_1criterialist_version_ads_decision_criteria_fk ON ads_decision_criteria_details_1criterialist_version (
    ads_decision_criteria_fk
);


-- Index: ix_ads_decision_criteria_details_1criterialist_version_end_transaction_id
CREATE INDEX ix_ads_decision_criteria_details_1criterialist_version_end_transaction_id ON ads_decision_criteria_details_1criterialist_version (
    end_transaction_id
);


-- Index: ix_ads_decision_criteria_details_1criterialist_version_name
CREATE INDEX ix_ads_decision_criteria_details_1criterialist_version_name ON ads_decision_criteria_details_1criterialist_version (
    name
);


-- Index: ix_ads_decision_criteria_details_1criterialist_version_operation_type
CREATE INDEX ix_ads_decision_criteria_details_1criterialist_version_operation_type ON ads_decision_criteria_details_1criterialist_version (
    operation_type
);


-- Index: ix_ads_decision_criteria_details_1criterialist_version_our_status
CREATE INDEX ix_ads_decision_criteria_details_1criterialist_version_our_status ON ads_decision_criteria_details_1criterialist_version (
    our_status
);


-- Index: ix_ads_decision_criteria_details_1criterialist_version_transaction_id
CREATE INDEX ix_ads_decision_criteria_details_1criterialist_version_transaction_id ON ads_decision_criteria_details_1criterialist_version (
    transaction_id
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


-- Index: ix_ads_decision_criteria_details_2maptoperson_version__disabled
CREATE INDEX ix_ads_decision_criteria_details_2maptoperson_version__disabled ON ads_decision_criteria_details_2maptoperson_version (
    _disabled
);


-- Index: ix_ads_decision_criteria_details_2maptoperson_version__updated_by
CREATE INDEX ix_ads_decision_criteria_details_2maptoperson_version__updated_by ON ads_decision_criteria_details_2maptoperson_version (
    _updated_by
);


-- Index: ix_ads_decision_criteria_details_2maptoperson_version_ads_decision_criteria_details_1criterialist_fk
CREATE INDEX ix_ads_decision_criteria_details_2maptoperson_version_ads_decision_criteria_details_1criterialist_fk ON ads_decision_criteria_details_2maptoperson_version (
    ads_decision_criteria_details_1criterialist_fk
);


-- Index: ix_ads_decision_criteria_details_2maptoperson_version_ads_relationships_details_fk
CREATE INDEX ix_ads_decision_criteria_details_2maptoperson_version_ads_relationships_details_fk ON ads_decision_criteria_details_2maptoperson_version (
    ads_relationships_details_fk
);


-- Index: ix_ads_decision_criteria_details_2maptoperson_version_client_importance
CREATE INDEX ix_ads_decision_criteria_details_2maptoperson_version_client_importance ON ads_decision_criteria_details_2maptoperson_version (
    client_importance
);


-- Index: ix_ads_decision_criteria_details_2maptoperson_version_end_transaction_id
CREATE INDEX ix_ads_decision_criteria_details_2maptoperson_version_end_transaction_id ON ads_decision_criteria_details_2maptoperson_version (
    end_transaction_id
);


-- Index: ix_ads_decision_criteria_details_2maptoperson_version_operation_type
CREATE INDEX ix_ads_decision_criteria_details_2maptoperson_version_operation_type ON ads_decision_criteria_details_2maptoperson_version (
    operation_type
);


-- Index: ix_ads_decision_criteria_details_2maptoperson_version_transaction_id
CREATE INDEX ix_ads_decision_criteria_details_2maptoperson_version_transaction_id ON ads_decision_criteria_details_2maptoperson_version (
    transaction_id
);


-- Index: ix_ads_decision_criteria_remarks
CREATE INDEX ix_ads_decision_criteria_remarks ON ads_decision_criteria (
    remarks
);


-- Index: ix_ads_decision_criteria_sales_project_fk
CREATE UNIQUE INDEX ix_ads_decision_criteria_sales_project_fk ON ads_decision_criteria (
    sales_project_fk
);


-- Index: ix_ads_decision_criteria_version__disabled
CREATE INDEX ix_ads_decision_criteria_version__disabled ON ads_decision_criteria_version (
    _disabled
);


-- Index: ix_ads_decision_criteria_version__updated_by
CREATE INDEX ix_ads_decision_criteria_version__updated_by ON ads_decision_criteria_version (
    _updated_by
);


-- Index: ix_ads_decision_criteria_version_end_transaction_id
CREATE INDEX ix_ads_decision_criteria_version_end_transaction_id ON ads_decision_criteria_version (
    end_transaction_id
);


-- Index: ix_ads_decision_criteria_version_operation_type
CREATE INDEX ix_ads_decision_criteria_version_operation_type ON ads_decision_criteria_version (
    operation_type
);


-- Index: ix_ads_decision_criteria_version_remarks
CREATE INDEX ix_ads_decision_criteria_version_remarks ON ads_decision_criteria_version (
    remarks
);


-- Index: ix_ads_decision_criteria_version_sales_project_fk
CREATE INDEX ix_ads_decision_criteria_version_sales_project_fk ON ads_decision_criteria_version (
    sales_project_fk
);


-- Index: ix_ads_decision_criteria_version_transaction_id
CREATE INDEX ix_ads_decision_criteria_version_transaction_id ON ads_decision_criteria_version (
    transaction_id
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


-- Index: ix_ads_evaluation_version__access_to_funds
CREATE INDEX ix_ads_evaluation_version__access_to_funds ON ads_evaluation_version (
    _access_to_funds
);


-- Index: ix_ads_evaluation_version__approach_decision_making_criteria
CREATE INDEX ix_ads_evaluation_version__approach_decision_making_criteria ON ads_evaluation_version (
    _approach_decision_making_criteria
);


-- Index: ix_ads_evaluation_version__credibility
CREATE INDEX ix_ads_evaluation_version__credibility ON ads_evaluation_version (
    _credibility
);


-- Index: ix_ads_evaluation_version__cultural_compatibility
CREATE INDEX ix_ads_evaluation_version__cultural_compatibility ON ads_evaluation_version (
    _cultural_compatibility
);


-- Index: ix_ads_evaluation_version__current_relation_with_customer
CREATE INDEX ix_ads_evaluation_version__current_relation_with_customer ON ads_evaluation_version (
    _current_relation_with_customer
);


-- Index: ix_ads_evaluation_version__customer_business
CREATE INDEX ix_ads_evaluation_version__customer_business ON ads_evaluation_version (
    _customer_business
);


-- Index: ix_ads_evaluation_version__customer_financials
CREATE INDEX ix_ads_evaluation_version__customer_financials ON ads_evaluation_version (
    _customer_financials
);


-- Index: ix_ads_evaluation_version__decisive_event
CREATE INDEX ix_ads_evaluation_version__decisive_event ON ads_evaluation_version (
    _decisive_event
);


-- Index: ix_ads_evaluation_version__disabled
CREATE INDEX ix_ads_evaluation_version__disabled ON ads_evaluation_version (
    _disabled
);


-- Index: ix_ads_evaluation_version__final_applicability
CREATE INDEX ix_ads_evaluation_version__final_applicability ON ads_evaluation_version (
    _final_applicability
);


-- Index: ix_ads_evaluation_version__formal_decision_making_criteria
CREATE INDEX ix_ads_evaluation_version__formal_decision_making_criteria ON ads_evaluation_version (
    _formal_decision_making_criteria
);


-- Index: ix_ads_evaluation_version__internal_support
CREATE INDEX ix_ads_evaluation_version__internal_support ON ads_evaluation_version (
    _internal_support
);


-- Index: ix_ads_evaluation_version__long_term_revenue
CREATE INDEX ix_ads_evaluation_version__long_term_revenue ON ads_evaluation_version (
    _long_term_revenue
);


-- Index: ix_ads_evaluation_version__political_aspects
CREATE INDEX ix_ads_evaluation_version__political_aspects ON ads_evaluation_version (
    _political_aspects
);


-- Index: ix_ads_evaluation_version__profitability
CREATE INDEX ix_ads_evaluation_version__profitability ON ads_evaluation_version (
    _profitability
);


-- Index: ix_ads_evaluation_version__resources_required_to_sell
CREATE INDEX ix_ads_evaluation_version__resources_required_to_sell ON ads_evaluation_version (
    _resources_required_to_sell
);


-- Index: ix_ads_evaluation_version__risk
CREATE INDEX ix_ads_evaluation_version__risk ON ads_evaluation_version (
    _risk
);


-- Index: ix_ads_evaluation_version__short_term_revenue
CREATE INDEX ix_ads_evaluation_version__short_term_revenue ON ads_evaluation_version (
    _short_term_revenue
);


-- Index: ix_ads_evaluation_version__solution_matching
CREATE INDEX ix_ads_evaluation_version__solution_matching ON ads_evaluation_version (
    _solution_matching
);


-- Index: ix_ads_evaluation_version__strategical_value
CREATE INDEX ix_ads_evaluation_version__strategical_value ON ads_evaluation_version (
    _strategical_value
);


-- Index: ix_ads_evaluation_version__updated_by
CREATE INDEX ix_ads_evaluation_version__updated_by ON ads_evaluation_version (
    _updated_by
);


-- Index: ix_ads_evaluation_version__value_of_business_proposal
CREATE INDEX ix_ads_evaluation_version__value_of_business_proposal ON ads_evaluation_version (
    _value_of_business_proposal
);


-- Index: ix_ads_evaluation_version_end_transaction_id
CREATE INDEX ix_ads_evaluation_version_end_transaction_id ON ads_evaluation_version (
    end_transaction_id
);


-- Index: ix_ads_evaluation_version_operation_type
CREATE INDEX ix_ads_evaluation_version_operation_type ON ads_evaluation_version (
    operation_type
);


-- Index: ix_ads_evaluation_version_sales_project_fk
CREATE INDEX ix_ads_evaluation_version_sales_project_fk ON ads_evaluation_version (
    sales_project_fk
);


-- Index: ix_ads_evaluation_version_transaction_id
CREATE INDEX ix_ads_evaluation_version_transaction_id ON ads_evaluation_version (
    transaction_id
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


-- Index: ix_ads_general_data_version__disabled
CREATE INDEX ix_ads_general_data_version__disabled ON ads_general_data_version (
    _disabled
);


-- Index: ix_ads_general_data_version__updated_by
CREATE INDEX ix_ads_general_data_version__updated_by ON ads_general_data_version (
    _updated_by
);


-- Index: ix_ads_general_data_version_end_transaction_id
CREATE INDEX ix_ads_general_data_version_end_transaction_id ON ads_general_data_version (
    end_transaction_id
);


-- Index: ix_ads_general_data_version_operation_type
CREATE INDEX ix_ads_general_data_version_operation_type ON ads_general_data_version (
    operation_type
);


-- Index: ix_ads_general_data_version_sales_project_fk
CREATE INDEX ix_ads_general_data_version_sales_project_fk ON ads_general_data_version (
    sales_project_fk
);


-- Index: ix_ads_general_data_version_transaction_id
CREATE INDEX ix_ads_general_data_version_transaction_id ON ads_general_data_version (
    transaction_id
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


-- Index: ix_ads_org_map_details_version__disabled
CREATE INDEX ix_ads_org_map_details_version__disabled ON ads_org_map_details_version (
    _disabled
);


-- Index: ix_ads_org_map_details_version__updated_by
CREATE INDEX ix_ads_org_map_details_version__updated_by ON ads_org_map_details_version (
    _updated_by
);


-- Index: ix_ads_org_map_details_version_ads_org_map_fk
CREATE INDEX ix_ads_org_map_details_version_ads_org_map_fk ON ads_org_map_details_version (
    ads_org_map_fk
);


-- Index: ix_ads_org_map_details_version_code
CREATE INDEX ix_ads_org_map_details_version_code ON ads_org_map_details_version (
    code
);


-- Index: ix_ads_org_map_details_version_consultant
CREATE INDEX ix_ads_org_map_details_version_consultant ON ads_org_map_details_version (
    consultant
);


-- Index: ix_ads_org_map_details_version_decision_make
CREATE INDEX ix_ads_org_map_details_version_decision_make ON ads_org_map_details_version (
    decision_make
);


-- Index: ix_ads_org_map_details_version_end_transaction_id
CREATE INDEX ix_ads_org_map_details_version_end_transaction_id ON ads_org_map_details_version (
    end_transaction_id
);


-- Index: ix_ads_org_map_details_version_financial_evaluation
CREATE INDEX ix_ads_org_map_details_version_financial_evaluation ON ads_org_map_details_version (
    financial_evaluation
);


-- Index: ix_ads_org_map_details_version_name
CREATE INDEX ix_ads_org_map_details_version_name ON ads_org_map_details_version (
    name
);


-- Index: ix_ads_org_map_details_version_need_to_sign
CREATE INDEX ix_ads_org_map_details_version_need_to_sign ON ads_org_map_details_version (
    need_to_sign
);


-- Index: ix_ads_org_map_details_version_operation_type
CREATE INDEX ix_ads_org_map_details_version_operation_type ON ads_org_map_details_version (
    operation_type
);


-- Index: ix_ads_org_map_details_version_technical_evaluation
CREATE INDEX ix_ads_org_map_details_version_technical_evaluation ON ads_org_map_details_version (
    technical_evaluation
);


-- Index: ix_ads_org_map_details_version_transaction_id
CREATE INDEX ix_ads_org_map_details_version_transaction_id ON ads_org_map_details_version (
    transaction_id
);


-- Index: ix_ads_org_map_sales_project_fk
CREATE UNIQUE INDEX ix_ads_org_map_sales_project_fk ON ads_org_map (
    sales_project_fk
);


-- Index: ix_ads_org_map_version__disabled
CREATE INDEX ix_ads_org_map_version__disabled ON ads_org_map_version (
    _disabled
);


-- Index: ix_ads_org_map_version__updated_by
CREATE INDEX ix_ads_org_map_version__updated_by ON ads_org_map_version (
    _updated_by
);


-- Index: ix_ads_org_map_version_end_transaction_id
CREATE INDEX ix_ads_org_map_version_end_transaction_id ON ads_org_map_version (
    end_transaction_id
);


-- Index: ix_ads_org_map_version_operation_type
CREATE INDEX ix_ads_org_map_version_operation_type ON ads_org_map_version (
    operation_type
);


-- Index: ix_ads_org_map_version_sales_project_fk
CREATE INDEX ix_ads_org_map_version_sales_project_fk ON ads_org_map_version (
    sales_project_fk
);


-- Index: ix_ads_org_map_version_transaction_id
CREATE INDEX ix_ads_org_map_version_transaction_id ON ads_org_map_version (
    transaction_id
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


-- Index: ix_ads_relationships_details_version__disabled
CREATE INDEX ix_ads_relationships_details_version__disabled ON ads_relationships_details_version (
    _disabled
);


-- Index: ix_ads_relationships_details_version__updated_by
CREATE INDEX ix_ads_relationships_details_version__updated_by ON ads_relationships_details_version (
    _updated_by
);


-- Index: ix_ads_relationships_details_version_ads_relationships_fk
CREATE INDEX ix_ads_relationships_details_version_ads_relationships_fk ON ads_relationships_details_version (
    ads_relationships_fk
);


-- Index: ix_ads_relationships_details_version_change_adaptability
CREATE INDEX ix_ads_relationships_details_version_change_adaptability ON ads_relationships_details_version (
    change_adaptability
);


-- Index: ix_ads_relationships_details_version_contact_status
CREATE INDEX ix_ads_relationships_details_version_contact_status ON ads_relationships_details_version (
    contact_status
);


-- Index: ix_ads_relationships_details_version_end_transaction_id
CREATE INDEX ix_ads_relationships_details_version_end_transaction_id ON ads_relationships_details_version (
    end_transaction_id
);


-- Index: ix_ads_relationships_details_version_name
CREATE INDEX ix_ads_relationships_details_version_name ON ads_relationships_details_version (
    name
);


-- Index: ix_ads_relationships_details_version_operation_type
CREATE INDEX ix_ads_relationships_details_version_operation_type ON ads_relationships_details_version (
    operation_type
);


-- Index: ix_ads_relationships_details_version_our_status_in_relation
CREATE INDEX ix_ads_relationships_details_version_our_status_in_relation ON ads_relationships_details_version (
    our_status_in_relation
);


-- Index: ix_ads_relationships_details_version_position
CREATE INDEX ix_ads_relationships_details_version_position ON ads_relationships_details_version (
    position
);


-- Index: ix_ads_relationships_details_version_transaction_id
CREATE INDEX ix_ads_relationships_details_version_transaction_id ON ads_relationships_details_version (
    transaction_id
);


-- Index: ix_ads_relationships_sales_project_fk
CREATE UNIQUE INDEX ix_ads_relationships_sales_project_fk ON ads_relationships (
    sales_project_fk
);


-- Index: ix_ads_relationships_version__disabled
CREATE INDEX ix_ads_relationships_version__disabled ON ads_relationships_version (
    _disabled
);


-- Index: ix_ads_relationships_version__updated_by
CREATE INDEX ix_ads_relationships_version__updated_by ON ads_relationships_version (
    _updated_by
);


-- Index: ix_ads_relationships_version_end_transaction_id
CREATE INDEX ix_ads_relationships_version_end_transaction_id ON ads_relationships_version (
    end_transaction_id
);


-- Index: ix_ads_relationships_version_operation_type
CREATE INDEX ix_ads_relationships_version_operation_type ON ads_relationships_version (
    operation_type
);


-- Index: ix_ads_relationships_version_sales_project_fk
CREATE INDEX ix_ads_relationships_version_sales_project_fk ON ads_relationships_version (
    sales_project_fk
);


-- Index: ix_ads_relationships_version_transaction_id
CREATE INDEX ix_ads_relationships_version_transaction_id ON ads_relationships_version (
    transaction_id
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


-- Index: ix_ads_revenue_version__disabled
CREATE INDEX ix_ads_revenue_version__disabled ON ads_revenue_version (
    _disabled
);


-- Index: ix_ads_revenue_version__updated_by
CREATE INDEX ix_ads_revenue_version__updated_by ON ads_revenue_version (
    _updated_by
);


-- Index: ix_ads_revenue_version_end_transaction_id
CREATE INDEX ix_ads_revenue_version_end_transaction_id ON ads_revenue_version (
    end_transaction_id
);


-- Index: ix_ads_revenue_version_operation_type
CREATE INDEX ix_ads_revenue_version_operation_type ON ads_revenue_version (
    operation_type
);


-- Index: ix_ads_revenue_version_sales_project_fk
CREATE INDEX ix_ads_revenue_version_sales_project_fk ON ads_revenue_version (
    sales_project_fk
);


-- Index: ix_ads_revenue_version_transaction_id
CREATE INDEX ix_ads_revenue_version_transaction_id ON ads_revenue_version (
    transaction_id
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


-- Index: ix_ads_solution_details_version__disabled
CREATE INDEX ix_ads_solution_details_version__disabled ON ads_solution_details_version (
    _disabled
);


-- Index: ix_ads_solution_details_version__updated_by
CREATE INDEX ix_ads_solution_details_version__updated_by ON ads_solution_details_version (
    _updated_by
);


-- Index: ix_ads_solution_details_version_ads_solution_fk
CREATE INDEX ix_ads_solution_details_version_ads_solution_fk ON ads_solution_details_version (
    ads_solution_fk
);


-- Index: ix_ads_solution_details_version_end_transaction_id
CREATE INDEX ix_ads_solution_details_version_end_transaction_id ON ads_solution_details_version (
    end_transaction_id
);


-- Index: ix_ads_solution_details_version_feature_type
CREATE INDEX ix_ads_solution_details_version_feature_type ON ads_solution_details_version (
    feature_type
);


-- Index: ix_ads_solution_details_version_name
CREATE INDEX ix_ads_solution_details_version_name ON ads_solution_details_version (
    name
);


-- Index: ix_ads_solution_details_version_operation_type
CREATE INDEX ix_ads_solution_details_version_operation_type ON ads_solution_details_version (
    operation_type
);


-- Index: ix_ads_solution_details_version_strength
CREATE INDEX ix_ads_solution_details_version_strength ON ads_solution_details_version (
    strength
);


-- Index: ix_ads_solution_details_version_transaction_id
CREATE INDEX ix_ads_solution_details_version_transaction_id ON ads_solution_details_version (
    transaction_id
);


-- Index: ix_ads_solution_name
CREATE INDEX ix_ads_solution_name ON ads_solution (
    name
);


-- Index: ix_ads_solution_sales_project_fk
CREATE UNIQUE INDEX ix_ads_solution_sales_project_fk ON ads_solution (
    sales_project_fk
);


-- Index: ix_ads_solution_version__disabled
CREATE INDEX ix_ads_solution_version__disabled ON ads_solution_version (
    _disabled
);


-- Index: ix_ads_solution_version__updated_by
CREATE INDEX ix_ads_solution_version__updated_by ON ads_solution_version (
    _updated_by
);


-- Index: ix_ads_solution_version_end_transaction_id
CREATE INDEX ix_ads_solution_version_end_transaction_id ON ads_solution_version (
    end_transaction_id
);


-- Index: ix_ads_solution_version_name
CREATE INDEX ix_ads_solution_version_name ON ads_solution_version (
    name
);


-- Index: ix_ads_solution_version_operation_type
CREATE INDEX ix_ads_solution_version_operation_type ON ads_solution_version (
    operation_type
);


-- Index: ix_ads_solution_version_sales_project_fk
CREATE INDEX ix_ads_solution_version_sales_project_fk ON ads_solution_version (
    sales_project_fk
);


-- Index: ix_ads_solution_version_transaction_id
CREATE INDEX ix_ads_solution_version_transaction_id ON ads_solution_version (
    transaction_id
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
