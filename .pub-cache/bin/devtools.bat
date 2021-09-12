@echo off
rem This file was created by pub v2.14.0-301.2.beta.
rem Package: devtools
rem Version: 2.5.0
rem Executable: devtools
rem Script: devtools
if exist "C:\src\flutter\.pub-cache\global_packages\devtools\bin\devtools.dart-2.14.0-301.2.beta.snapshot" (
  dart "C:\src\flutter\.pub-cache\global_packages\devtools\bin\devtools.dart-2.14.0-301.2.beta.snapshot" %*
  rem The VM exits with code 253 if the snapshot version is out-of-date.
  rem If it is, we need to delete it and run "pub global" manually.
  if not errorlevel 253 (
    goto error
  )
  dart pub global run devtools:devtools %*
) else (
  dart pub global run devtools:devtools %*
)
goto eof
:error
exit /b %errorlevel%
:eof

