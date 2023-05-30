# Usa una imagen oficial de Python como imagen base
FROM python:3.11

RUN apt-get update

# Establece la variable de entorno para asegurarte de que la salida de Python se envía directamente al terminal sin ser almacenada en el búfer primero.
ENV PYTHONUNBUFFERED 1
# Crea un directorio de trabajo
RUN mkdir /backup
RUN mkdir /backup/data
COPY . /backup

# Establece el directorio de trabajo en /app
WORKDIR /backup

# Instala las dependencias
RUN pip install --upgrade pip && pip install -r requirements.txt

#Arranca el updater
CMD ["python", "main.py"]