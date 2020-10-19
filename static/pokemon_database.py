#import SQL Alchemy and Pandas
from sqlalchemy import create_engine
import pandas as pd

string="postgres:postgres@localhost:5432/Pokeon"

engine=create_engine(f"postgresql://{string}")

engine.table_names()

con=engine
data=pd.read_sql("SELECT COUNT(number), type FROM pokedex GROUP BY type ORDER BY COUNT(number) DESC",con)
data.head()
