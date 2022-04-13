import datetime

from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from .models import Class, Membership, SignUp, ScheduledClass


def home(request):
	return render(request, 'classes/home.html')


def classes(request, date_string_from_url):
	
	date_time_today = datetime.datetime.now()

	date_list_from_url = date_string_from_url.split('-')
	d = datetime.datetime(int(date_list_from_url[0]), int(date_list_from_url[1]), int(date_list_from_url[2]))
	date_today = datetime.date(int(d.strftime("%Y")), int(d.strftime("%m")), int(d.strftime("%d")))
	date_string = "{}-{}-{}".format(d.strftime("%Y"), d.strftime("%m"), d.strftime("%d"))

	if request.user.is_authenticated:
		user = User.objects.get(pk=request.user.id)
		sign_ups = user.signup_set.filter(date=date_today)
	else:
		sign_ups = []

	all_scheduled_classes = ScheduledClass.objects.filter(date=date_today)
	classes = {}

	for c in all_scheduled_classes:
		time_list_from_class = c.class_option.start_time.split(":")
		date_time_of_class = datetime.datetime(int(date_list_from_url[0]), int(date_list_from_url[1]), int(date_list_from_url[2]), int(time_list_from_class[0]), int(time_list_from_class[1]), int(time_list_from_class[2]))
		if date_time_of_class > date_time_today:
			classes[c.class_option] = False

	for c in classes.keys():
		for sign_up in sign_ups:
			if c.id == sign_up.selected_class.id:
				classes[c] = True


	context = {
		'date_string': date_string,
		'classes': classes,
	}

	return render(request, 'classes/class_sign_ups.html', context)


def booked(request):

	class_id = request.POST['class_id']
	date_string = request.POST['date_string']
	user_id = request.POST['user_id']

	user = User.objects.get(pk=user_id)

	context = {
		'class_booked': False
	}

	if not user.member.has_monthly_membership and user.member.passes > 0:
		user.member.passes -= 1
		user.member.save()
		selected_class = Class.objects.get(pk=class_id)
		selected_class.signup_set.create(user_id = user_id, selected_class_id = class_id, date=date_string)
		context['class_booked'] = True
		return render(request, 'classes/class_booked.html', context)

	elif user.member.has_monthly_membership:
		selected_class = Class.objects.get(pk=class_id)
		selected_class.signup_set.create(user_id = user_id, selected_class_id = class_id, date=date_string, purchased_type='monthly membership')
		context['class_booked'] = True
		return render(request, 'classes/class_booked.html', context)

	else:
		return render(request, 'classes/class_booked.html', context)


def unbooked(request, sign_up_id):
	if request.user.is_authenticated:
		user = User.objects.get(pk=request.user.id)

	context = {
		'sign_up_removed': False
	}

	try:
		sign_up = SignUp.objects.get(pk=int(sign_up_id))
	except SignUp.doesNotExist:
		return render(request, 'classes/class_unbooked.html', context)

	sign_up.delete()
	context['sign_up_removed'] = True

	if sign_up.purchased_type == 'class_pass':
		user.member.passes += 1
		user.member.save()

	return render(request, 'classes/class_unbooked.html', context)


def all_signed_up(request):
	date_today = datetime.date.today()
	sign_ups_for_today = SignUp.objects.filter(date=date_today)

	sign_ups_dict = {}

	for sign_up in sign_ups_for_today:
		try:
			sign_ups_dict[sign_up.selected_class].append(sign_up.user)
		except KeyError:
			sign_ups_dict[sign_up.selected_class] = []
			sign_ups_dict[sign_up.selected_class].append(sign_up.user)

	context = {
		'sign_ups_dict': sign_ups_dict
	}

	return render(request, 'classes/all_signed_up.html', context)



def calendar(request):
	user_agent = request.META['HTTP_USER_AGENT']

	if 'Mobile' in user_agent:
	    return redirect('classes_mobile')
	else:
		d = datetime.datetime.today()
		date = "{}-{}-{}".format(d.strftime("%Y"), d.strftime("%m"), d.strftime("%d"))

		classes = Class.objects.all()

		context = {
			'date': date,
			'classes': classes
		}

		return render(request, 'classes/calendar.html', context)


def memberships(request):
	memberships = Membership.objects.all()
	return render(request, 'classes/memberships.html', {'memberships':memberships})


def add_membership(request):
	membership_id = request.POST['membership_id']
	membership = Membership.objects.get(pk=membership_id)
	
	user = User.objects.get(pk=request.user.id)

	if membership.membership_type == "single visit":
		user.member.passes += 1
	elif membership.membership_type == "ten visit":
		user.member.passes += 10
	elif membership.membership_type == "monthly membership":
		if user.member.has_monthly_membership:
			user.member.membership_expiration_date = user.member.membership_expiration_date + datetime.timedelta(days=30)
		else:
			user.member.has_monthly_membership = True
			user.member.membership_expiration_date = datetime.date.today() + datetime.timedelta(days=30)
	else:
		print('invalid membership type')

	user.member.save()

	return render(request, 'classes/add_membership.html')








