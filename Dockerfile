# Base image עם Python
FROM python:3.12-slim

# Set working directory inside the container
WORKDIR /app

# העתקת רק requirements.txt ראשון (למניעת rebuild מיותר)
COPY src/app/requirements.txt .

# התקנת תלויות
RUN pip install --no-cache-dir -r requirements.txt

# העתקת כל הקבצים מה-src/app לתוך /app ב-container
COPY src/app/ .

# הגדרת environment variables ל-Flask
ENV FLASK_APP=flaskr
ENV FLASK_ENV=production

# אתחול בסיס הנתונים
RUN flask init-db

# חשיפת פורט
EXPOSE 5000

# הרצת האפליקציה
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

