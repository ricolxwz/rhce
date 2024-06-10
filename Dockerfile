FROM python:alpine
WORKDIR /app
ADD requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
CMD ["mkdocs", "build"]
