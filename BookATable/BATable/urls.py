from django.urls import path
from . import views

urlpatterns = [
    path('',views.home,name='home'),
    path('login',views.login,name='login'),
    path('registration',views.registration,name='registration'),
    path('myRest/<int:myid>',views.RestInfo,name='RestInfo'),
    path('myRest/<int:myid>/<str:cid>',views.RestInfo,name='RestInfo'),
    path('Payment/<str:cid>',views.Payment,name='Payment'),
    path('update_item/',views.updateItem,name="update_item"),
    path('viewall/<str:cid>',views.viewall,name="viewall"),
    path('FinalTransaction/<str:oid>',views.FinalTransaction,name="FinalTransaction"),
    path('feedback/<str:rid>',views.feedback,name='feedback'),
    path('pdf_view/<str:oid>', views.ViewPDF.as_view(), name="pdf_view"),
    path('pdf_download/<str:oid>', views.DownloadPDF.as_view(), name="pdf_download"),
    path('report_view/<str:rname>', views.viewReport.as_view(), name="report_view"),
    path('report_download/<str:rname>', views.DownloadReport.as_view(), name="report_download"),
    path("logout", views.logout, name='logout'),
    path('report',views.report,name='report'),
]
