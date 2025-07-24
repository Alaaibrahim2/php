FROM php:8.1-cli

#setting working dir
WORKDIR /app

#install composer 
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#install all project files
COPY . .

#iNSTALL DEPENDENCIES
RUN composer install

#Expose port
EXPOSE 8000

#start php server
CMD [ "php", "-S", "0.0.0.0:8000", "-t", "public" ]
