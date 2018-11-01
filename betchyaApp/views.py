from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.hashers import make_password, check_password
from .models import *
from .controller import *
import json

import logging

# logger to print to console for debugging purposes
logger = logging.getLogger('debug logger')
logger.setLevel(logging.INFO)
fh = logging.FileHandler('stdout.log')
fh.setLevel(logging.INFO)
ch = logging.StreamHandler()
ch.setLevel(logging.INFO)
logger.addHandler(fh)
logger.addHandler(ch)

#------------- user administration views ----------
def login(request):
	try:
		if request.session['is_login'] == True:
			return redirect('/')
	except:
		pass

	response_data = {'email_found':'false', 'password_matched':'false'}

	if request.method == "POST":
		#response_data = {'username_found':'false', 'password_matched':'false'}
		try:
			print('printing sxxxxxxxxxxxxfjawe;fxxxxxx')
			print(request.body)
			data = json.loads(request.body)
			
			#response_data['json'] = str(data)
			username = data['username']
			password = data['password']
		except:

			response_data['message'] = 'cannot get json data!'
			
			return JsonResponse(response_data)

		try:
			# retrieve matching user
			user = User.objects.get(username=username)

			# verify that the password matches the matching username
			# save necessary data to session: username and user balance
			if check_password(password, user.password):
				request.session['is_login'] = True
				request.session['username'] = user.username
				request.session['balance'] = user.balance
				response_data['password_matched'] = 'true'
				response_data['email_found'] = 'true'
				return JsonResponse(response_data)
				#return redirect('/')

			# passwords don't match
			else:
				return JsonResponse(response_data)
				#return render(request, 'betchyaApp/login.html', {'error_message':'Incorrect Password. Please Try Again.'})

		# user doesn't exist
		except:
			response_data['email_found'] = 'true'
			return JsonResponse(response_data)
			#return render(request, 'betchyaApp/login.html', {'error_message':'Invalid Username. Please Try Again.'})

	return render(request, 'betchyaApp/login.html')


def register(request):
	try:
		if request.session['is_login'] == True:
			return redirect('/')
	except:
		pass

	if request.method == "POST":
		response_data = {'register_result':'false', 'error_message':'Registration failed'}
		
		try:
			data = json.loads(request.body)

			username = data['username']
			password = data['password']
			password_reentered = data['password2']
			#data['']

			# check if passwords match
			if password != password_reentered:
				response_data['error_message'] = 'The re-entered password does not match. Please try again.'
				#response_data['error_message'] = ''
				return JsonResponse(response_data)
				#return render(request, 'betchyaApp/register.html', {'error_message':'The re-entered password does not match. Please try again.'})

			# check if username already exists
			existing_user = User.objects.filter(username=username)
			if existing_user:
				response_data['error_message'] = 'This username is already taken. Please choose another username.'
				return JsonResponse(response_data)
				#return render(request, 'betchyaApp/register.html', {'error_message':'This username is already taken. Please choose another username.'})

			# format expiry as Date on the first of the month
			ex = data['cardexpiry']
			expiry = ex.split('/')
			expirydate = '20{0}-{1}-01'.format(expiry[1], expiry[0])
			
			# insert new card
			new_card = Card.objects.create(username = username,
											cardname = data['cardname'],
											cardnumber = data['cardno'],
											expirydate = expirydate,
											securitycode = data['cardccv'])

			# insert new user
			new_user = User.objects.create(username = username,
											password = make_password(password),
											balance = 0.00,
											firstname = data['firstname'],
											lastname = data['lastname'],
											bio = data['bio'],
											email = data['email'],
											phone = data['phone'],
											primarycardid = new_card)

			# redirect to login to allow user to login to new account
			response_data['register_result'] = 'true'
			response_data['error_message'] = ''
			return JsonResponse(response_data)
			#return redirect('/login')
		except:
			response_data['error_message'] = 'Registration failed! Incorrect input format'
			return JsonResponse(response_data)
			
	return render(request, 'betchyaApp/register.html')

def logout(request):
	if not request.session.get('is_login', None):
		return redirect('/')
	request.session.flush()
	return redirect('/')


#------------- features views ---------------

def home(request):
	return render(request, 'betchyaApp/home.html')

def get_game_id(name):
	return 0

def basketball(request):

	if request.method == "GET":
		to_display = retrieve_games('Basketball')
		return render(request, 'betchyaApp/basketball.html', {'dictionary' : to_display})
		# come back and figure out how to sort in terms of startDatetime
		# Also figure out how to only show those that haven't taken place

	if request.method == "POST":
		try:
			# save the chosen market id to the session for access in confirm_bet()
			marketid = request.POST.get("submitbtn")
			request.session['confirm_bet_marketid'] = marketid
			# reroute to confirm_bet now that a place bet has been made
		except:
			redirect("/basketball")
		return redirect("/confirm_bet")

def soccer(request):
	if request.method == "GET":
		to_display = retrieve_games('Soccer')
		return render(request, 'betchyaApp/soccer.html', {'dictionary' : to_display})
		# come back and figure out how to sort in terms of startDatetime
		# Also figure out how to only show those that haven't taken place

	if request.method == "POST":
		# save the chosen market id to the session for access in confirm_bet()
		marketid = request.POST.get("submitbtn")
		request.session['confirm_bet_marketid'] = marketid
		# reroute to confirm_bet now that a place bet has been made
		return redirect("/confirm_bet")

def football(request):
	if request.method == "GET":
		to_display = retrieve_games('Football')
		return render(request, 'betchyaApp/football.html', {'dictionary' : to_display})
		# come back and figure out how to sort in terms of startDatetime
		# Also figure out how to only show those that haven't taken place

	if request.method == "POST":
		# save the chosen market id to the session for access in confirm_bet()
		marketid = request.POST.get("submitbtn")
		request.session['confirm_bet_marketid'] = marketid
		# reroute to confirm_bet now that a place bet has been made
		return redirect("/confirm_bet")

def retrieve_games(sport):
	to_display = []
	sp = Sport.objects.get(name=sport)
	result = Market.objects.filter(sport=sp)
	for r in result:

		#r = result[i]
		# the data model was originally designed to allow multiple markets for one game
		# as a result, there is not a good data model to present games as desired
		# therefore, need to make own dict as below to pass through render context
		g = r.game
		entry = {}
		entry['teamA'] = g.teama.name
		entry['oddsA'] = r.oddsa
		entry['teamB'] = g.teamb.name
		entry['oddsB'] = r.oddsb
		entry['start_datetime'] = g.startdatetime.strftime('%d/%m/%Y %H:%M')
		entry['country_code'] = g.location
		entry['market_id'] = r.marketid
		print(entry)
		# put in the dict
		to_display.append(entry)
	return to_display

def get_betslip_data(request):

	# get the chosen market for the bet confirmation
	marketid = request.session['confirm_bet_marketid']
	if not marketid:
		logger.info("failed to save market id!!!: {0}".format(marketid))

	# get the information to display on bet slip
	market = Market.objects.get(marketid=marketid)
	game = market.game

	# context dictionary for confirmation bet slip
	to_display = {}
	to_display["marketID"] = marketid
	to_display["teamA"] = game.teama.name
	to_display["teamB"] = game.teamb.name
	to_display["oddsA"] = market.oddsa
	to_display["oddsB"] = market.oddsb

	return to_display


def confirm_bet(request):
	try:
		to_display = get_betslip_data(request)
	except:
		pass
	# On first display
	#if request.method == "GET":
		#print(to_display)

		# TODO
		# Need to come back and list contacts

		#return render(request, 'betchyaApp/confirm_bet.html', {"dictionary": to_display})

	# When submit is pressed
	if request.method == "POST":
		try:

			#to_display = get_betslip_data(request)

			#  TODO
			# Need to come back and list contacts to bet against (if time)

			# Bet model
			# betid, username, counterparty, marketid, teamid, stake, accept, result
			# accept: Yes, No
			# result: Win, Loss, NULL
			user = User.objects.get(username=request.session['username'])
			market = Market.objects.get(marketid=to_display['marketID'])
			teamname = to_display[request.POST.get("team")]
			team = Team.objects.get(name=teamname)
			counterparty = User.objects.get(username=request.POST.get("counterparty"))
			stake = float(request.POST.get("stake"))
			accept = 'No'
			result = None

			# does not require acceptance as the bet is against the house
			if counterparty.username == 'Betchya':
				accept = 'Yes'

			# ensure balance is valid to place bet
			if request.session['balance'] < stake:
				return render(request, 'betchyaApp/confirm_bet.html',
										{"dictionary": to_display,
										"error_message":"Invalid funds to place bet. Please reduce stake or transfer funds."})

			new_balance = request.session['balance'] - stake
			User.objects.filter(username=request.session['username']).update(balance=new_balance)

			request.session['balance'] = User.objects.get(username=request.session['username']).balance


			new_bet = Bet.objects.create(username=user,
											counterparty=counterparty,
											market=market,
											team=team,
											stake=stake,
											accept=accept,
											result=result)


			return redirect('/pending_bet')
		except:
			render(request, 'betchyaApp/confirm_bet.html', {"dictionary": to_display})
	return render(request, 'betchyaApp/confirm_bet.html', {"dictionary": to_display})


def bet_history(request):
	return render(request, 'betchyaApp/bet_history.html')


def bet_requests(request):
	return render(request, 'betchyaApp/bet_requests.html')


def add_card(request):

	if request.method == "POST":

		card_no = request.POST.get('card_no')
		# check if card with this number and username has been added already
		if Card.objects.filter(username=request.session['username']).filter(cardnumber=card_no):
			return render(request, 'betchyaApp/add_card.html', {"error_message":"This card has already been added. Please add a new card."})

		# format expiry as Date on the first of the month
		expiry = request.POST.get('card_expiry').split('/')
		expirydate = '20{0}-{1}-01'.format(expiry[1], expiry[0])

		# insert new card
		new_card = Card.objects.create(username = request.session['username'],
										cardname = request.POST.get('card_name'),
										cardnumber = card_no,
										expirydate = expirydate,
										securitycode = request.POST.get('card_securityID'))

		# redirect to where the new card details can be viewed
		return redirect('/payment_detail')

	return render(request, 'betchyaApp/add_card.html')


def edit_detail(request):
	try:

		if request.method == "POST":

			firstname = request.POST.get('first_name')
			lastname = request.POST.get('last_name')
			phone = request.POST.get('phone')
			email = request.POST.get('email')
			bio = request.POST.get('bio')

			username = request.session['username']
			current = User.objects.filter(username=request.session['username'])
			current.update(firstname=firstname)
			current.update(lastname=lastname)
			current.update(phone=phone)
			current.update(email=email)
			current.update(bio=bio)
			return redirect('/my_account')
	except:
		pass
	return render(request, 'betchyaApp/edit_detail.html')


def my_account(request):

	if request.method == "GET":

		user = User.objects.get(username=request.session['username'])

		return render(request, 'betchyaApp/my_account.html', {"dictionary":user})

	return render(request, 'betchyaApp/my_account.html', {"error_message":"ERROR: Account details could not be found."})


def pending_bet(request):

	if request.method == "POST":
		try:

			betid = request.POST.get('cancel')
			b = Bet.objects.get(betid=betid)

			# add back balance
			new_balance = request.session['balance'] + b.stake
			User.objects.filter(username=request.session['username']).update(balance=new_balance)
			request.session['balance'] = User.objects.get(username=request.session['username']).balance

			# delete bet
			Bet.objects.filter(betid=betid).delete()
		except:
			pass
		return redirect('/pending_bet')

	if request.method == "GET":
		logger.info("boohoo")

		username = request.session['username']
		# startDate, Sport, Match, bet to win, Bet

		to_format = []

		for bet in Bet.objects.filter(username = username):

			entry = {}
			entry['startDate'] = bet.market.game.startdatetime
			entry['sport'] = bet.team.sport.name #Sport.objects.get(sportid=bet.marketid.sportid).name
			entry['match_teams'] = bet.market.game.teama.name + " vs " + bet.market.game.teamb.name
			entry['to_win'] = bet.team.name
			entry['counterparty'] = bet.counterparty.username
			entry['stake'] = bet.stake
			entry['betid'] = bet.betid

			#to_format[bet.betid] = entry
			to_format.append(entry)


		return render(request, 'betchyaApp/pending_bet.html', {"dictionary":to_format})

	return render(request, 'betchyaApp/pending_bet.html')


def payment_detail(request):

	if request.method == "GET":

		# retrieve current primary card to display in table via radio
		primarycardid = User.objects.get(username=request.session['username']).primarycardid

		# retrieve all cards owned by user to display
		card_query = Card.objects.filter(username=request.session['username'])

		return render(request, 'betchyaApp/payment_details.html', {"dictionary":{"card_query":card_query, "user":primarycardid}})

	if request.method == "POST":

		# retrieve the changed radio value and update the user primarycarid
		new_primarycardid = request.POST.get('primary_card_id')
		User.objects.filter(username=request.session['username']).update(primarycardid=new_primarycardid)

		return redirect('/payment_detail')

	return render(request, 'betchyaApp/payment_details.html')

def transfer_money(request):

	if request.method == "POST":

		if request.session['is_login']:

			action = int(request.POST.get('action'))
			amount = float(request.POST.get('amount'))

			logger.info([action, amount])

			user = User.objects.get(username=request.session['username'])

			# TODO
			# Implement banking package to use card to withdraw funds
			# fake it for now

			new_balance = (user.balance + (amount * action))

			if new_balance < 0:
				return render(request, 'betchyaApp/transfer_money.html', {"error_message":"You do not have valid funds to withdraw that amount."})

			else:

				User.objects.filter(username=request.session['username']).update(balance=new_balance)

				request.session['balance'] = User.objects.get(username=request.session['username']).balance
				# TODO
				# come back later to ensure 2 decimal places
				# Find out how to refresh base.html upon session changes (balance does not update)

			return redirect('/my_account')

		else:
			return render(request, 'betchyaApp/transfer_money.html', {"error_message":"You must login before you transfer money."})


	return render(request, 'betchyaApp/transfer_money.html')


def api_matches(request, sport):
	response_data = {
	'status':'success',
	'data':'',
	'message':'success retrieving games'
	}

	try:
		matches = retrieve_games(sport)
		for m in matches:
			del m['market_id']
		response_data['data'] = matches

	except:
		response_data['status'] = 'failed'
		response_data['message'] = 'cannot get matches information'
		JsonResponse(response_data)

	return JsonResponse(response_data)











