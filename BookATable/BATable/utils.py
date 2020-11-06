class viewReport(View):
    def get(self, request, oid, *args, **kwargs):
        
        
        data = {'now':now,'rid': rid, 'oid': oid, 'items': items,'order':order} 
              
        pdf = render_to_pdf('pdf_template.html', data)
        return HttpResponse(pdf, content_type='application/pdf')


# Automaticly downloads to PDF file
class DownloadReport(View):
    def get(self, request, oid, *args, **kwargs):
        data = {'now':now,'rid': rid, 'oid': oid, 'items': items,'order':order} 
        
        pdf = render_to_pdf('pdf_template.html', data)

        response = HttpResponse(pdf, content_type='application/pdf')
        filename = "Report%s.pdf" % ("12341231")
        content = "attachment; filename='%s'" % (filename)
        response['Content-Disposition'] = content
        return response