FROM python:3.12

RUN mkdir project
WORKDIR /project/

RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --upgrade pip poetry

RUN poetry config virtualenvs.create false

COPY pyproject.toml /project/pyproject.toml
COPY poetry.lock /project/poetry.lock
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=cache,target=/root/.cache/pypoetry \
    poetry install --no-root

COPY . /project/
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=cache,target=/root/.cache/pypoetry \
    poetry install