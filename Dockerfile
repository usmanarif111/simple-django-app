#Base Image
#FROM python:3.7

#Working Directory
#WORKDIR /app

#Copy Code
#COPY . /app

#libraries Installed
#RUN pip install -r requirements.txt

# migration

#RUN pyhton cool_counters/manage.py migrate

# RUN App

#CMD ["python","cool_counters/manage.py","runserver", "0.0.0.0:8000"]


# Base Image
FROM python:3.7

# Working Directory
WORKDIR /app

# Copy requirements.txt first to leverage Docker cache and speed up builds
COPY requiremnts.txt /app

# Install the dependencies/libraries
RUN pip install -r requiremnts.txt

# Copy the rest of the code
COPY . /app

# Run migration (note: corrected typo from "pyhton" to "python")
RUN python cool_counters/manage.py migrate

# Run the application
CMD ["python", "cool_counters/manage.py", "runserver", "0.0.0.0:8000"]



