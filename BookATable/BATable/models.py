from django.db import models

# Create your models here.
class Customer(models.Model):
    firstName= models.CharField(max_length=100)
    lastName= models.CharField(max_length=100)
    email= models.CharField(max_length=100)
    mobileNo= models.IntegerField() 
    city=models.TextField()
    birthDate=models.DateField()
    password = models.CharField(max_length=50)

    class Meta:
      db_table = "customer" 


class Restaurent(models.Model):
    RestId=models.IntegerField(primary_key=True)
    RestName= models.CharField(max_length=100)
    OwnerName= models.CharField(max_length=100)
    RestEmail= models.CharField(max_length=100)
    MobileNo1= models.IntegerField()
    MobileNo2= models.IntegerField() 
    RestAddr=models.TextField(max_length=200)
    RestImg=models.ImageField(upload_to='images/', null=True, verbose_name="") 
    
    

    class Meta:
      db_table = "Restaurent" 

class Menu(models.Model):
    MenuId=models.IntegerField(primary_key=True)
    MenuName= models.CharField(max_length=100)
    MenuPrice= models.IntegerField()
    RestId= models.ForeignKey(Restaurent,on_delete=models.CASCADE); 
    

    class Meta:
      db_table = "Menu" 