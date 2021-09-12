@echo off
rem This file was created by pub v2.12.0-133.7.beta.
rem Package: peanut
rem Version: 3.7.0
rem Executable: peanut
rem Script: peanut
if exist "C:\src\flutter\.pub-cache\global_packages\peanut\bin\peanut.dart-2.12.0-133.7.beta.snapshot" (
  dart "C:\src\flutter\.pub-cache\global_packages\peanut\bin\peanut.dart-2.12.0-133.7.beta.snapshot" %*
  rem The VM exits with code 253 if the snapshot version is out-of-date.
  rem If it is, we need to delete it and run "pub global" manually.
  if not errorlevel 253 (
    goto error
  )
  pub global run peanut:peanut %*
) else (
  pub global run peanut:peanut %*
)
goto eof
:error
exit /b %errorlevel%
:eof

