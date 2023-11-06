# Docker-команда FROM вказує базовий образ контейнера
# Наш базовий образ - це Linux з попередньо встановленим python-3.10
FROM python:3.9-slim

# Встановимо змінну середовища
ENV APP_HOME /app

# Встановимо робочу директорію всередині контейнера
WORKDIR $APP_HOME

# Встановимо залежності всередині контейнера
RUN apt-get update && apt-get install -y libtk8.6 x11-apps xvfb

ENV DISPLAY=:99

# Скопіюємо інші файли в робочу директорію контейнера
COPY pyproject.toml poetry.lock ./
COPY . .

# Позначимо порт, де працює застосунок всередині контейнера
#EXPOSE 5000

# Запустимо наш застосунок всередині контейнера
CMD Xvfb :99 -ac -screen 0 1024x768x16 & python ./main.py