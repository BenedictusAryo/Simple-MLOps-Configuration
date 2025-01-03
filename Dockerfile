ARG PYTHON_VERSION=3.12
FROM python:$PYTHON_VERSION-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app
COPY . /app
# Install litserve and requirements
RUN uv venv
RUN uv pip install -r pyproject.toml --all-extras

RUN uv pip install uvloop
EXPOSE 8000
CMD ["uv", "run", "main.py"]
