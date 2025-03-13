local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
	print('Logged in as ' .. client.user.username)
end)

client:on('messageCreate', function(message)
	if message.author.bot then return end

	if message.content == '!سلام' then
		message.channel:send('سلام! چطوری؟ 👋')
	elseif message.content == '!ping' then
		message.channel:send('پنگ! 🏓')
	end
end)

client:run('MTM0OTc0MDI5MjIwNjYyNDc3OA.GzcfCs.M2bXqKC_3TPGaMLaVBXvvWzd4ZICFq3J595qlY')
