FROM  alpine:latest
# Install python and pip
RUN apk add --no-cache python3=3.11.5-r0 py3-pip
#RUN apk add --update python3 py3-pip
# Working directory
WORKDIR /var/app
# install Python modules needed by the Python app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
# copy files required for the app to run
EXPOSE 5000
# run the application
CMD ["python", "app.py"]