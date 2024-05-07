from django.contrib import admin
from .models import Class, Membership, SignUp, ScheduledClass

admin.site.register(Class)
admin.site.register(Membership)
admin.site.register(SignUp)
admin.site.register(ScheduledClass)
