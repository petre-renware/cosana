"""empty message

Revision ID: 9ed0124c5e8e
Revises: 200f1f96c1d5
Create Date: 2023-03-10 13:20:58.882435

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '9ed0124c5e8e'
down_revision = '200f1f96c1d5'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('ads_org_map', schema=None) as batch_op:
        batch_op.drop_constraint('fk_ads_org_map_sales_project_fk_salesproject', type_='foreignkey')
        batch_op.create_foreign_key(batch_op.f('fk_ads_org_map_sales_project_fk_salesproject'), 'salesproject', ['sales_project_fk'], ['_pk'], onupdate='CASCADE', ondelete='CASCADE')

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('ads_org_map', schema=None) as batch_op:
        batch_op.drop_constraint(batch_op.f('fk_ads_org_map_sales_project_fk_salesproject'), type_='foreignkey')
        batch_op.create_foreign_key('fk_ads_org_map_sales_project_fk_salesproject', 'salesproject', ['sales_project_fk'], ['_pk'], ondelete='CASCADE')

    # ### end Alembic commands ###
