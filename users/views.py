from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import UserRegisterForm
from .models import Member
from classes import models as class_models
from django.contrib.auth.models import User
from datetime import date, timedelta


def register(request):
	if request.method == 'POST':
		form = UserRegisterForm(request.POST)
		if form.is_valid():
			form.save()
			first_name = form.cleaned_data.get('first_name')
			last_name = form.cleaned_data.get('last_name')
			user = User.objects.get(first_name=first_name, last_name=last_name)
			member = Member(user=user)
			member.save()
			messages.success(request, "Account created for {} {}".format(first_name, last_name))
			return redirect('login')
	else:
		form = UserRegisterForm()

	return render(request, 'users/register.html', {'form': form})

def profile(request):
	date_today = date.today()
	enddate = date_today + timedelta(days=14)

	if request.user.is_authenticated:
		user = User.objects.get(pk=request.user.id)
		sign_ups = user.signup_set.filter(date__range=[date_today, enddate])

		if user.member.membership_expiration_date < date_today:
			user.member.has_monthly_membership = False
			user.member.save()

	else:
		sign_ups = []

	context = {
		'sign_ups': sign_ups
	}
	return render(request, 'users/profile.html', context)