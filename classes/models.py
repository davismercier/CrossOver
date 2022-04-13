from django.db import models
from django.contrib.auth.models import User
# from django.utils.translation import gettext_lazy as _


class Class(models.Model):
	name = models.CharField(max_length=64)
	start_time = models.CharField(max_length=64)
	end_time = models.CharField(max_length=64)
	# days_of_week = models.CharField(max_length=64)
	description = models.CharField(max_length=256)
	user = models.ManyToManyField(User, through='SignUp')

	def __str__(self):

		if self.start_time[0:1] == "0":
			hour = int(self.start_time[1:2])
			day_time = 'am'
		else:
			hour = int(self.start_time[0:2])
			if hour > 12:
				hour -= 12
				day_time = 'pm'
			else:
				day_time = 'am'

		hour = str(hour)
		minute = self.start_time[3:5]

		return "{} - {}:{} {}".format(self.name, hour, minute, day_time)


class ScheduledClass(models.Model):
	class_option = models.ForeignKey(Class, on_delete=models.CASCADE)
	date = models.DateField()

	def __str__(self):
		return "{} on {}".format(self.class_option, self.date)


class SignUp(models.Model):

	class Purchased_Type(models.TextChoices):
		class_pass = 'class_pass'
		monthly_membership = 'monthly membership'

	purchased_type = models.CharField(
		max_length=64,
		choices = Purchased_Type.choices,
		default = Purchased_Type.class_pass,
	)
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	selected_class = models.ForeignKey(Class, on_delete=models.CASCADE)
	date = models.DateField()

	def __str__(self):
		return "{} on {}".format(self.selected_class, self.date)



class Membership(models.Model):

    class Membership_Type(models.TextChoices):
    	no_pass = 'no pass'
    	single_visit = 'single visit'
    	ten_visit = 'ten visit'
    	monthly_membership = 'monthly membership'

    membership_type = models.CharField(
    	max_length=64,
    	choices = Membership_Type.choices,
    	default = Membership_Type.no_pass,
    )

    name = models.CharField(max_length=64, default = "")
    cost = models.IntegerField(default = 0)
    description = models.CharField(max_length=256, default="")

    def __str__(self):
    	return self.name



