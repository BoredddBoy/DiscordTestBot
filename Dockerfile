FROM ubuntu:20.04

# نصب وابستگی‌های لازم
RUN apt-get update && apt-get install -y curl git

# دانلود و نصب Luvit (با اضافه کردن هدر User-Agent برای جلوگیری از ارور 403)
RUN curl -L -H "User-Agent: Mozilla/5.0" "https://github.com/luvit/luvit/releases/latest/download/luvit-linux" -o /usr/local/bin/luvit \
    && chmod +x /usr/local/bin/luvit


# نصب lit (مدیر بسته‌های Luvit)
RUN curl -L https://raw.githubusercontent.com/luvit/lit/master/get-lit.sh | bash \
    && mv lit /usr/local/bin/lit


# تنظیم پوشه کاری داخل کانتینر
WORKDIR /app

# کپی کردن کد پروژه به کانتینر
COPY . .

# نصب کتابخانه discordia
RUN lit install SinisterRectus/discordia

# اجرای بات (فایل bot.lua باید در ریشه پروژه باشد)
CMD ["luvit", "bot.lua"]
