from django.contrib import admin
from leaflet.admin import LeafletGeoAdmin

from geosyrienapp.models import * # Refugees2011, Refugees2012, Refugees2013 etc.

# shows leaflet map on admin page
class refAdmin(LeafletGeoAdmin):
    pass

# register admin site for models

# create list of moduls from geosyrienapp.models
modul_list = [
    Refugees2011,
    Refugees2012,
    Refugees2013,
    Refugees2014,
    Refugees2015,
    Refugees2016,
    Refugees2017,
    Refugees2018
]

# iterating with list comprehension to register / create admin sites for models
admin_sites = [admin.site.register(model, refAdmin) for model in modul_list]
