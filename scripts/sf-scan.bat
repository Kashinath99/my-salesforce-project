@echo off

echo Running Salesforce Code Analyzer...

sf scanner run ^
  --target "force-app/main/default/classes" ^
  --engine "pmd" ^
  --format "table" ^
  --severity-threshold 3

if %ERRORLEVEL% neq 0 (
  echo Code Analyzer found violations. Commit blocked.
  exit /b 1
)

echo Salesforce Code Analyzer passed.