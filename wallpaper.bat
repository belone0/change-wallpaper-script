@echo off
setlocal

:: Caminhos
set "SRC=C:\wallpaperbackup\wallpaper.png"
set "DEST_DIR=C:\Wallpapers"
set "DEST=%DEST_DIR%\wallpaper.png"
set "THEME=%SystemRoot%\Resources\Themes\aero.theme"

echo Substituindo wallpaper...

:: Verifica se o arquivo de origem existe
if not exist "%SRC%" (
    echo ERRO: Arquivo de origem nao encontrado em %SRC%
    pause
    exit /b 1
)

:: Verifica se o diretorio de destino existe
if not exist "%DEST_DIR%" (
    echo ERRO: Diretorio de destino nao encontrado em %DEST_DIR%
    pause
    exit /b 1
)

:: Remove o arquivo antigo, se existir
if exist "%DEST%" (
    del /F /Q "%DEST%"
)

:: Copia o novo arquivo
copy /Y "%SRC%" "%DEST%" >nul
if errorlevel 1 (
    echo ERRO ao copiar o novo wallpaper.
    pause
    exit /b 1
)

echo Wallpaper substituido com sucesso.

:: Forca a reaplicacao do tema para atualizar o desktop
echo Reaplicando tema para forcar atualizacao...
start "" "%THEME%"
timeout /t 2 >nul
start "" "%THEME%"
timeout /t 2 >nul

echo Tema reaplicado. Wallpaper deve estar visivel agora.
pause
