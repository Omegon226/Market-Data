FROM python:3.11

# Установка JupyterLab и необходимых пакетов
RUN pip install --upgrade pip
RUN pip install jupyterlab

# Копирование requirements.txt в контейнер
COPY requirements.txt /tmp/

# Установка зависимостей из requirements.txt
RUN pip install -r /tmp/requirements.txt

# Создание рабочей директории
WORKDIR /home/jovyan/work

# Запуск JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]