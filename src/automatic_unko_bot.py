import discord
import configparser
import os

# スクリプトの位置にいることを保証する
os.chdir(os.path.dirname(os.path.abspath(__file__)))

config_ini = configparser.ConfigParser()
config_ini.read('../config/config.ini', encoding = 'utf-8')
bot_token = config_ini['AUTH']['bot_token']


class AutomaticUnkoBot(discord.Client):
    async def on_ready(self):
        print('Start AutomaticUnkoBot!')

    async def on_message(self, message):
        if message.author.bot:
            return # Do Nothing.

        elif "うんこぶりぶり💩" in message.content:
            return await message.channel.send(content = "ぶりゅ！ぶりゅ！ぶりゅりゅりゅ💩", delete_after = 2)

        elif "💩" in message.content:
            return await message.add_reaction('💩')


unko_bot = AutomaticUnkoBot()
unko_bot.run(bot_token)
