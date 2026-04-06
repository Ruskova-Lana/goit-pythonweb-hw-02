# Використовуємо офіційний образ Python 3.10
FROM python:3.10-slim

# Встановлюємо робочу директорію в контейнері
WORKDIR /app

# Встановлюємо системні залежності для роботи з PostgreSQL 
RUN apt-get update && apt-get install -y libpq-dev gcc

# Копіюємо файл залежностей
COPY requirements.txt .

# Встановлюємо залежності Python
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо всі файли проекту в контейнер
COPY . .

# Команда для запуску застосунку 
CMD ["python", "main.py"]