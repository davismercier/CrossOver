from django.db import models
from django.contrib.auth.models import User
import datetime

class Member(models.Model):
	user = models.OneToOneField(User, on_delete=models.CASCADE)
	passes = models.IntegerField(default=1)
	has_monthly_membership = models.BooleanField(default=False)
	membership_expiration_date = models.DateField(default=datetime.date.today)


	def __str__(self):
		return "{} {}".format(self.user.first_name, self.user.last_name)
