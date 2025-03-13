-- bot.lua
local discordia = require('discordia')
local client = discordia.Client()

-- گرفتن توکن از متغیر محیطی
local token = os.getenv("DISCORD_TOKEN")
if not token then
    print("DISCORD_TOKEN not set!")
    os.exit(1)
end


client:on('ready', function()
    print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
    if message.content == '!ping' then
        message.channel:send('Pong!')
    end
end)

client:run('Bot ' .. token)