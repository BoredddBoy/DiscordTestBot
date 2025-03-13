require('dotenv').config();  // بارگذاری متغیرهای محیطی از فایل .env

const { Client, Intents } = require('discord.js');
const client = new Client({ intents: [Intents.FLAGS.GUILDS, Intents.FLAGS.GUILD_MESSAGES] });

client.once('ready', () => {
  console.log('Ready!');
});

client.on('messageCreate', (message) => {
  if (message.content === '!ping') {
    message.channel.send('Pong!');
  }
});

// استفاده از توکن ذخیره شده در GitHub Secrets
client.login(process.env.DISCORD_TOKEN);
