import ln2sqlmodule


def convert_text_to_query(text):
    return ln2sqlmodule.getSql(text, "database_store/trance_v3.sql")
