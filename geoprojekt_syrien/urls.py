"""geoprojekt_syrien URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
import django.contrib.auth.views
from django.conf import settings
from django.conf.urls.static import static

import geosyrienapp.views
from geosyrienapp.views import * # Refugees2011, Refugees2012 etc.

urlpatterns = [
    path("", geosyrienapp.views.flowmap, name='flowmap'),
    path("dataset_2011/", dataset_2011, name='dataset_2011'),
    path("dataset_2012/", dataset_2012, name='dataset_2012'),
    path("dataset_2013/", dataset_2013, name='dataset_2013'),
    path("dataset_2014/", dataset_2014, name='dataset_2014'),
    path("dataset_2015/", dataset_2015, name='dataset_2015'),
    path("dataset_2016/", dataset_2016, name='dataset_2016'),
    path("dataset_2017/", dataset_2017, name='dataset_2017'),
    path("dataset_2018/", dataset_2018, name='dataset_2018'),
    path('top10_ref2011/', top10_ref2011, name='top10_2011'),
    path('top10_ref2012/', top10_ref2012, name='top10_2012'),
    path('top10_ref2013/', top10_ref2013, name='top10_2013'),
    path('top10_ref2014/', top10_ref2014, name='top10_2014'),
    path('top10_ref2015/', top10_ref2015, name='top10_2015'),
    path('top10_ref2016/', top10_ref2016, name='top10_2016'),
    path('top10_ref2017/', top10_ref2017, name='top10_2017'),
    path('top10_ref2018/', top10_ref2018, name='top10_2018'),
    path('admin/', admin.site.urls),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
