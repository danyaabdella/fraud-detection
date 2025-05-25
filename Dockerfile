FROM python:3.9-slim

WORKDIR /app

# Copy requirements.txt to the /app directory
COPY requirements.txt /app/

# Install the dependencies from requirements.txt
RUN pip install -r requirements.txt

# Copy the application code and model file to /app
COPY fraud_detector.py /app/
COPY fraud_model_text.joblib /app/

EXPOSE 8000

CMD ["uvicorn", "fraud_detector:app", "--host", "0.0.0.0", "--port", "8000"]
