# Penmanship Improvement App

## unSCRAWL

This repository contains the code for a deep learning-based application for improving penmanship. The app is designed for both teachers and students in schools, and it uses image processing techniques to analyze handwriting and identify any wrongly formed alphabets. Additionally, the app provides insights on handwriting and tracks progress over time.

## Technologies Used
- Python
- Azure Container Instances
- TensorFlow
- Flask API
- OpenCV
- GitHub Workflows for CI/CD

## Features
- Handwriting analysis using image processing techniques
- Identification of wrongly formed alphabets
- Insights on handwriting and progress tracking
- User-friendly interface for teachers and students

## Demo: Videos
### - Student Dashboard: Uploading Handwritten Page

https://github.com/Satyam-79/unScrawl/assets/70771653/a612ad50-9b3a-4555-b51f-ba660008495e

### - Student Dashboard: Exploring Results & Uploaded Pages

https://github.com/Satyam-79/unScrawl/assets/70771653/f323d32d-ba6b-430f-82dd-1cdbfd176007

### - Teacher's Dashboard: Monitoring Student Performance and Rankings

https://github.com/Satyam-79/unScrawl/assets/70771653/66e5eca8-fd2c-46f9-af8c-45a0dfe6f85f


## How to Run
1. Clone the repository to your local machine
```
git clone https://github.com/Satyam-79/unScrawl.git
```
2. Navigate to the project directory
```
cd unScrawl
```
3. Create and activate a virtual environment
```
python -m venv env
source env/bin/activate
```
4. Install the required dependencies
Navigate to the backend directory
```
cd backend
```
```
pip install -r requirements.txt
```
5. Run the app
```
flask run
```
6. Navigate to the frontend directory
    ```
    cd frontend
    ```
    ```
    $ flutter pub get
    $ flutter run
    ```
7. Open your browser and navigate to http://localhost:5000 to check the API is active

## CI/CD
This project uses GitHub Workflows for continuous integration and delivery. The pipeline includes steps for deploying the app to Azure Container Instance.
