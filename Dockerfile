FROM python:3.10-slim

#set work directory
WORKDIR /app

#install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#copy project files
COPY . .

#collect static files for Django
RUN python app/manage.py collectstatic --noinput
# expose port
#EXPOSE 8000

#run server
CMD ["gunicorn", "--bind", "0.0.0.0:8000","app.wsgi:application"]
