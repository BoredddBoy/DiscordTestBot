# استفاده از Node.js
FROM node:20

# تنظیم پوشه کاری
WORKDIR /app

# کپی فایل‌های package.json و bot.js
COPY package*.json ./
COPY bot.js ./

# نصب وابستگی‌ها
RUN npm install

# اجرای بات (با متغیرهای محیطی که در GitHub Secrets ذخیره شده)
CMD ["node", "bot.js"]
