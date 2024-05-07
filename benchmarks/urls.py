from django.urls import path

from . import views

urlpatterns = [
	path('', views.select, name='select'),
	path('display/', views.display, name='display'),
	path('scores_submitted/', views.scores_submitted, name='scores_submitted'),
]