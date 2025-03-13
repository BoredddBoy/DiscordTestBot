import os
import discord

intents = discord.Intents.default()
client = discord.Client(intents=intents)

@client.event
async def on_ready():
    print(f'We have logged in as {client.user}')

@client.event
async def on_message(message):
    if message.content.startswith('$hello'):
        await message.channel.send('Hello!')

# استفاده از توکن ذخیره شده در GitHub Secrets
client.run(os.getenv('DISCORD_TOKEN'))
