#from django.db import models
from django.contrib.gis.db import models

# Create your models here.

# create parent class
class RefugeesParent(models.Model):
    Id = models.IntegerField(primary_key=True)
    land = models.CharField(max_length=100)
    pop = models.FloatField(null=True, blank=True)
    refRatio = models.FloatField(null=True, blank=True)
    refTotal = models.FloatField(null=True, blank=True)
    male = models.FloatField(null=True, blank=True)
    female = models.FloatField(null=True, blank=True)
    u18 = models.FloatField(null=True, blank=True)
    u18erstantrag = models.FloatField(null=True, blank=True)
    u34 = models.FloatField(null=True, blank=True)
    u34erstantrag = models.FloatField(null=True, blank=True)
    u64 = models.FloatField(null=True, blank=True)
    u64erstantrag = models.FloatField(null=True, blank=True)
    ue65 = models.FloatField(null=True, blank=True)
    ue65erstantrag = models.FloatField(null=True, blank=True)
    unknown = models.FloatField(null=True, blank=True)
    erstantrag = models.FloatField(null=True, blank=True)
    folgeantrag = models.FloatField(null=True, blank=True)
    haltung = models.TextField(null=True, blank=True)
    geom = models.PointField()

    def __str__(self):
        return self.land


    class Meta:
        abstract = True # makes parent class abstract, so there will be no tables created for parent class

# create child classes by inherenting attributes from parent class

class Refugees2011(RefugeesParent):
    class Meta:
        verbose_name_plural = 'Refugees2011'

class Refugees2012(RefugeesParent):
    class Meta:
        verbose_name_plural = 'Refugees2012'

class Refugees2013(RefugeesParent):
    class Meta:
        verbose_name_plural = 'Refugees2013'

class Refugees2014(RefugeesParent):
    class Meta:
        verbose_name_plural = 'Refugees2014'

class Refugees2015(RefugeesParent):
    class Meta:
        verbose_name_plural = 'Refugees2015'

class Refugees2016(RefugeesParent):
    class Meta:
        verbose_name_plural = 'Refugees2016'

class Refugees2017(RefugeesParent):
    class Meta:
        verbose_name_plural = 'Refugees2017'

class Refugees2018(RefugeesParent):
    class Meta:
        verbose_name_plural = 'Refugees2018'
