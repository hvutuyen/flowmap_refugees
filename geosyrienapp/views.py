from django.shortcuts import render
from django.http import HttpRequest, HttpResponse
from django.template import RequestContext
from datetime import datetime
from django.core.serializers import serialize
from django.template.context import Context
from geosyrienapp.models import * # Refugees2011, Refugees2012 etc.
import pandas as pd

# Create your views here.

# create Datasets and store as json
# the dataset will be used to display countries with der total records of refugees by year
# the datasets will be used as input for the flowmap
def dataset_2011(request):
    data2012 = serialize("geojson", Refugees2011.objects.all())
    return HttpResponse(data2012, content_type="json")

def dataset_2012(request):
    data2012 = serialize("geojson", Refugees2012.objects.all())
    return HttpResponse(data2012, content_type="json")


def dataset_2013(request):
    data2013 = serialize("geojson", Refugees2013.objects.all())
    return HttpResponse(data2013, content_type="json")


def dataset_2014(request):
    data2014 = serialize("geojson", Refugees2014.objects.all())
    return HttpResponse(data2014, content_type="json")


def dataset_2015(request):
    data2015 = serialize("geojson", Refugees2015.objects.all())
    return HttpResponse(data2015, content_type="json")


def dataset_2016(request):
    data2016 = serialize("geojson", Refugees2016.objects.all())
    return HttpResponse(data2016, content_type="json")


def dataset_2017(request):
    data2017 = serialize("geojson", Refugees2017.objects.all())
    return HttpResponse(data2017, content_type="json")


def dataset_2018(request):
    data2018 = serialize("geojson", Refugees2018.objects.all())
    return HttpResponse(data2018, content_type="json")

# get top 10 countries which are records most refugees by year.
# the top 10 data will be used as input for the diagramm on the map
def top10_ref2011(request):
    df_top10 = pd.DataFrame.from_records(Refugees2011.objects.all().values())
    df_top10_x_y_sorted = df_top10.sort_values(['refTotal'], ascending=False)
    df_top10_x_y = df_top10_x_y_sorted[['land', 'refTotal']]
    df_top10_rows = df_top10_x_y.head(10)
    df_top10_rows_json = df_top10_rows.to_json(orient='records')
    return HttpResponse(df_top10_rows_json, content_type='json')


def top10_ref2012(request):
    df_top10 = pd.DataFrame.from_records(Refugees2012.objects.all().values())
    df_top10_x_y_sorted = df_top10.sort_values(['refTotal'], ascending=False)
    df_top10_x_y = df_top10_x_y_sorted[['land', 'refTotal']]
    df_top10_rows = df_top10_x_y.head(10)
    df_top10_rows_json = df_top10_rows.to_json(orient='records')
    return HttpResponse(df_top10_rows_json, content_type='json')


def top10_ref2013(request):
    df_top10 = pd.DataFrame.from_records(Refugees2013.objects.all().values())
    df_top10_x_y_sorted = df_top10.sort_values(['refTotal'], ascending=False)
    df_top10_x_y = df_top10_x_y_sorted[['land', 'refTotal']]
    df_top10_rows = df_top10_x_y.head(10)
    df_top10_rows_json = df_top10_rows.to_json(orient='records')
    return HttpResponse(df_top10_rows_json, content_type='json')


def top10_ref2014(request):
    df_top10 = pd.DataFrame.from_records(Refugees2014.objects.all().values())
    df_top10_x_y_sorted = df_top10.sort_values(['refTotal'], ascending=False)
    df_top10_x_y = df_top10_x_y_sorted[['land', 'refTotal']]
    df_top10_rows = df_top10_x_y.head(10)
    df_top10_rows_json = df_top10_rows.to_json(orient='records')
    return HttpResponse(df_top10_rows_json, content_type='json')


def top10_ref2015(request):
    df_top10 = pd.DataFrame.from_records(Refugees2015.objects.all().values())
    df_top10_x_y_sorted = df_top10.sort_values(['refTotal'], ascending=False)
    df_top10_x_y = df_top10_x_y_sorted[['land', 'refTotal']]
    df_top10_rows = df_top10_x_y.head(10)
    df_top10_rows_json = df_top10_rows.to_json(orient='records')
    return HttpResponse(df_top10_rows_json, content_type='json')


def top10_ref2016(request):
    df_top10 = pd.DataFrame.from_records(Refugees2016.objects.all().values())
    df_top10_x_y_sorted = df_top10.sort_values(['refTotal'], ascending=False)
    df_top10_x_y = df_top10_x_y_sorted[['land', 'refTotal']]
    df_top10_rows = df_top10_x_y.head(10)
    df_top10_rows_json = df_top10_rows.to_json(orient='records')
    return HttpResponse(df_top10_rows_json, content_type='json')


def top10_ref2017(request):
    df_top10 = pd.DataFrame.from_records(Refugees2017.objects.all().values())
    df_top10_x_y_sorted = df_top10.sort_values(['refTotal'], ascending=False)
    df_top10_x_y = df_top10_x_y_sorted[['land', 'refTotal']]
    df_top10_rows = df_top10_x_y.head(10)
    df_top10_rows_json = df_top10_rows.to_json(orient='records')
    return HttpResponse(df_top10_rows_json, content_type='json')


def top10_ref2018(request):
    df_top10 = pd.DataFrame.from_records(Refugees2018.objects.all().values())
    df_top10_x_y_sorted = df_top10.sort_values(['refTotal'], ascending=False)
    df_top10_x_y = df_top10_x_y_sorted[['land', 'refTotal']]
    df_top10_rows = df_top10_x_y.head(10)
    df_top10_rows_json = df_top10_rows.to_json(orient='records')
    return HttpResponse(df_top10_rows_json, content_type='json')

def flowmap(request):
    return render(
        request,
        'app/Flowmap.html',
        {
            'title': 'flowmap',
        }
    )
