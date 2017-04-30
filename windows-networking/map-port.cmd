@echo off
setlocal
set USAGE_TEXT=usage: map-port.cmd [LISTEN_IP] [LISTEN_PORT] [CONNECT_IP] [CONNECT_PORT]
set LISTEN_IP=%1
shift
set LISTEN_PORT=%1
shift
set CONNECT_IP=%1
shift
set CONNECT_PORT=%1
shift

if "%LISTEN_IP%"=="" (
    echo Listen IP is missing.
    echo %USAGE_TEXT%
    exit /B 1
)

if "%LISTEN_PORT%"=="" (
    echo Listen Port is missing.
    echo %USAGE_TEXT%
    exit /B 1
)

if "%CONNECT_IP%"=="" (
    echo Connect IP is missing.
    echo %USAGE_TEXT%
    exit /B 1
)

if "%CONNECT_PORT%"=="" (
    echo Connect Port is missing.
    echo %USAGE_TEXT%
    exit /B 1
)

if not "%1"=="" (
    echo Only 4 parameters should be supplied.
    echo %USAGE_TEXT%
    exit /B 1
)

netsh interface portproxy add v4tov4 listenport=%LISTEN_PORT% listenaddress=%LISTEN_IP% connectport=%CONNECT_PORT% connectaddress=%CONNECT_IP%

endlocal