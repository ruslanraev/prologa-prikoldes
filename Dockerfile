FROM python:3.10

# Установка необходимых системных пакетов
RUN apt update && apt install -y python3-distutils

# Установка рабочей директории
WORKDIR /django_redis_demo

# Копируем проект в контейнер
COPY . .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Выполняем миграции и запускаем сервер через bash-скрипт
CMD ["bash", "-c", "python3 django_redis_demo/manage.py migrate && python3 django_redis_demo/manage.py runserver 0.0.0.0:8000"]

