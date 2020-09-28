import warnings
warnings.filterwarnings('ignore')

import pandas as pd
import env

def get_connection(db, user=env.user, host=env.host, password=env.password):
    '''
    connect to sqlpro using info from a env file
    '''
    return f'mysql+pymysql://{user}:{password}@{host}/{db}'
    
def wrangle_telco():
    '''
    Get telco data for exersizes
    
    '''
    
    sql_statement = ''' select customer_id, monthly_charges, tenure, total_charges
                        from customers
                        where contract_type_id = 3'''

    database = "telco_churn"

    df = pd.read_sql(sql_statement, get_connection(database))

    df = df.dropna()
    
    return df

wrangle_telco()