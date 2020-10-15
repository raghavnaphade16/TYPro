from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.contrib.auth.models import User,auth
from django.contrib import messages
from .models import *
import datetime
from .forms import *
# Create your views here.
def home(request):    
    rests= Restaurant.objects.all()  
    #return render(request,'quotesslider.html')   
    return render(request,'home.html',{'rests':rests})
    return render(request,'home.html')

def login(request):
    if request.method == 'POST':
        username=request.POST['exampleInputEmail1']
        password=request.POST['exampleInputPassword1']

        if Customer.objects.filter(email=username).exists() and Customer.objects.filter(password=password).exists() :
        
            return redirect('/')
        else:
            print("Invalid credentials")
            messages.info(request,'Invalid credentials')
            return  redirect('login')       
    else:
        return render(request,'login.html')

def registration(request):
    if request.method == 'POST':
        FName=request.POST['FirstName']
        LName=request.POST['LastName']
        Email=request.POST['Email']
        ContactNo=request.POST['ContactNo']
        Bdate=request.POST['birthday']
        C_City=request.POST['City']
        password1=request.POST['Password']
        password2=request.POST['ConfirmPassword']
        d = datetime.date(2016, 10, 19)
        #print(Bdate)
        
        if password1==password2:
                
                if Customer.objects.filter(mobileNo=ContactNo).exists():
                    messages.info(request,'Already register user')
                    return redirect('registration')
                elif Customer.objects.filter(email=Email).exists():
                    messages.info(request,'Email Taken')
                    return redirect('registration')   
                
                else:
                    cust_obj=Customer(firstName=FName,lastName=LName,email=Email,mobileNo=ContactNo,city=C_City,birthDate=Bdate,password=password1)
                    cust_obj.save()
                    return redirect('login')
        else:
            print('Password not matched')
            return redirect('registration')
        return redirect('/')
    else:
        return render(request,'registration.html')
         #   rest= Restaurant.objects.RestId



def RestInfo(request,myid):
    rests= Restaurant.objects.filter(restId=myid)
    #print(rests)
    data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] 
    menus=Menu.objects.all().filter(restId=myid)
    '''for menu in menus:
        print(menu.menuId)'''
    #return render(request,"test.html",{'context':data,'menus':menus})
    return render(request, "RestInfo.html",{'rest':rests[0],'menus':menus,'context':data})
