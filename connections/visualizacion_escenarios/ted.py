import dash
from dash import dcc
from dash import html
import plotly.express as px
import pandas as pd
from Connection import Connection
import covidSQL as sql

external_stylesheets = ["https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"]


# funcion para obtener las palabras de las descripciones de los videos


def word_freq(descs: list) -> dict:
    word_list = {}

    for desc in descs:
        words = desc.replace(".", "")
        words = words.replace(",", "")
        words = words.replace("\"", "")
        words = words.replace("-", " ")
        words = words.replace("'", "")
        words = words.lower()
        words = words.split()
        for word in words:

            if word not in word_list.keys():
                word_list[word] = 1
            else:
                word_list[word] += 1

    return word_list


# Inicializacion app dash
app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

# Escenarios de analisis
con = Connection()
con.openConnection()

con1 = pd.read_sql_query(sql.escenario1(), con.connection)
con2 = pd.read_sql_query(sql.escenario2(), con.connection)
con3 = pd.read_sql_query(sql.escenario3(), con.connection)
con4 = pd.read_sql_query(sql.escenario4(), con.connection)
con5 = pd.read_sql_query(sql.escenario5(), con.connection)

con.closeConnection()

descripciones = con4["descripcion"].values.tolist()
descripciones = word_freq(descripciones)

desc_items = descripciones.items()
desc_list = list(desc_items)
con4 = pd.DataFrame(desc_list)
con4 = con4.sort_values(by=1, ascending=False)
con4 = con4[(con4[1] < 902) & (con4[1] > 100)]
con4.columns = ["palabra", "frecuencia"]


# Grafico barras
figPieViews1 = px.pie(con1.head(20), names="tema_destacado", values="frecuencia")
figBarViews1 = px.bar(con1.head(20), x="tema_destacado", y="frecuencia")

figBarViews2 = px.line(con2.head(20), x="anio", y="visitas_totales")
figBarViewsAvg2 = px.line(con2.head(20), x="anio", y="visitas_promedio")

figBoxViews3 = px.box(con3, x="visitas", orientation="h", points="all", hover_data=["tema"])
figPieViews3 = px.pie(con3.nlargest(20, "visitas"), names="tema", values="visitas")

figBoxViewsAvg3 = px.box(con3, x="visitas_promedio", orientation="h", points="all", hover_data=["tema"])

figBoxViews4 = px.box(con4, x="frecuencia", orientation="h", points="all", hover_data=["palabra"])


"""
# Grafico circular
figPieCases = px.pie(dfCases.head(20), names="country", values="amount")


# Grafico linea
figLineCases = px.line(dfCases.head(20), x="country", y="amount")

# Grafico calor
figHeatCases = px.choropleth(dfCases, locations="country", locationmode="country names", color="amount", hover_name="country", color_continuous_scale="purpor")


# Casos por region
con = Connection()
con.openConnection()
query = pd.read_sql_query(sql.CasesByRegion(), con.connection)
con.closeConnection()
dfCases = pd.DataFrame(query, columns=["region_code", "region", "amount"])

# Grafico barras
figBarCases2 = px.bar(dfCases.head(20), x="region", y="amount")

# Grafico circular
figPieCases2 = px.pie(dfCases.head(20), names="region", values="amount")


# Grafico linea
figLineCases2 = px.line(dfCases.head(20), x="region", y="amount")
"""

# Layout

app.layout = html.Div(children=[
    html.H1(children='Proyecto ing de datos '),
    html.H2(children='Escenario 1'),

    dcc.Graph(
        id='Tabla 1.',
        figure=figPieViews1
    ),

    dcc.Graph(
        id='Tabla 2.',
        figure=figBarViews1
    ),

    html.H2(children='Escenario 2'),

    dcc.Graph(
        id='Tabla 3.',
        figure=figBarViews2
    ),

    dcc.Graph(
        id='Tabla 4.',
        figure=figBarViewsAvg2
    ),

    html.H2(children='Escenario 3'),

    dcc.Graph(
        id='Tabla 5.',
        figure=figPieViews3
    ),

    dcc.Graph(
        id='Tabla 6.',
        figure=figBoxViews3
    ),

    dcc.Graph(
        id='Tabla 7.',
        figure=figBoxViewsAvg3
    ),

    html.H2(children='Escenario 4'),

    dcc.Graph(
        id='Tabla 8.',
        figure=figBoxViews4
    )
])

"""
    dcc.Graph(
        id='pieCasesByCountry',
        figure=figPieCases
    ),
    dcc.Graph(
        id='lineCasesByCountry',
        figure=figLineCases
    ),
    dcc.Graph(
        id='heatCasesByCountry',
        figure=figHeatCases
    ),
    html.H2(children="Casos por region"),
    dcc.Graph(
        id='barCasesByRegion',
        figure=figBarCases2
    ),
    dcc.Graph(
        id='pieCasesRegion',
        figure=figPieCases2
    ),
    dcc.Graph(
        id='lineCasesByRegion',
        figure=figLineCases2
    )"""
if __name__ == '__main__':
    app.run_server(debug=True)
