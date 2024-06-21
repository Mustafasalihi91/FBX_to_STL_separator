@echo off
SETLOCAL EnableDelayedExpansion
cd /D %~dp0

REM Set the path to CloudCompare executable
set "cloudcompare_executable=C:\Program Files\CloudCompare\CloudCompare.exe"

REM Set the folder containing OBJ files (current directory by default)
set "obj_files_folder=%~dp0"

REM Set the output folder for STL files
set "stl_files_folder=%obj_files_folder%stls"

REM Check if the "stls" folder exists; if not, create it.
if not exist "%stl_files_folder%" (
    mkdir "%stl_files_folder%"
)

pushd "%obj_files_folder%"

REM Process each OBJ file
for /f "delims=|" %%f in ('dir /b "*.obj"') do (
    REM Convert OBJ to STL using CloudCompare
    "%cloudcompare_executable%" -silent -O "%%f" -M_EXPORT_FMT STL -SAVE_MESHES "%%~nf.stl"
    REM Move the created STL file if it has a different name
    for /f "delims=|" %%g in ('dir /b "%%~nf*.stl"') do (
        move /y "%%g" "%%~nf.stl"
    )
    REM Delete the original OBJ file
    del "%%f"
)

REM Move all STL files to the "stls" folder
move /y "*.stl" "%stl_files_folder%"

popd
