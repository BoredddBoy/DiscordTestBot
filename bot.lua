local token = os.getenv("DISCORD_TOKEN")
if not token then
    print("توکن دیسکورد تنظیم نشده!")
    os.exit(1)
end

local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
    print('Logged in as ' .. client.user.username)
end)

client:run('Bot ' .. token)
