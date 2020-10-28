from django.db import models

class Customer(models.Model):
    custId=models.CharField(primary_key=True,max_length=20)
    custFirstName= models.CharField(max_length=100)
    custLastName= models.CharField(max_length=100)
    custEmail= models.CharField(max_length=50)
    custMobileNo= models.BigIntegerField() 
    custCity=models.TextField(max_length=30)
    custPassword = models.CharField(max_length=50)

    class Meta:
      db_table = "customer" 
     
    def is_member(self):
      member = Customer.objects.get(custId=self)  
      if member:
        return True
      else:
        return False


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
    restId= models.ForeignKey(Restaurant,on_delete=models.CASCADE)
    class Meta:
      db_table = "Menu" 

class Coupon(models.Model):
  couponId=models.CharField(primary_key=True,max_length=50)
  menuId= models.ForeignKey(Menu,on_delete=models.CASCADE)
  custId=models.ForeignKey(Customer,on_delete=models.CASCADE)
  class Meta:
    db_table = "Coupon"

class Orders(models.Model):
  orderId=models.CharField(primary_key=True,max_length=50)
  custId=models.ForeignKey(Customer,on_delete=models.CASCADE)
  restId= models.ForeignKey(Restaurant,on_delete=models.CASCADE,blank=True, null=False)
  status=models.BooleanField(default=False,null=True,blank=True)
  bookingDtTime=models.DateTimeField(null=False, blank=False) 
  tableNo=models.IntegerField()
  class Meta:
    db_table = "Orders"
  
  @property
  def total_cart(self):
    ordermenus=self.ordermenu_set.all()
    total=sum([item.get_total for item in ordermenus])
    return total
    
  @property
  def get_cart_total(self):
    ordermenus=self.ordermenu_set.all()
    gst=18/100
    addtotal=sum([item.get_total for item in ordermenus])
    total=(addtotal+(addtotal*gst))
    return total
  
  @property
  def gst(self):
    ordermenus=self.ordermenu_set.all()
    gst=18/100
    addtotal=sum([item.get_total for item in ordermenus])
    total=addtotal*gst
    return total

  @property
  def get_cart_items(self):
    ordermenus=self.ordermenu_set.all()
    total=sum([item.quantity for item in ordermenus])
    return total

class Transaction(models.Model):
  trnId=models.CharField(primary_key=True,max_length=50)
  orderId=models.ForeignKey(Orders,on_delete=models.CASCADE)
  trnDtTime=models.DateTimeField(auto_now=True)
  total=models.BigIntegerField()
  gst=models.IntegerField()
  discount=models.IntegerField()
  netTotal=models.IntegerField()
  class Meta:
    db_table="Transaction"
  
class FeedBack(models.Model):
  feedbackId=models.CharField(primary_key=True,max_length=50)
  restId= models.ForeignKey(Restaurant,on_delete=models.CASCADE)
  feedbackType=models.CharField(max_length=50)
  feedback=models.CharField(max_length=500)
  email=models.CharField(max_length=500)
  feedbackDtTime=models.DateTimeField(null=False, blank=False) 
  rate=models.CharField(max_length=500)
  contactno=models.BigIntegerField() 
  class Meta:
    db_table="FeedBack"
  
class ordermenu(models.Model):
    custId=models.ForeignKey(Customer,on_delete=models.CASCADE)
    menuId= models.ForeignKey(Menu,on_delete=models.CASCADE)
    orderId=models.ForeignKey(Orders,on_delete=models.CASCADE)
    quantity=models.IntegerField(default=0)
    class Meta:
      db_table="ordermenu"
    @property
    def get_total(self):
      total=self.menuId.menuPrice*self.quantity
      return total