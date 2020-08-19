import pandas as pd
from pyhive import presto
from requests.auth import HTTPBasicAuth

host = '<presto-url OR ip>'
port = 8443
username = '<username>'
password = '<password>'
schema = '<schema-name>'


def query_discovery(query):
    requests_kwargs = {
        'auth': HTTPBasicAuth(username, password),
        'verify': 'resources/presto-gcp.pem'
    }
    cursor = presto.connect(
        host=host,
        port=port,
        schema=schema,
        username=username,
        protocol='https',
        requests_kwargs=requests_kwargs).cursor()

    cursor.execute(query)
    df = pd.DataFrame(cursor.fetchall())
    cursor.close()
    return df
