# AEGIS-SAFE: Industrial Worker Safety & Real-Time Error Prediction System

[![Python](https://img.shields.io/badge/Python-3.11+-blue.svg)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.115+-009688.svg)](https://fastapi.tiangolo.com/)
[![React](https://img.shields.io/badge/React-19.0+-61DAFB.svg)](https://react.dev/)
[![Tailwind CSS](https://img.shields.io/badge/TailwindCSS-4.0+-38B2AC.svg)](https://tailwindcss.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> **Autonomous Pre-Shift Readiness, Lead II ECG Telemetry & Fatigue Prevention for High-Hazard Industrial Operators.**  
> Engineered for heavy manufacturing, robotic cells, stamping presses, and energy plants to intercept operator lapses *before* machinery engagement.

---

## 📌 Key System Features

1. **4-Stage Neurocognitive Pre-Shift Battery**:
   - **Concentration (Go / No-Go)**: Evaluates motor inhibition and sustained vigilance across 22 rapid trials.
   - **Reaction Speed (≤800ms Benchmark)**: Real-time psychomotor speed test with per-click Pass/Fail grading and average latency tracking.
   - **Error Detection ("Spot the Change")**: 8 rounds evaluating visual vigilance across industrial telemetry gauges (Temperature, Pressure, RPM, Vibration).
   - **Spatial Working Memory ("Number Recall")**: Sequence recall test measuring working memory under cognitive load.

2. **Lead II ECG & HRV Biosignal Processing (Python)**:
   - Pan-Tompkins QRS bandpass filtering and R-peak detection.
   - Computes RMSSD, SDNN, Heart Rate (BPM), and LF/HF autonomic balance.
   - High vs. Low Cardiac Strain classification with automatic clinical summary generation.
   - Supports clinical 12-lead PDF diagnostic reports, CSV voltage streams (250 Hz), and raw text logs.

3. **Decoupled Architecture & Operator Experience**:
   - Dynamic time-of-day greeting (*Good morning / afternoon / evening*).
   - Minimalist Runway-inspired entry portal.
   - Dedicated Operator Command Dashboard (Shift clearance tokens, weekly progression matrix, and chronological audit logs).

4. **Zero-Setup Offline Distribution**:
   - `local_app.html`: Completely self-contained single-file application requiring no server or internet connection.

---

## 🏗️ Repository Structure

```text
worker-safety-system/
├── backend/                        # Python FastAPI Backend
│   ├── app/
│   │   ├── main.py                 # FastAPI application root & middleware
│   │   ├── models.py               # SQLite database schemas (SQLAlchemy)
│   │   ├── schemas.py              # Pydantic validation models
│   │   ├── signal_processing.py    # Pan-Tompkins ECG & HRV algorithms
│   │   ├── baseline_engine.py      # Operator cognitive baseline calculation
│   │   ├── risk_classifier.py      # Multi-modal risk fusion engine
│   │   ├── auth.py                 # JWT token security & role verification
│   │   ├── seed_data.py            # Initial benchmark test data
│   │   └── routers/                # REST API endpoints
│   │       ├── auth_router.py
│   │       ├── session_router.py   # Pre-shift 4-test logging
│   │       ├── signal_router.py    # ECG file upload (PDF/CSV)
│   │       ├── worker_router.py
│   │       └── supervisor_router.py
│   ├── tests/                      # Automated pytest unit test suite
│   ├── requirements.txt            # Python dependencies
│   └── safety_system.db            # SQLite database
├── frontend/                       # React + Vite + Tailwind Frontend
│   ├── src/
│   │   ├── pages/
│   │   │   ├── GetStarted.jsx      # Standalone landing entry page
│   │   │   ├── WorkerDashboard.jsx # Operator dashboard
│   │   │   ├── PreShiftCheck.jsx   # 4-stage readiness battery
│   │   │   ├── ECGTelemetry.jsx    # ECG upload & autonomic report
│   │   │   └── HistorySection.jsx  # Separated chronological logs
│   │   ├── components/
│   │   │   └── Navbar.jsx          # Internal application navigation
│   │   ├── App.jsx
│   │   └── main.jsx
│   ├── package.json
│   └── vite.config.js
├── local_app.html                  # Standalone offline browser edition
├── requirements.txt                # Root Python dependencies
└── README.md                       # Project documentation
```

---

## 🚀 Quickstart Guide

### 1. Python Backend Setup

```bash
# Clone the repository
git clone https://github.com/your-username/worker-safety-system.git
cd worker-safety-system/backend

# Create virtual environment
python -m venv .venv

# Activate virtual environment
# Windows:
.venv\Scripts\activate
# Linux/macOS:
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run the FastAPI server
uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
```

The interactive API documentation is available at `http://127.0.0.1:8000/docs`.

### 2. Frontend Setup

```bash
cd ../frontend

# Install dependencies
npm install

# Start Vite development server
npm run dev
```

Open `http://localhost:5173` in your browser.

### 3. Run Backend Unit Tests

```bash
cd backend
pytest tests/ -v
```

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
