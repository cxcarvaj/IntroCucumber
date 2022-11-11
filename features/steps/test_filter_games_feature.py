from behave import *
from src.Game import *
from src.Catalogue import *

#Conditions before starting any STEP
def before_scenario(context, scenario):
	context = {}

@given("a set of games")
def step_impl(context):
	game_list = []

	for row in context.table:

		game = Game(row['NAME'], row['RELEASE DATE'], row['DEVELOPER'], row['RATE'])
		game_list.append(game)

	context.games = game_list


@given('the user enters the study: {developer}')
def step_impl(context, developer):
	context.developer = developer


@when("the user search games by {criteria}")
def step_impl(context, criteria):
	print(f'criteria: {criteria}')
	if(criteria == 'name'):
		result, message = get_game_name(context.games, context.name)
		print(result)
		context.result = result
		context.message = message
	elif(criteria == 'rating' or criteria == 'ratings'):
		result, message, error = get_game_rating(context.games, context.ratings)
		print(result)
		context.result = result
		context.message = message
		context.error = error
	elif(criteria == 'study'):
		result, message = get_game_developer(context.games, context.developer)
		print(result)
		context.result = result
		context.message = message

@then("{total} games will match")
def step_impl(context, total):
	assert len(context.result) == int(total)


@then("the names of these games are")
def step_impl(context):
	expected_games = True
	result_games = []
	for row in context.table:
		result_games.append(row['NAME'])
	for game in context.result:
		if game.name not in result_games:
			print("No game " + game.name)
			expected_games = False
	assert expected_games is True


@then("the following message is displayed: {message}")
def step_impl(context, message):
	print(message)
	print(context.message)
	assert context.message == message