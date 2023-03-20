"""empty message

Revision ID: c5f710032056
Revises: b1650749c462
Create Date: 2023-02-23 12:20:49.300466

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'c5f710032056'
down_revision = 'b1650749c462'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('ads_solution',
    sa.Column('_pk', sa.String(length=36), nullable=False),
    sa.Column('_updated_by', sa.String(length=100), nullable=False),
    sa.Column('_updated_at', sa.DateTime(), nullable=False),
    sa.Column('_disabled', sa.Boolean(), nullable=False),
    sa.Column('sales_project_fk', sa.String(length=36), nullable=False),
    sa.Column('remarks', sa.String(length=100), nullable=False),
    sa.Column('name', sa.String(length=100), nullable=False),
    sa.Column('description', sa.String(length=100), nullable=False),
    sa.ForeignKeyConstraint(['sales_project_fk'], ['salesproject._pk'], name=op.f('fk_ads_solution_sales_project_fk_salesproject'), onupdate='CASCADE', ondelete='CASCADE'),
    sa.PrimaryKeyConstraint('_pk', name=op.f('pk_ads_solution'))
    )
    with op.batch_alter_table('ads_solution', schema=None) as batch_op:
        batch_op.create_index(batch_op.f('ix_ads_solution__disabled'), ['_disabled'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_solution__updated_by'), ['_updated_by'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_solution_name'), ['name'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_solution_sales_project_fk'), ['sales_project_fk'], unique=True)

    op.create_table('ads_solution_details',
    sa.Column('_pk', sa.String(length=36), nullable=False),
    sa.Column('_updated_by', sa.String(length=100), nullable=False),
    sa.Column('_updated_at', sa.DateTime(), nullable=False),
    sa.Column('_disabled', sa.Boolean(), nullable=False),
    sa.Column('ads_solution_fk', sa.String(length=36), nullable=False),
    sa.ForeignKeyConstraint(['ads_solution_fk'], ['ads_solution._pk'], name=op.f('fk_ads_solution_details_ads_solution_fk_ads_solution'), onupdate='CASCADE', ondelete='CASCADE'),
    sa.PrimaryKeyConstraint('_pk', name=op.f('pk_ads_solution_details'))
    )
    with op.batch_alter_table('ads_solution_details', schema=None) as batch_op:
        batch_op.create_index(batch_op.f('ix_ads_solution_details__disabled'), ['_disabled'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_solution_details__updated_by'), ['_updated_by'], unique=False)
        batch_op.create_index(batch_op.f('ix_ads_solution_details_ads_solution_fk'), ['ads_solution_fk'], unique=False)

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('ads_solution_details', schema=None) as batch_op:
        batch_op.drop_index(batch_op.f('ix_ads_solution_details_ads_solution_fk'))
        batch_op.drop_index(batch_op.f('ix_ads_solution_details__updated_by'))
        batch_op.drop_index(batch_op.f('ix_ads_solution_details__disabled'))

    op.drop_table('ads_solution_details')
    with op.batch_alter_table('ads_solution', schema=None) as batch_op:
        batch_op.drop_index(batch_op.f('ix_ads_solution_sales_project_fk'))
        batch_op.drop_index(batch_op.f('ix_ads_solution_name'))
        batch_op.drop_index(batch_op.f('ix_ads_solution__updated_by'))
        batch_op.drop_index(batch_op.f('ix_ads_solution__disabled'))

    op.drop_table('ads_solution')
    # ### end Alembic commands ###
