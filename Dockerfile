FROM php:8.1-cli

# تثبيت المكتبات المطلوبة
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    libzip-dev \
    && docker-php-ext-install zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# نسخ Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# نسخ ملفات المشروع
COPY . .

# تثبيت المكتبات
RUN composer install --no-dev --optimize-autoloader

# تشغيل التطبيق
CMD ["php", "-S", "0.0.0.0:8000", "-t", "."]

EXPOSE 8000
