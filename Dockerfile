FROM python@sha256:52b52e675862662635a68af18a6a30bd7d563adc60c97a24b2774f30610fc482

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip \
    && pip install -r requirements.txt

COPY . .

EXPOSE 8501

CMD ["streamlit", "run", "fitness_version.py", "--server.port=8501", "--server.address=0.0.0.0"]

