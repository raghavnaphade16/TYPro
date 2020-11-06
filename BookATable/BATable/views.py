from django.db.models.aggregates import Sum
from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib import messages
from .models import *
from .forms import *
import json
import pytz
from datetime import datetime, date
# Create your views here.
from io import BytesIO
from django.http import HttpResponse
from django.template.loader import get_template
from django.views import View
from xhtml2pdf import pisa
from django.db.models.functions import TruncMonth
from django.db.models import Count,Func,F,Sum


def render_to_pdf(template_src, context_dict={}):
    template = get_template(template_src)
    html = template.render(context_dict)
    result = BytesIO()
    pdf = pisa.pisaDocument(BytesIO(html.encode("ISO-8859-1")), result)
    if not pdf.err:
        return HttpResponse(result.getvalue(), content_type='application/pdf')
    return None


# Opens up page as PDF


class ViewPDF(View):
    def get(self, request, oid, *args, **kwargs):
        order = Orders.objects.get(orderId=oid)
        items = order.ordermenu_set.all()
        rid = str(items[0].menuId.restId.restId)
        now = datetime.now()
        print(now)
        data = {'now': now, 'rid': rid, 'oid': oid,
                'items': items, 'order': order}
        print("Item Total", order.total_cart)
        print("To pay", order.get_cart_total)

        pdf = render_to_pdf('pdf_template.html', data)
        return HttpResponse(pdf, content_type='application/pdf')


# Automaticly downloads to PDF file
class DownloadPDF(View):
    def get(self, request, oid, *args, **kwargs):
        order = Orders.objects.get(orderId=oid)
        items = order.ordermenu_set.all()
        rid = str(items[0].menuId.restId.restId)
        now = datetime.now()
        data = {'now': now, 'rid': rid, 'oid': oid,
                'items': items, 'order': order}

        pdf = render_to_pdf('pdf_template.html', data)

        response = HttpResponse(pdf, content_type='application/pdf')
        filename = "Invoice_%s.pdf" % ("12341231")
        content = "attachment; filename='%s'" % (filename)
        response['Content-Disposition'] = content
        return response


class viewReport(View):
    def get(self, request, rname, *args, **kwargs):
        print("Welcome")

        if rname == "Total Sales":
            total = Transaction.totalsales()
            netTotal = Transaction.nettotalsales()
            # total=Transaction.objects.aggregate(Sum('netTotal'))

            mon=[]
            totm=[]    
            
            bymonth=Transaction.objects.annotate(month=TruncMonth('trnDtTime')).values('month').annotate(c=Sum('netTotal')).values('month', 'c').order_by('month')
            for m in bymonth:
                print(m['month'],m['c'])
                mon.append(m['month'])
                totm.append(m['c'])
            
            data = {'rname': rname, 'total': total, 'nett': netTotal,'month':mon,'mtot':totm}
            
            pdf = render_to_pdf('generatereport.html', data)
        elif rname=='Total Customers':
            cust=Customer.objects.all()
            for c in cust:
                print(c.custFirstName," ",c.custLastName)
            data = {'rname': rname, 'cust':cust}
            pdf = render_to_pdf('generatereport.html', data)
        # data = {'rname':rname,total}

        return HttpResponse(pdf, content_type='application/pdf')


# Automaticly downloads to PDF file
class DownloadReport(View):
    def get(self, request, oid, *args, **kwargs):
        data = {}
        pdf = render_to_pdf('pdf_template.html', data)
        response = HttpResponse(pdf, content_type='application/pdf')
        filename = "Report%s.pdf" % ("12341231")
        content = "attachment; filename='%s'" % (filename)
        response['Content-Disposition'] = content
        return response


def report(request):
    rlist = ['Total Sales', 'Total Customers', 'Total Restaurants']
    return render(request, 'report.html', {'rlist': rlist})


def restHome():
    rests = Restaurant.objects.all().order_by('restId')[0:4]
    # return render(request,'quotesslider.html')
    return rests


def home(request):
    rests = restHome()
    # return render(request,'quotesslider.html')
    return render(request, 'home.html', {'rests': rests})
    # return render(request,'home.html')


def login(request):
    uname = 'Name'
    if request.method == 'POST':
        username = request.POST['exampleInputEmail1']
        password = request.POST['exampleInputPassword1']

        if Customer.objects.filter(custEmail=username).exists() and Customer.objects.filter(custPassword=password).exists():
            cid = Customer.objects.filter(custEmail=username)

            rests = restHome()
            return render(request, 'index.html', {'rests': rests, 'cust': cid[0]})
        else:
            print("Invalid credentials")
            messages.info(request, 'Invalid credentials')
            rests = restHome()
            return render(request, 'home.html', {'rests': rests})
    else:
        rests = restHome()
        return render(request, 'home.html', {'rests': rests})


def registration(request):
    if request.method == 'POST':
        fname = request.POST['fname']
        LName = request.POST['lname']
        Email = request.POST['email']
        ContactNo = request.POST['Phno']
        C_City = request.POST['City']
        password1 = request.POST['password']
        password2 = request.POST['confirmpassword']

        # print(Bdate)

        if password1 == password2:

            if Customer.objects.filter(custMobileNo=ContactNo).exists():

                messages.info(request, 'Already register user')
                rests = restHome()
                return render(request, 'home.html', {'rests': rests})
            elif Customer.objects.filter(custEmail=Email).exists():
                messages.info(request, 'Email Taken')
                rests = restHome()
                return render(request, 'home.html', {'rests': rests})

            else:
                try:
                    obj = str(Customer.objects.latest('custId'))
                    print(obj)
                    temp = int(obj[21:24])
                    temp1 = int(temp+1)
                    custid = "Cust"+str(temp1)
                    print(custid)
                except Customer.DoesNotExist:
                    custid = 'Cust101'

                cust_obj = Customer(custId=custid, custFirstName=fname, custLastName=LName,
                                    custEmail=Email, custMobileNo=ContactNo, custCity=C_City, custPassword=password1)
                cust_obj.save()
                rests = restHome()
                return render(request, 'home.html', {'rests': rests})
        else:
            print('Password not matched')
            rests = restHome()
            return render(request, 'home.html', {'rests': rests})
        return redirect('/')
    else:
        rests = restHome()
        return render(request, 'home.html', {'rests': rests})
        #   rest= Restaurant.objects.RestId


def RestInfo(request, myid=None, cid=None):
    '''if request.method == 'POST':
        date=request.POST['date']
        print(date)'''
    data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    menus = Menu.objects.all().filter(restId=myid)
    if Customer.objects.filter(custId=cid).exists():
        cust = Customer.objects.all().filter(custId=cid)
        rests = Restaurant.objects.filter(restId=myid)

        # return render(request,"test.html",{'rest':rests[0],'menus':menus,'context':data,'cust':cust[0]})
        return render(request, "RestInfo.html", {'rest': rests[0], 'menus': menus, 'context': data, 'cust': cust[0]})
    else:
        # print(rests)

        rests = Restaurant.objects.filter(restId=myid)
        return render(request, "restInfo.html", {'rest': rests[0], 'menus': menus, 'context': data})


def Payment(request, cid=None, rid=None):

    if Customer.objects.filter(custId=cid).exists() and Orders.objects.filter(custId=cid).exists() and Orders.objects.filter(custId=cid, status=False):
        print("Existing Cart and OID")

        cust = Customer.objects.all().filter(custId=cid)

        obj = str(Orders.objects.latest('orderId'))
        oid = obj[15:19]
        if Orders.objects.filter(orderId=oid).exists() and Orders.objects.filter(orderId=oid, status=True):
            obj = str(Orders.objects.latest('orderId'))
            temp = int(obj[15:19])
            temp1 = int(temp+1)
            oid = str(temp1)
            print("Created in if Payment")
        elif Orders.objects.filter(orderId=oid).exists() and Orders.objects.filter(orderId=oid, status=False):
            obj = str(Orders.objects.latest('orderId'))
            print(obj)
            oid = obj[15:19]
            print("Execute Else in Payment ")

        order, created = Orders.objects.get_or_create(
            orderId=oid, custId=cid, status=False)

        #order = Orders.objects.get(orderId=oid,custId=cid,status=False)
        # if Orders.objects.filter(restId__isnull=True) :
        #   return render(request,'payment.html')
        # else:
        orid = order.restId

        # return render(request,'payment.html',{'cust':cust[0]})
        items = order.ordermenu_set.all()
        #restname = str(items[0].menuId.restId.restName)
        r = items[0].menuId.restId.restId
        # print(items[0].menuId.restId.restId)
        # print(r)
        Orders.objects.filter(orderId=oid).update(restId=r)
        rests = Restaurant.objects.filter(restId=items[0].menuId.restId.restId)
        #print(rests[0]) ,

        data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        # return render(request,'payment.html',{'cust':cust[0]})
        return render(request, 'payment.html', {'rest': rests[0], 'items': items, 'order': order, 'cust': cust[0], 'context': data})
    else:
        print("Create Card")
        items = []
        order = {'get_cart_total': 0, 'get_cart_items': 0}
        messages.info(request, 'Sign Up First')
        cartitems = order['get_cart_items']
        data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        context = {'items': items, 'order': order,
                   'cartitems': cartitems, 'context': data}

        return render(request, 'Payment.html', context)


def updateItem(request):
    data = json.loads(request.body)
    # data=json.loads(request.data)
    menuID = str(data['menuID'])
    user = str(data['user'])
    action = str(data['action'])
    # print('Action',action)
    #print('Menu ID',menuID)
    # print('User',user)
    cid = Customer.objects.get(custId=user)
    menu = Menu.objects.get(menuId=menuID)
    # print(menu.restId)
    # mrid=str(menu.restId)
    # print(menu)
    d = None
    tn = 0
    rid = None
    try:

        obj = str(Orders.objects.latest('orderId'))
        # print(obj)
        oid = obj[15:19]
        if Orders.objects.filter(orderId=oid).exists() and Orders.objects.filter(orderId=oid, status=True):
            obj = str(Orders.objects.latest('orderId'))
            temp = int(obj[15:19])
            temp1 = int(temp+1)

            oid = str(temp1)
            print("Print IF Block in orderUpdate")
        elif Orders.objects.filter(orderId=oid).exists() and Orders.objects.filter(orderId=oid, status=True):
            obj = str(Orders.objects.latest('orderId'))
            # print(obj)
            oid = obj[15:19]
            print("Print ELSE Block in orderUpdate")
    except:
        oid = '5001'
    order, created = Orders.objects.get_or_create(
        orderId=oid, custId=cid, restId=menu.restId, status=False, bookingDtTime=d, tableNo=tn)
    print(order.orderId)
    if Orders.objects.filter(restId__isnull=True):
        menu = Menu.objects.get(menuId=menuID)
        print(menu.restId)
        r = str(menu.restId)
        rid = r[19:22]
        # Restaurant object (101)
        Orders.objects.filter(orderId=order.orderId).update(restId=rid)

        print("Printed")
        # Orders.objects.filter(orderId=order).update(restId=menu.restId)
        #print("In ORDER ",order.restId)
    orderMenu, created = ordermenu.objects.get_or_create(
        custId=cid, orderId=order, menuId=menu)
    print(orderMenu)
    if action == 'add':
        orderMenu.quantity = (orderMenu.quantity+1)
    elif action == 'remove':
        orderMenu.quantity = (orderMenu.quantity-1)
    orderMenu.save()
    if orderMenu.quantity <= 0:
        orderMenu.delete()
    return JsonResponse('Item was Added', safe=False)


def FinalTransaction(request, oid):
    if request.method == 'POST':
        print("Orderid", oid)
        bdate = request.POST['date']
        btime = request.POST['time']
        #guest = request.POST['guests']
        # print(bdate,btime,guest)
        year = int(bdate[0:4])
        month = int(bdate[5:7])
        day = int(bdate[8:10])
        hr = int(btime[0:2])
        mn = int(btime[3:5])
        # print(year,month,day,hr,mn)
        d = datetime(year, month, day, hr, mn, 00, 000000, tzinfo=pytz.UTC)
        # print(d)
        # 2020-10-30 17:15
        # n=str(guest[0])

        if Orders.objects.filter(orderId=oid).exists():
            Orders.objects.filter(orderId=oid).update(
                bookingDtTime=d, status=True)
            order = Orders.objects.get(orderId=oid)
            items = order.ordermenu_set.all()
            print("Booking Date", d)
            print("Rest id and  Name:",
                  items[0].menuId.restId.restId, " ", items[0].menuId.restId.restName)
            print("Custname", items[0].custId.custFirstName)
            for item in items:
                print(item.menuId.menuName, " * ", item.quantity)
                print(item.get_total)
            print("Item Total", order.total_cart)
            print("To pay", order.get_cart_total)
            rid = str(items[0].menuId.restId.restId)
        # return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

            # 2020-11-19 12:23:00+00:00
            #print("Bokking date",order.datebooked())
            now = datetime.now()

            try:
                obj = str(Transaction.objects.latest('trnId'))
                temp = int(obj[20:24])
                temp1 = int(temp+1)
                trnid = str(temp1)

            except Customer.DoesNotExist:
                trnid = '7001'

            tot = order.total_cart
            ntot = order.get_cart_total
            rgst = order.gst
            trnoid = Orders.objects.get(orderId=oid)
            trn = Transaction(trnId=trnid, orderId=trnoid,
                              total=tot, gst=rgst, discount=0, netTotal=ntot)
            trn.save()
            return render(request, 'finaltrn.html', {'now': now, 'rid': rid, 'oid': oid, 'items': items, 'date': bdate, 'time': btime,  'order': order})


def viewall(request, cid=None):
    if cid == None:
        rests = Restaurant.objects.all()
        return render(request, 'viewALL.html', {'rests': rests})
    else:
        rests = Restaurant.objects.all()
        cust = Customer.objects.all().filter(custId=cid)
        return render(request, 'viewALL.html', {'rests': rests, 'cust': cust[0]})


def feedback(request, rid):
    if request.method == 'POST':
        rate = request.POST['rate']
        email = request.POST['email']
        ftype = request.POST['ftype']
        cno = request.POST['cno']
        message = request.POST['message']

        print(rid)
        return redirect('/')


def logout(request):

    return redirect('/')
