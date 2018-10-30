from django.db import models

# Create your models here.



class Card(models.Model):
    cardid = models.AutoField( primary_key=True)  # Field name made lowercase.
    username = models.CharField(max_length=50)
    cardname = models.CharField(max_length=100)
    cardnumber = models.CharField( max_length=50)  # Field name made lowercase.
    expirydate = models.DateField()  # Field name made lowercase.
    securitycode = models.IntegerField()  # Field name made lowercase.

'''    class Meta:
        managed = False
        db_table = 'Card'''

class User(models.Model):
    username = models.CharField(primary_key=True, max_length=50)
    password = models.CharField(max_length=100)
    balance = models.FloatField()
    firstname = models.CharField( max_length=50)  # Field name made lowercase.
    lastname = models.CharField( max_length=50)  # Field name made lowercase.
    bio = models.CharField(max_length=500, blank=True, null=True)
    email = models.CharField(max_length=30, blank=True, null=True)
    phone = models.CharField(max_length=20, blank=True, null=True)
    primarycardid = models.ForeignKey(Card, models.DO_NOTHING, )  # Field name made lowercase.
    def __str__(self):
        return self.username
    '''class Meta:
        managed = False
        db_table = 'User'''


class Contact(models.Model):
    usernamea = models.OneToOneField(User, models.DO_NOTHING,  primary_key=True, related_name='username_A')  # Field name made lowercase.
    usernameb = models.ForeignKey(User, models.DO_NOTHING, )  # Field name made lowercase.

    class Meta:
        #managed = False
        #db_table = 'Contact'
        unique_together = (('usernamea', 'usernameb'),)


class Contactrequest(models.Model):
    sendingusername = models.OneToOneField('User', models.DO_NOTHING,  primary_key=True, related_name='sending_username')  # Field name made lowercase.
    receivingusername = models.ForeignKey('User', models.DO_NOTHING, )  # Field name made lowercase.

    class Meta:
        #managed = False
        #db_table = 'ContactRequest'
        unique_together = (('sendingusername', 'receivingusername'),)


class Sport(models.Model):
    sportid = models.AutoField( primary_key=True)  # Field name made lowercase.
    name = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.name
    '''class Meta:
        managed = False
        db_table = 'Sport'''

class Team(models.Model):
    teamid = models.AutoField( primary_key=True)  # Field name made lowercase.
    name = models.CharField(max_length=100, blank=True, null=True)
    sport = models.ForeignKey(Sport, models.DO_NOTHING, )  # Field name made lowercase.
    
    def __str__(self):
        return self.name + ', ' + self.sport.name
    
    #class Meta:
        #managed = False
        #db_table = 'Team'
        #unique_together = (('teamid', 'sport'),)

class Game(models.Model):
    gameid = models.AutoField( primary_key=True)  # Field name made lowercase.
    teama = models.ForeignKey(Team, models.DO_NOTHING,  related_name='team_A')  # Field name made lowercase.
    teamb = models.ForeignKey(Team, models.DO_NOTHING, related_name='team_B')  # Field name made lowercase.
    startdatetime = models.DateTimeField()  # Field name made lowercase.
    location = models.CharField(max_length=100, blank=True, null=True)
    def __str__(self):
        return str(self.teama) + ' vs ' + str(self.teamb)
    '''class Meta:
        managed = False
        db_table = 'Game'''

class Market(models.Model):
    marketid = models.AutoField( primary_key=True)  # Field name made lowercase.
    game = models.ForeignKey(Game, models.DO_NOTHING, )  # Field name made lowercase.
    sport = models.ForeignKey(Sport, models.DO_NOTHING, )  # Field name made lowercase.
    oddsa = models.FloatField()  # Field name made lowercase.
    oddsb = models.FloatField()  # Field name made lowercase.
    def __str__(self):
        return str(self.sport) + ', ' + str(self.game) + ', Marketid: ' + str(self.marketid)
    '''class Meta:
        managed = False
        db_table = 'Market'''


class Bet(models.Model):
    betid = models.AutoField( primary_key=True)  # Field name made lowercase.
    username = models.ForeignKey(User, models.DO_NOTHING, )
    counterparty = models.ForeignKey(User, models.DO_NOTHING,  related_name='counterparty_user')
    market = models.ForeignKey(Market, models.DO_NOTHING, )  # Field name made lowercase.
    team = models.ForeignKey(Team, models.DO_NOTHING, )  # Field name made lowercase.
    stake = models.FloatField()
    accept = models.CharField(max_length=3, blank=True, null=True)
    result = models.CharField(max_length=4, blank=True, null=True)

'''    class Meta:
        managed = False
        db_table = 'Bet'''


