from django.db import models

# Create your models here.
class UF(models.Model):
    initials = models.CharField(max_length=2)
    name = models.CharField(max_length=100)

class Office(models.Model):
    name = models.CharField(max_length=100)

class Paying(models.Model):
    document = models.CharField(max_length=20)
    name = models.CharField(max_length=30)

class Contract(models.Model):
    paying = models.ForeignKey(Paying,on_delete=models.CASCADE)
    code = models.CharField(max_length=100)
    number =  models.CharField(max_length=100)

class Research(models.Model):
    uf = models.ForeignKey('UF',on_delete=models.CASCADE)
    execution_date = models.DateField()
    execution_time = models.TimeField()
    election_year = models.PositiveIntegerField()
    office = models.ForeignKey(Office,on_delete=models.CASCADE)
    contracts = models.ManyToManyField(Contract)
