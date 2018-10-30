import pymysql
from django.db import connection


# Use cases

# Create account
# Set up Profile
# Add Payment Card
# Login Account
# Transfer Money
# Browse Matches
# Confirm Bet
# Execute Bet
# Add Contact
# Accept Contact Request
# Accept Bet
# Cancel Bet
# Delete Payment Card
# Delete Contact

# DATABASE PULL FUNCTIONS THAT WILL BE NEEDED
# home page
#   Pull matches for each sport: Basketball, RUgby, and Soccer
#       display some number (first 10 or 15?)
#   Balance from User
def get_balance(username):

    return 10.01

# Sign up
#   insert Username, pw, firstname, last name, email address into database
#   deny if insertion fails because username exists
def add_user(username, password, first_name, last_name, bio, email, phone):
    return True

# Login
#   Pull matching username and hashed password and check if passwords match
def verify_user(username, password):

    return True

# Sport Page
#   Pull all matches / markets to display for that sport
#   show balance again (this will be on all pages)
#   functionality of the place bet (basically save the referenced matchID

def get_sport_matches(sportname):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * \
                            FROM Market NATURAL JOIN Game \
                            WHERE sportID = \
                                (SELECT sportID FROM Sport WHERE name = \"{0}\");".format(sportname))
        result = cursor.fetchall()
        return result

# Bet Confirmation Page
#   pull match details to display of the clicked match
#   insert counterparty, stake, profit
#         multiply stake by odds if counterparty is betchya
#         check stake with balance (if they have enough money)

# Account Details
#   Pull matching user's details
# Edit
#   updated the edited values

# Bet History
#    Pull all bets which datetime is in the past and accepted Yes (or result is not NULL) haven't decided
# Pending bets
#    pull all bets which datetime is ahead of now and accepted is Yes
# Show all bets where accepted is No

# Bet Requests
#   Show all bets where accepted is no for the receiving user
#   Update values if accepted for accept button

# Payment Details
#   display all cards which match current user
#   check primary if the primary card id matches the card id in the list

# Transfer Money
#   Do some banking stuff
#   change user balance by some amount

# Add Card
#   insert new card details, don't check if it exists
def add_card(username, card_name, card_no, card_expiry, card_securityID):
    return True
# Contact List
#   pull all contacts where user is either A or B (have to decided if two inserts for each contact?)
#   Pull all contact requests where user is receiving
#   Change request to contact for accept button
