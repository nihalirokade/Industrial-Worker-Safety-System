# AEGIS-SAFE: Mobile Application Setup & Deployment Guide

This guide details how to run, test, and deploy the **AEGIS-SAFE Industrial Worker Safety System** as a mobile app.

---

## 1. Quick Launch Options

We have provided multiple ready-to-run mobile setups:

### Option A: 1-Click Interactive Mobile Launcher (Recommended)
Double-click `start_mobile_app.bat` in the root folder. You will be prompted to choose:
1. **Expo Mobile App (React Native)**: Runs the native mobile app and shows a QR code for your iPhone or Android phone.
2. **Mobile Device Simulator**: Opens a realistic phone simulator (iPhone 16 Pro / Pixel / Galaxy) directly in your browser.
3. **Full Mobile System**: Starts the backend on `0.0.0.0:8000` and serves the mobile web client over your Wi-Fi LAN.

---

## 2. Running on Your Physical Phone (Instant, Zero Install)

1. Make sure your phone is connected to the same Wi-Fi network as this PC.
2. Ensure the system is running (`start_system.bat` or option 3 above).
3. Open your mobile browser (Safari on iPhone, Chrome on Android) and go to:
   ```text
   http://192.168.1.4:5173
   ```
4. **Ergonomic Mobile Features**:
   - **Bottom Tab Bar**: Ergonomic 1-thumb switching between ECG Telemetry, Pre-Shift Test, and History.
   - **Full Touch Precision**: Tap-zone optimized for sub-millisecond reaction times.
   - **Install as Native PWA**: Tap the browser share menu and select **"Add to Home Screen"** to install AEGIS-SAFE as a standalone full-screen mobile app!

---

## 3. Dedicated React Native / Expo App (`mobile/`)

The `mobile/` directory contains a dedicated native application built with **React Native & Expo**:

### Structure:
```text
worker-safety-system/mobile/
├── assets/                  # Icons and splash screen
├── src/
│   ├── api/client.js        # Mobile HTTP bridge with timeout & offline fallbacks
│   ├── components/
│   │   └── BottomTabBar.js  # Mobile bottom tab bar (ECG, Pre-Shift, History, Settings)
│   ├── screens/
│   │   ├── ECGTelemetryScreen.js    # 60fps Lead II oscilloscope & Pan-Tompkins metrics
│   │   ├── PreShiftCheckScreen.js   # 4-stage readiness battery (Go/No-Go, RT, Dials, Keypad)
│   │   ├── HistoryScreen.js         # 14-day shift records & baseline profile
│   │   └── SettingsScreen.js        # Persona switcher & custom backend IP config
│   └── config.js            # Auto-detection for LAN IP (192.168.1.4), Emulator, Localhost
├── App.js                   # Root container with safe areas
├── app.json                 # Expo mobile config
└── package.json
```

### Running with Expo Go:
1. Install **Expo Go** on your phone from the App Store (iOS) or Google Play Store (Android).
2. Open PowerShell / Command Prompt in `mobile/`:
   ```bash
   cd mobile
   npm install
   npx expo start
   ```
3. Scan the generated terminal QR code with the Expo Go app (or iPhone Camera) to test natively on your device.

---

## 4. Building a Standalone Android Native APK (Capacitor)

The frontend is also pre-configured with **Capacitor** (`capacitor.config.json`):

1. From the `frontend/` folder:
   ```bash
   cd frontend
   npm run build
   npx cap add android
   npx cap open android
   ```
2. Android Studio will open the native Android project.
3. Click **Build > Build Bundle(s) / APK(s) > Build APK(s)** to generate a release or debug `.apk` file for industrial Android tablets and ruggedized phones!

---

## 5. Mobile Feature Verification Matrix

| Domain | Tested Functionality | Status |
|---|---|---|
| **ECG Waveform** | 60fps Lead II QRS sweep, sweep-line cursor, high contrast dark theme | Complete |
| **Autonomic HRV** | Live HR, RMSSD, SDNN, LF/HF balance, and shift clearance verdict | Complete |
| **Go / No-Go** | Large thumb-target tap zone, sub-millisecond recording, commission penalty | Complete |
| **Reaction Time** | 10 trials, <800ms threshold, green flash trigger, running median | Complete |
| **Spot-the-Change** | 4-gauge inspection, deviation detection, tactile tap selection | Complete |
| **Memory Recall** | Emergency code countdown, 12-key numeric touch keypad | Complete |
| **Shift History** | 14-day chronological logs, baseline variance, composite risk scores | Complete |
| **Persona Switcher** | Alex (Control Room), Brian (Turbine Deck), Chloe (Cold-Start), David, Supervisor | Complete |
