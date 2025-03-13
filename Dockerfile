# استفاده از Node.js
FROM node:20

# تنظیم پوشه کاری
WORKDIR /app

# کپی فایل‌ها
COPY package*.json ./
COPY bot.js ./
COPY .env ./

# نصب وابستگی‌ها
RUN npm install

# اجرای بات
CMD ["node", "bot.js"]
