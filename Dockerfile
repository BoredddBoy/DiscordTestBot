# Dockerfile
FROM ghcr.io/luvit/luvit:latest

WORKDIR /app
COPY . .

# نصب کتابخانه discordia با استفاده از lit
RUN lit install SinisterRectus/discordia

# اجرای بات
CMD ["luvit", "bot.lua"]
