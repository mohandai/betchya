from django.contrib import admin
from . import models

# Register your models here.
admin.site.register(models.User)
admin.site.register(models.Card)
admin.site.register(models.Game)
admin.site.register(models.Market)
admin.site.register(models.Sport)
admin.site.register(models.Team)
admin.site.register(models.Bet)