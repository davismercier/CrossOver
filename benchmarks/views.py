from django.http import HttpResponse
from django.shortcuts import render
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from .models import Benchmark, Workout, CurrentScore
import datetime


@login_required
def select(request):
	members = User.objects.all()
	benchmarks = Benchmark.objects.all()

	context = {
		'members': members,
		'benchmarks': benchmarks
	}

	return render(request, 'benchmarks/select.html', context)


@login_required
def display(request):
	todays_date = datetime.datetime.today()
	date_string = "{}-{}-{}".format(todays_date.strftime("%Y"), todays_date.strftime("%m"), todays_date.strftime("%d"))

	benchmark_ids = request.POST['selected_benchmark_input'].split(",")
	benchmarks = {}
	workouts_per_benchmark = {}

	for id in benchmark_ids:
		b = Benchmark.objects.get(pk=id)
		benchmarks[b] = b.workout_set.all()
		workouts_per_benchmark[b] = len(benchmarks[b]) * 2

	member_ids = request.POST['selected_member_input'].split(",")
	members = {}

	for id in member_ids:
		m = User.objects.get(pk=id)
		members[m] = []
		for workouts in benchmarks.values():
			for workout in workouts:
				scores_for_workout = m.currentscore_set.filter(workout__id = workout.id)
				try:
					most_recent_score = scores_for_workout[0]
					for score in scores_for_workout:
						if score.date > most_recent_score.date:
							most_recent_score = score
				except IndexError:
					most_recent_score = m.currentscore_set.create(workout_id=workout.id, score = "none", date=date_string)

				members[m].append(most_recent_score)

	context = {
		'benchmarks': benchmarks,
		'workouts_per_benchmark': workouts_per_benchmark,
		'members': members,
		'todays_date': datetime.date.today()
	}

	return render(request, 'benchmarks/display.html', context)


@login_required
def scores_submitted(request):
	todays_date = datetime.datetime.today()
	date_string = "{}-{}-{}".format(todays_date.strftime("%Y"), todays_date.strftime("%m"), todays_date.strftime("%d"))

	for score_id, new_score in request.POST.items():
		if score_id == 'csrfmiddlewaretoken':
			continue
		else:
			most_recent_score = CurrentScore.objects.get(pk=score_id)
			user_id = most_recent_score.user.id
			workout_id = most_recent_score.workout.id


			# determine if the most_recent_score has same date as the new score date (i.e. today)
			# this would only occur if a mistake was detected and being fixed

			# if it is a mistake to fix (i.e. its the same day) - just update the most recent score with the new value
			if most_recent_score.date == todays_date.date():
				most_recent_score.score = new_score
				most_recent_score.save()
			# if it is a new score (i.e. its a different day) - create a new relation / score
			else:
				user = User.objects.get(pk=user_id)
				user.currentscore_set.create(workout_id=workout_id, user_id=user_id, score = new_score, date=date_string)


	return render(request, 'benchmarks/submitted.html')





