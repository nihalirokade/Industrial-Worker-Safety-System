@echo off
cd /d "%~dp0backend"
echo =======================================================
echo Running AEGIS-SAFE Automated Backend Test Suite (pytest)
echo =======================================================
.venv\Scripts\pytest.exe -v
echo =======================================================
echo Test run complete.
echo =======================================================
pause

