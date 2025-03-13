# از ایمیج رسمی Lua استفاده می‌کنیم
FROM lua:5.4

# نصب لایبرری discordia
RUN apt-get update && \
    apt-get install -y git && \
    git clone https://github.com/SinisterRectus/Discordia.git /discordia && \
    cd /discordia && \
    luarocks make

# تنظیم دایرکتوری کاری
WORKDIR /app

# نصب Luvit (برای اجرای بات)
RUN apt-get install -y curl && \
    curl -s https://luvit.io/install.sh | bash

# کپی کردن فایل‌های پروژه به کانتینر
COPY . /app

# نصب پکیج‌های مورد نیاز از luarocks
RUN luarocks install discordia

# دستور برای اجرا کردن بات
CMD ["luvit", "bot.lua"]
