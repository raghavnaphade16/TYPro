from django.contrib import admin
from .models import Restaurant
from .models import Menu
from .models import *
# Register your models here.
admin.site.register(Restaurant)
admin.site.register(Menu)
admin.site.register(Orders)
admin.site.register(ordermenu)
admin.site.register(Transaction)
