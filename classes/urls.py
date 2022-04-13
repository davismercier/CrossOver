from django.urls import path

from . import views

urlpatterns = [
	path('<str:date_string_from_url>', views.classes, name='classes'),
	path('calendar/', views.calendar, name='calendar'),
	path('booked/', views.booked, name='booked'),
	path('unbooked/<str:sign_up_id>', views.unbooked, name='unbooked'),
	path('all_signed_up/', views.all_signed_up, name='all_signed_up'),
]