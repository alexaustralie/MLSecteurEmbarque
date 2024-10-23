from fastapi import FastAPI
import joblib
from pydantic import BaseModel

# Load the trained model
model = joblib.load('regression.joblib')

# Initialize FastAPI
app = FastAPI()

# Define the data model for prediction input
class HouseData(BaseModel):
    size: float
    bedrooms: int
    garden: int

# Define the /predict endpoint
@app.post("/predict")
def predict(data: HouseData):
    input_data = [[data.size, data.bedrooms, data.garden]]
    prediction = model.predict(input_data)
    return {"predicted_price": prediction[0]}
