"""empty message

Revision ID: 9451dca3fa40
Revises: f643ace9fd49
Create Date: 2023-03-23 06:19:52.880055

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '9451dca3fa40'
down_revision = 'f643ace9fd49'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('ads_decision_criteria_details_1criterialist_version', schema=None) as batch_op:
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
        batch_op.alter_column('ads_decision_criteria_fk',
               existing_type=sa.VARCHAR(length=36),
               nullable=True,
               autoincrement=False)
        batch_op.alter_column('name',
               existing_type=sa.VARCHAR(length=50),
               nullable=True,
               autoincrement=False)
        batch_op.alter_column('our_status',
               existing_type=sa.VARCHAR(length=20),
               nullable=True,
               autoincrement=False)

    with op.batch_alter_table('ads_decision_criteria_details_2maptoperson_version', schema=None) as batch_op:
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
        batch_op.alter_column('ads_decision_criteria_details_1criterialist_fk',
               existing_type=sa.VARCHAR(length=36),
               nullable=True,
               autoincrement=False)
        batch_op.alter_column('ads_relationships_details_fk',
               existing_type=sa.VARCHAR(length=36),
               nullable=True,
               autoincrement=False)
        batch_op.alter_column('client_importance',
               existing_type=sa.VARCHAR(length=20),
               nullable=True,
               autoincrement=False)

    with op.batch_alter_table('ads_solution_details_version', schema=None) as batch_op:
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
        batch_op.alter_column('ads_solution_fk',
               existing_type=sa.VARCHAR(length=36),
               nullable=True,
               autoincrement=False)
        batch_op.alter_column('name',
               existing_type=sa.VARCHAR(length=50),
               nullable=True,
               autoincrement=False)
        batch_op.alter_column('strength',
               existing_type=sa.VARCHAR(length=20),
               nullable=True,
               autoincrement=False)
        batch_op.alter_column('feature_type',
               existing_type=sa.VARCHAR(length=20),
               nullable=True,
               autoincrement=False)

    with op.batch_alter_table('ads_solution_version', schema=None) as batch_op:
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
        batch_op.alter_column('remarks',
               existing_type=sa.VARCHAR(length=100),
               nullable=True,
               autoincrement=False)
        batch_op.alter_column('name',
               existing_type=sa.VARCHAR(length=100),
               nullable=True,
               autoincrement=False)
        batch_op.alter_column('description',
               existing_type=sa.VARCHAR(length=100),
               nullable=True,
               autoincrement=False)

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('ads_solution_version', schema=None) as batch_op:
        batch_op.alter_column('description',
               existing_type=sa.VARCHAR(length=100),
               nullable=False,
               autoincrement=False)
        batch_op.alter_column('name',
               existing_type=sa.VARCHAR(length=100),
               nullable=False,
               autoincrement=False)
        batch_op.alter_column('remarks',
               existing_type=sa.VARCHAR(length=100),
               nullable=False,
               autoincrement=False)
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

    with op.batch_alter_table('ads_solution_details_version', schema=None) as batch_op:
        batch_op.alter_column('feature_type',
               existing_type=sa.VARCHAR(length=20),
               nullable=False,
               autoincrement=False)
        batch_op.alter_column('strength',
               existing_type=sa.VARCHAR(length=20),
               nullable=False,
               autoincrement=False)
        batch_op.alter_column('name',
               existing_type=sa.VARCHAR(length=50),
               nullable=False,
               autoincrement=False)
        batch_op.alter_column('ads_solution_fk',
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

    with op.batch_alter_table('ads_decision_criteria_details_2maptoperson_version', schema=None) as batch_op:
        batch_op.alter_column('client_importance',
               existing_type=sa.VARCHAR(length=20),
               nullable=False,
               autoincrement=False)
        batch_op.alter_column('ads_relationships_details_fk',
               existing_type=sa.VARCHAR(length=36),
               nullable=False,
               autoincrement=False)
        batch_op.alter_column('ads_decision_criteria_details_1criterialist_fk',
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

    with op.batch_alter_table('ads_decision_criteria_details_1criterialist_version', schema=None) as batch_op:
        batch_op.alter_column('our_status',
               existing_type=sa.VARCHAR(length=20),
               nullable=False,
               autoincrement=False)
        batch_op.alter_column('name',
               existing_type=sa.VARCHAR(length=50),
               nullable=False,
               autoincrement=False)
        batch_op.alter_column('ads_decision_criteria_fk',
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

    # ### end Alembic commands ###
