from django.test import TestCase
from django.urls import reverse
#import datetime
from .models import User
# Create your tests here.


class LoginTests(TestCase):

    def test_if_works(self):
        """
        test if login function does not crash with invalid input.
        """
        response = self.client.post(reverse('login'), {'username': 'u5', 'password': '14241123'})
        self.assertEqual(response.status_code, 200)
        