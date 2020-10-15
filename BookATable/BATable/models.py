from django.db import models

class Customer(models.Model):
    custId=models.CharField(primary_key=True,max_length=20)
    custFirstName= models.CharField(max_length=100)
    custLastName= models.CharField(max_length=100)
    custEmail= models.CharField(max_length=50)
    cutMobileNo= models.BigIntegerField() 
    custCity=models.TextField(max_length=30)
    custPassword = models.CharField(max_length=50)

    class Meta:
      db_table = "customer" 


class Restaurant(models.Model):
    restId=models.CharField(primary_key=True,max_length=50)
    restName= models.CharField(max_length=100)
    restType=models.CharField(max_length=10)
    restOwnerName= models.CharField(max_length=100)
    restEmail= models.CharField(max_length=100)
    restMobileNo1= models.BigIntegerField()
    restLandLineNo= models.BigIntegerField() 
    restAddress=models.TextField(max_length=200)
    restImg=models.ImageField(upload_to='images/', null=True, verbose_name="") 
  
    class Meta:
      db_table = "Restaurant" 

class Menu(models.Model):
    menuId=models.CharField(primary_key=True,max_length=50)
    menuName= models.CharField(max_length=100)
    menuType=models.CharField(max_length=100)
    menuPrice= models.IntegerField()
    restId= models.ForeignKey(Restaurant,on_delete=models.CASCADE); 
    

    class Meta:
      db_table = "Menu" 
