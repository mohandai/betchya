# Generated by Django 2.1.1 on 2018-10-30 08:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Bet',
            fields=[
                ('betid', models.AutoField(primary_key=True, serialize=False)),
                ('stake', models.FloatField()),
                ('accept', models.CharField(blank=True, max_length=3, null=True)),
                ('result', models.CharField(blank=True, max_length=4, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Card',
            fields=[
                ('cardid', models.AutoField(primary_key=True, serialize=False)),
                ('username', models.CharField(max_length=50)),
                ('cardname', models.CharField(max_length=100)),
                ('cardnumber', models.CharField(max_length=50)),
                ('expirydate', models.DateField()),
                ('securitycode', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Game',
            fields=[
                ('gameid', models.AutoField(primary_key=True, serialize=False)),
                ('startdatetime', models.DateTimeField()),
                ('location', models.CharField(blank=True, max_length=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Market',
            fields=[
                ('marketid', models.AutoField(primary_key=True, serialize=False)),
                ('oddsa', models.FloatField()),
                ('oddsb', models.FloatField()),
                ('game', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='betchyaApp.Game')),
            ],
        ),
        migrations.CreateModel(
            name='Sport',
            fields=[
                ('sportid', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, max_length=50, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Team',
            fields=[
                ('teamid', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, max_length=100, null=True)),
                ('sport', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='betchyaApp.Sport')),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('username', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('password', models.CharField(max_length=100)),
                ('balance', models.FloatField()),
                ('firstname', models.CharField(max_length=50)),
                ('lastname', models.CharField(max_length=50)),
                ('bio', models.CharField(blank=True, max_length=500, null=True)),
                ('email', models.CharField(blank=True, max_length=30, null=True)),
                ('phone', models.CharField(blank=True, max_length=20, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Contact',
            fields=[
                ('usernamea', models.OneToOneField(on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, related_name='username_A', serialize=False, to='betchyaApp.User')),
            ],
        ),
        migrations.CreateModel(
            name='Contactrequest',
            fields=[
                ('sendingusername', models.OneToOneField(on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, related_name='sending_username', serialize=False, to='betchyaApp.User')),
            ],
        ),
        migrations.AddField(
            model_name='user',
            name='primarycardid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='betchyaApp.Card'),
        ),
        migrations.AddField(
            model_name='market',
            name='sport',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='betchyaApp.Sport'),
        ),
        migrations.AddField(
            model_name='game',
            name='teama',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='team_A', to='betchyaApp.Team'),
        ),
        migrations.AddField(
            model_name='game',
            name='teamb',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='betchyaApp.Team'),
        ),
        migrations.AddField(
            model_name='bet',
            name='counterparty',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='counterparty_user', to='betchyaApp.User'),
        ),
        migrations.AddField(
            model_name='bet',
            name='market',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='betchyaApp.Market'),
        ),
        migrations.AddField(
            model_name='bet',
            name='team',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='betchyaApp.Team'),
        ),
        migrations.AddField(
            model_name='bet',
            name='username',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='betchyaApp.User'),
        ),
        migrations.AlterUniqueTogether(
            name='team',
            unique_together={('teamid', 'sport')},
        ),
        migrations.AddField(
            model_name='contactrequest',
            name='receivingusername',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='betchyaApp.User'),
        ),
        migrations.AddField(
            model_name='contact',
            name='usernameb',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='betchyaApp.User'),
        ),
        migrations.AlterUniqueTogether(
            name='contactrequest',
            unique_together={('sendingusername', 'receivingusername')},
        ),
        migrations.AlterUniqueTogether(
            name='contact',
            unique_together={('usernamea', 'usernameb')},
        ),
    ]