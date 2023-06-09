"""empty message

Revision ID: 17167c147965
Revises: d9348954494c
Create Date: 2023-03-23 05:45:25.339699

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '17167c147965'
down_revision = 'd9348954494c'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('ads_org_map_details_version',
    sa.Column('_pk', sa.String(length=36), autoincrement=False, nullable=False),
    sa.Column('_updated_by', sa.String(length=100), autoincrement=False, nullable=False),
    sa.Column('_updated_at', sa.DateTime(), autoincrement=False, nullable=False),
    sa.Column('_disabled', sa.Boolean(), autoincrement=False, nullable=False),
    sa.Column('ads_org_map_fk', sa.String(length=36), autoincrement=False, nullable=False),
    sa.Column('code', sa.String(length=10), autoincrement=False, nullable=False),
    sa.Column('name', sa.String(length=50), autoincrement=False, nullable=False),
    sa.Column('decision_make', sa.Boolean(), autoincrement=False, nullable=False),
    sa.Column('need_to_sign', sa.Boolean(), autoincrement=False, nullable=False),
    sa.Column('technical_evaluation', sa.Boolean(), autoincrement=False, nullable=False),
    sa.Column('financial_evaluation', sa.Boolean(), autoincrement=False, nullable=False),
    sa.Column('consultant', sa.Boolean(), autoincrement=False, nullable=False),
    sa.Column('transaction_id', sa.BigInteger(), autoincrement=False, nullable=False),
    sa.Column('end_transaction_id', sa.BigInteger(), nullable=True),
    sa.Column('operation_type', sa.SmallInteger(), nullable=False),
    sa.PrimaryKeyConstraint('_pk', 'transaction_id', name=op.f('pk_ads_org_map_details_version'))
    )
    with op.batch_alter_table('ads_org_map_details_version', schema=None) as batch_op:
        batch_op.create_index(batch_op.f('ix_ads_org_map_details_version__disabled'), ['_disabled'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_details_version__updated_by'), ['_updated_by'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_details_version_ads_org_map_fk'), ['ads_org_map_fk'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_details_version_code'), ['code'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_details_version_consultant'), ['consultant'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_details_version_decision_make'), ['decision_make'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_details_version_end_transaction_id'), ['end_transaction_id'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_details_version_financial_evaluation'), ['financial_evaluation'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_details_version_name'), ['name'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_details_version_need_to_sign'), ['need_to_sign'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_details_version_operation_type'), ['operation_type'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_details_version_technical_evaluation'), ['technical_evaluation'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_details_version_transaction_id'), ['transaction_id'], unique=False)

    op.create_table('ads_org_map_version',
    sa.Column('_pk', sa.String(length=36), autoincrement=False, nullable=False),
    sa.Column('_updated_by', sa.String(length=100), autoincrement=False, nullable=False),
    sa.Column('_updated_at', sa.DateTime(), autoincrement=False, nullable=False),
    sa.Column('_disabled', sa.Boolean(), autoincrement=False, nullable=False),
    sa.Column('sales_project_fk', sa.String(length=36), autoincrement=False, nullable=False),
    sa.Column('remarks', sa.String(length=100), autoincrement=False, nullable=False),
    sa.Column('transaction_id', sa.BigInteger(), autoincrement=False, nullable=False),
    sa.Column('end_transaction_id', sa.BigInteger(), nullable=True),
    sa.Column('operation_type', sa.SmallInteger(), nullable=False),
    sa.PrimaryKeyConstraint('_pk', 'transaction_id', name=op.f('pk_ads_org_map_version'))
    )
    with op.batch_alter_table('ads_org_map_version', schema=None) as batch_op:
        batch_op.create_index(batch_op.f('ix_ads_org_map_version__disabled'), ['_disabled'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_version__updated_by'), ['_updated_by'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_version_end_transaction_id'), ['end_transaction_id'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_version_operation_type'), ['operation_type'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_version_sales_project_fk'), ['sales_project_fk'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_org_map_version_transaction_id'), ['transaction_id'], unique=False)

    with op.batch_alter_table('ads_evaluation_version', schema=None) as batch_op:
        batch_op.alter_column('_updated_by',
               existing_type=sa.VARCHAR(length=100),
               nullable=True,
               autoincrement=False)
        batch_op.alter_column('_updated_at',
               existing_type=sa.DATETIME(),
               nullable=True,
               autoincrement=False)
        batch_op.alter_column('_disabled',
               existing_type=sa.BOOLEAN(),
               nullable=True,
               autoincrement=False)
        batch_op.alter_column('sales_project_fk',
               existing_type=sa.VARCHAR(length=36),
               nullable=True,
               autoincrement=False)

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('ads_evaluation_version', schema=None) as batch_op:
        batch_op.alter_column('sales_project_fk',
               existing_type=sa.VARCHAR(length=36),
               nullable=False,
               autoincrement=False)
        batch_op.alter_column('_disabled',
               existing_type=sa.BOOLEAN(),
               nullable=False,
               autoincrement=False)
        batch_op.alter_column('_updated_at',
               existing_type=sa.DATETIME(),
               nullable=False,
               autoincrement=False)
        batch_op.alter_column('_updated_by',
               existing_type=sa.VARCHAR(length=100),
               nullable=False,
               autoincrement=False)

    with op.batch_alter_table('ads_org_map_version', schema=None) as batch_op:
        batch_op.drop_index(batch_op.f('ix_ads_org_map_version_transaction_id'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_version_sales_project_fk'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_version_operation_type'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_version_end_transaction_id'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_version__updated_by'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_version__disabled'))

    op.drop_table('ads_org_map_version')
    with op.batch_alter_table('ads_org_map_details_version', schema=None) as batch_op:
        batch_op.drop_index(batch_op.f('ix_ads_org_map_details_version_transaction_id'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_details_version_technical_evaluation'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_details_version_operation_type'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_details_version_need_to_sign'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_details_version_name'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_details_version_financial_evaluation'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_details_version_end_transaction_id'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_details_version_decision_make'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_details_version_consultant'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_details_version_code'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_details_version_ads_org_map_fk'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_details_version__updated_by'))
        batch_op.drop_index(batch_op.f('ix_ads_org_map_details_version__disabled'))

    op.drop_table('ads_org_map_details_version')
    # ### end Alembic commands ###
