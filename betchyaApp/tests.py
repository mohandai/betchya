from django.test import TestCase
from django.urls import reverse
from datetime import datetime
from .models import *
import json
#import django.utils.timezone as timezone
# Create your tests here.

def create_new_user(name,cardno):
	cx = '10/10'
	expiry = cx.split('/')
	expirydate = '20{0}-{1}-01'.format(expiry[1], expiry[0])
	new_card = Card.objects.create(username = name,
									cardname = 'u1',
									cardnumber = cardno,
									expirydate = expirydate,
									securitycode = '111')

	# insert new user
	new_user = User.objects.create(username = name,
									password = '111111',
									balance = 1000.00,
									firstname = 'u1',
									lastname = 'u1',
									bio = 'u1',
									email = 'u1@u1.com',
									phone = '111111111',
									primarycardid = new_card)
	return new_user

class LoginTests(TestCase):

	def setUp(self):
		user = create_new_user('u1','1111111111111111')

	def test_if_GET_works(self):
		"""
		test if login function works.
		"""
		response = self.client.get(reverse('login'))
		self.assertEqual(response.status_code, 200)

	def test_with_invalid_username(self):
		"""
		test if login function does not crash with invalid incorrect username.
		"""
		response = self.client.post(reverse('login'), content_type='application/json', data={'username': 'vlsnfuxbfsf', 'password': '14241123'})
		self.assertEqual(response.status_code, 200)
		self.assertContains(response, "false")

	def test_with_invalid_password(self):
		"""
		test if login function does not crash with invalid incorrect username.
		"""
		response = self.client.post(reverse('login'), content_type='application/json', data={'username': 'u1', 'password': '111112'})
		self.assertEqual(response.status_code, 200)
		self.assertContains(response, "false")

	def test_with_invalid_POST_format(self):
		"""
		test if login function does not crash with invalid incorrect username.
		"""
		response = self.client.post(reverse('login'), content_type='application/json', data={'usernaxxxme': 'u1',})
		self.assertEqual(response.status_code, 200)
		self.assertContains(response, "false")


class RegisterTests(TestCase):

	def setUp(self):
		user = create_new_user('u1','1111111111111111')

	def test_if_GET_works(self):
		"""
		test if login function works.
		"""
		response = self.client.get(reverse('register'))
		self.assertEqual(response.status_code, 200)

	def test_with_invalid_username(self):
		"""
		test if function does not crash with invalid incorrect username.
		"""
		#user = create_new_user('u1','1111111111111111')
		input = {
		'username': 'u1', 
		'password': '111111',
		'password2':'111111',
		'firstname':'u1',
		'lastname':'u1',
		'email':'u1@u1.com',
		'phone':'111111111',
		'bio':'u1',
		'cardno':'1111111111111111',
		'cardname':'u1',
		'cardexpiry':'10/10',
		'cardccv':'111',
		}
		response = self.client.post(reverse('register'), content_type='application/json', data=input)
		self.assertEqual(response.status_code, 200)
		self.assertContains(response, "username")

	def test_with_invalid_password(self):
		"""
		test if function does not crash with invalid incorrect username.
		""" 
		input = {
		'username': 'u2', 
		'password': '111111',
		'password2':'1fawesx111',
		'firstname':'u1',
		'lastname':'u1',
		'email':'u1@u1.com',
		'phone':'111111111',
		'bio':'u1',
		'cardno':'1111111111111111',
		'cardname':'u1',
		'cardexpiry':'10/10',
		'cardccv':'111',
		}

		response = self.client.post(reverse('register'), content_type='application/json', data=input)
		self.assertEqual(response.status_code, 200)
		self.assertContains(response, "password")

	def test_with_invalid_POST_format(self):
		"""
		test if function does not crash with invalid incorrect username.
		"""
		response = self.client.post(reverse('register'), content_type='application/json', data={'sd':''})
		self.assertEqual(response.status_code, 200)
		self.assertContains(response, "format")

class EditDetailTests(TestCase):

	def test_if_GET_works(self):
		"""
		test if GET function works.
		"""
		response = self.client.get(reverse('edit_detail'))
		self.assertEqual(response.status_code, 200)

	def test_with_invalid_POST_format(self):
		"""
		test if POST function works with invalid input.
		"""
		user = create_new_user('u2','1111111111111112')
		response = self.client.post(reverse('edit_detail'), {
			'first_name':'u2',
			'laname':'u2',
			'emailcv':'u2@u1.com',
			'phone':'',
			'bio':'u1',
			})
		self.assertEqual(response.status_code, 200)

class BetPageTests(TestCase):
	def setUp(self):
			basketball = Sport.objects.create(name = 'Basketball',)
			soccer = Sport.objects.create(name = 'Soccer',)
			football = Sport.objects.create(name = 'Football',)


	def test_if_basketball_GET_works(self):
		"""
		test if GET function works.
		"""
		response = self.client.get(reverse('basketball'))
		self.assertEqual(response.status_code, 200)

	def test_basketball_with_invalid_POST_format(self):
		"""
		test if POST function works with invalid input.
		"""
		response = self.client.post(reverse('basketball'), {
			'first_name':'u2',
			'c':'u2',
			'xxc':'u2@u1.com',
			'gdaga':'',
			'bicvo':'u1',
			})
		self.assertEqual(response.status_code, 302)


	def test_if_football_GET_works(self):
		"""
		test if GET function works.
		"""
		response = self.client.get(reverse('football'))
		self.assertEqual(response.status_code, 200)

	def test_football_with_invalid_POST_format(self):
		"""
		test if POST function works with invalid input.
		"""
		response = self.client.post(reverse('football'), {
			'first_name':'u2',
			'c':'u2',
			'xxc':'u2@u1.com',
			'gdaga':'',
			'bicvo':'u1',
			})
		self.assertEqual(response.status_code, 302)

	def test_if_soccer_GET_works(self):
		"""
		test if GET function works.
		"""
		response = self.client.get(reverse('soccer'))
		self.assertEqual(response.status_code, 200)

	def test_soccer_with_invalid_POST_format(self):
		"""
		test if POST function works with invalid input.
		"""
		response = self.client.post(reverse('soccer'), {
			'first_name':'u2',
			'c':'u2',
			'xxc':'u2@u1.com',
			'gdaga':'',
			'bicvo':'u1',
			})
		self.assertEqual(response.status_code, 302)

class ConfirmBetTests(TestCase):
	#
	def test_if_GET_works(self):
		"""
		test if GET function works.
		"""
		soccer = Sport.objects.create(name = 'Soccer',)
		ta = Team.objects.create(name = 'Milan', sport = soccer)
		tb = Team.objects.create(name = 'Lazio', sport = soccer)
		game = Game.objects.create(teama = ta, teamb = tb, startdatetime = datetime.now(), location = 'Italy')
		market = Market.objects.create(game = game, sport = soccer, oddsa = 1.6, oddsb = 4.5)
		session = self.client.session
		session['confirm_bet_marketid'] = market.marketid
		session.save()

		response = self.client.get(reverse('confirm_bet'))
		self.assertEqual(response.status_code, 200)

class PendingBetTests(TestCase):
	def setUp(self):
		user = create_new_user('pendingbet', '1111111111111111')
		bc = create_new_user('bc', '1111111111111111')
		soccer = Sport.objects.create(name = 'Soccer',)
		ta = Team.objects.create(name = 'Milan', sport = soccer)
		tb = Team.objects.create(name = 'Lazio', sport = soccer)
		game = Game.objects.create(teama = ta, teamb = tb, startdatetime = datetime.now(), location = 'Italy')
		market = Market.objects.create(game = game, sport = soccer, oddsa = 1.6, oddsb = 4.5)
		bet = Bet.objects.create(username = user, counterparty = bc, market = market, team = ta, stake = 30, accept = 'Yes', result = None)
		session = self.client.session
		session['username'] = 'pendingbet'
		session['betid'] = bet.betid
		session['username'] = user.username
		session['balance'] = user.balance

		#session['username'] = 'pendingbet'
		session.save()

	def test_if_GET_works(self):
		"""
		test if GET function works.
		"""

		response = self.client.get(reverse('pending_bet'))
		self.assertEqual(response.status_code, 200)

	def test_if_POST_works(self):
		"""
		test if GET function works.
		"""
		session = self.client.session
		response = self.client.post(reverse('pending_bet'), {'cancel':session['betid']})
		self.assertEqual(response.status_code, 302)
