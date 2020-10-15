from django import forms 
from .models import *

class ImageForm(forms.ModelForm):
    class Meta:
        model= Restaurant
        fields= ["restImg", "restImg"]
