import discord
import configparser

config_ini = configparser.ConfigParser()
config_ini.read('config.ini', encoding = 'utf-8')
bot_token = config_ini['AUTH']['bot_token']


class AutomaticUnkoBot(discord.Client):
    async def on_ready(self):
        print('Start AutomaticUnkoBot!')

    async def on_message(self, message):
        print('Add 💩 !! HAHA!!!')
        await message.add_reaction('💩')

unko_bot = AutomaticUnkoBot()
unko_bot.run(bot_token)
