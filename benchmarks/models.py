from django.db import models
from django.contrib.auth.models import User


class Benchmark(models.Model):
	name = models.CharField(max_length=64)

	def __str__(self):
		return self.name


class Workout(models.Model):
	name = models.CharField(max_length=64)
	benchmarks = models.ManyToManyField(Benchmark)
	user = models.ManyToManyField(User, through='CurrentScore')

	def __str__(self):
		return self.name


class CurrentScore(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	workout = models.ForeignKey(Workout, on_delete=models.CASCADE)
	score = models.CharField(max_length=64)
	date = models.DateField()

	def __str__(self):
		return "{} {} | {} | {} | {}".format(self.user.first_name, self.user.last_name, self.workout.name, self.date, self.score)
