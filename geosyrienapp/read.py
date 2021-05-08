rom django.contrib.gis.geos import Point
from datetime import datetime
from leaflet.admin import LeafletGeoAdmin
import pandas as pd
from pandas import ExcelWriter
from pandas import ExcelFile
from geosyrienapp.models import * # Refugees2011, Refugees2012 etc.
from django.apps import apps

"""
this file will read the provided excel data sheet and populate
its content to the models
"""


# read excel dataset
data = pd.ExcelFile('/Users/hoangvutuyen/Documents/python_scripts/geoprojekt/geoprojekt_syrien/dataset.xlsx')

# import model names in list
models_list = [
    Refugees2011,
    Refugees2012,
    Refugees2013,
    Refugees2014,
    Refugees2015,
    Refugees2016,
    Refugees2017,
    Refugees2018
]

# create dataframes out of separate excel sheets by appending to dictionary
df = {}
for sheet in data.sheet_names:
    df[f'{sheet}'] = pd.read_excel(data, sheet_name=sheet, na_values=None)

# interate through all items in dict
for model in models_list:
    for frame in df:
        for index, row in df[frame].iterrows():
            Id = index
            land = row['Land']
            pop = row['Gesamtbevoelkerung des Landes']
            refRatio = row['Fluechtlinge pro 10.000 Einwohner']
            refTotal = row['gefluechtete total']
            male = row['maennlich total']
            female = row['weiblich total']
            u18 = row['Kinder unter 18 Jahren']
            u18erstantrag = row['Kinder unter 18 Jahren Erstantrag']
            u34 = row['<34 Jahren']
            u34erstantrag = row['< 34 Jahren Erstantrag']
            u64 = row['< 64 Jahren']
            u64erstantrag = row['< 64 Jahren Erstantrag']
            ue65 = row['> 65 Jahren']
            ue65erstantrag = row['> 65 Jahren Erstantrag']
            unknown = row['unbekannt']
            erstantrag = row['Erstantrag']
            folgeantrag = row['Folgeantrag']
            Longitude = row['e_longitude']
            Latitude = row['e_latitude']

        # populate db by assigning values to model attributes
        # access keys from the imported models dict which are the models: refugees2011, refugees2012 etc.
            model(Id=Id, land=land, pop=pop, refRatio=refRatio, refTotal=refTotal, male=male, female=female,
                        u18=u18, u18erstantrag=u18erstantrag, u34=u34, u34erstantrag=u34erstantrag, u64=u64, u64erstantrag=u64erstantrag,
                        ue65=ue65, ue65erstantrag=ue65erstantrag, unknown=unknown, erstantrag=erstantrag, folgeantrag=folgeantrag, geom=Point(Longitude, Latitude)).save()
