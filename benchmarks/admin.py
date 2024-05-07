from django.contrib import admin
from .models import Benchmark, Workout, CurrentScore

admin.site.register(Benchmark)
admin.site.register(Workout)
admin.site.register(CurrentScore)