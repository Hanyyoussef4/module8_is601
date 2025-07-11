# 🚀 FastAPI Calculator

[![CI/CD](https://github.com/Hanyyoussef4/module8_is601/actions/workflows/test.yml/badge.svg)](https://github.com/Hanyyoussef4/module8_is601/actions/workflows/test.yml)

A robust web-based calculator built with FastAPI, Uvicorn, and Playwright. Includes unit, integration, and end-to-end tests, and is fully Dockerized for easy deployment.

---

## 📦 Table of Contents

* [Links](#links)
* [Features](#features)
* [Screenshots](#screenshots)
* [Getting Started](#getting-started)

  * [Prerequisites](#prerequisites)
  * [Running Locally](#running-locally)
  * [Docker](#docker)
* [Testing](#testing)
* [Directory Structure](#directory-structure)
* [License](#license)

---

## 🔗 Links

* **GitHub Repository**: [Hanyyoussef4/module8\_is601](https://github.com/Hanyyoussef4/module8_is601)
* **Docker Hub Image**: [hany25/module8_is601](https://hub.docker.com/repository/docker/hany25/module8_is601/general)

* **CI Workflow**: [View Test Results](https://github.com/Hanyyoussef4/module8_is601/actions/workflows/test.yml)

---

## ✨ Features

* **FastAPI**: High-performance async API framework.
* **Uvicorn**: Lightning-fast ASGI server.
* **Playwright E2E Tests**: Headless browser automation for full user flows.
* **Unit & Integration Tests**: Pytest-based coverage on operations and endpoints.
* **Health Check**: `/health` endpoint for container orchestration readiness.
* **Dockerized**: Container image ensures consistency across environments.

---

## 📸 Screenshots

All screenshot files are located in the `Screenshots/` directory:

* `GitHub Actions Workflow.png`
  *Shows a successful CI run across build, test, and publish steps.*
* `Application Running in Browser.png`
  *Demonstrates the calculator UI rendered at **`http://localhost:8000`**.*

---

## 🛠️ Getting Started

### Prerequisites

* **Python** >= 3.10
* **Git**
* **(Optional) Docker & Docker Compose**

### Running Locally

```bash
# 1. Clone repo
git clone git@github.com:Hanyyoussef4/module8_is601.git
cd module8_is601

# 2. Create & activate virtual env
python3 -m venv venv
source venv/bin/activate  # Mac/Linux
# venv\Scripts\activate.bat # Windows

# 3. Install Python deps
pip install -r requirements.txt

# 4. Start server
uvicorn main:app --host 0.0.0.0 --port 8000
```

Visit `http://localhost:8000` to use the calculator.

### Docker

```bash
# Build image
docker build -t module8_is601-web .

# Run container
docker run -d -p 8000:8000 module8_is601-web
```

OR via Compose:

```bash
docker-compose up --build -d
```

---

## 🧪 Testing

Activate your virtual environment first:

```bash
source venv/bin/activate
```

**Unit & Integration**

```bash
pytest --maxfail=1 --disable-warnings -q
```

**End-to-End (Playwright)**

```bash
PLAYWRIGHT_HEADLESS=0 pytest tests/e2e
```

Coverage reports are generated under `htmlcov/`.

---

## 📂 Directory Structure

```
module8_is601/
├── app/
│   └── operations/       # Arithmetic logic under test
├── templates/
│   └── index.html        # Frontend UI template
├── tests/
│   ├── unit/             # Unit tests for operations
│   ├── integration/      # API endpoint tests
│   └── e2e/              # Playwright end-to-end tests
├── Dockerfile            # Production container build
├── docker-compose.yml    # Local compose for dev
├── requirements.txt      # Python dependencies
├── test.yml              # GitHub CI workflow
└── Screenshots/          # Submission screenshots
    ├── GitHub Actions Workflow.png
    └── Application Running in Browser.png
```

---
