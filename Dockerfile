# Use the official python base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt first (for caching)
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the FastAPI code and the regression model
COPY model_app2.py .
COPY regression.joblib .

# Expose the port that FastAPI will run on
EXPOSE 6789

# Command to run the FastAPI server
CMD ["uvicorn", "model_app2:app", "--host", "0.0.0.0", "--port", "6789"]
