import discord
from discord.ext import tasks
from discord.ext import commands

intents = discord.Intents.default()
intents.message_content = True

client = commands.Bot(command_prefix='$', intents=intents)


@tasks.loop(seconds=60*5) # Повторяется каждые 2 секунды
async def my_loop(channel):
    await channel.send('hello')


@client.event
async def on_message(message):
    if message.author == client.user:
        return
    # Мы передаем в функцию myLoop канал, чтобы иметь возможность отправлять сообщения
    if message.content == '$start':
        my_loop.start(message.channel)
bot.run("Токен")
