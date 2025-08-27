from sqlalchemy import create_engine
import pandas as pd


user = 'root'
password = 'password'
host = 'localhost'
database = 'twoja_baza'
table_name = 'genes'


engine = create_engine(f'mysql+pymysql://{user}:{password}@{host}/{database}')

def csv_to_sql(sciezka_csv, engine, table_name):
    try:
        df = pd.read_csv(sciezka_csv)

        df.to_sql(name=table_name, con=engine, if_exists='append', index=False)

        print(f"Dodano {len(df)} wierszy do tabeli '{table_name}'.")
    except Exception as e:
        print("Błąd podczas dodawania danych:", e)

