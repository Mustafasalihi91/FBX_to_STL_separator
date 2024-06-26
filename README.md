# FBX_to_STL_separator

## Project Overview

FBX_to_STL_separator is a powerful two-step automation tool designed to streamline the process of extracting and converting architectural elements from FBX files into individual STL files. This toolset comprises two main components:

1. `FBX to OBJS.blend`: A Blender file containing a Python script for FBX to OBJ conversion and element separation.
2. `OBJtoSTL.bat`: A batch file for converting OBJ files to STL format using CloudCompare.

This toolset is particularly useful for professionals and students working in Building Information Modeling (BIM), architectural visualization, and 3D printing preparation.

## Project Origin

This project was conceptualized and performed during a research stay at the research group of Jun.-Prof. Dr. Reza Maalek, the GOLDBECK endowed chair in Digital Engineering and Construction (DEC) at the Institute of Technology and Management in Construction (TMB) of the Karlsruhe Institute of Technology (KIT).

## Video of the script 
<iframe width="560" height="315" src="https://www.youtube.com/embed/dvv-K5EM_jU" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

### Purpose

The primary purpose of this toolset is to automate the tedious task of manually separating and converting individual architectural elements from complex 3D models. It addresses the common challenge in architectural workflows where entire building models need to be broken down into their constituent parts and converted to a widely-compatible format for further analysis, modification, or 3D printing.

### Main Functionality

1. **FBX Import and Object Separation**: Imports FBX files and automatically identifies specific architectural elements based on predefined keywords.
2. **Naming and Data Management**: Applies consistent naming conventions and implements a hashing system for persistent object numbering across multiple runs and epochs.
3. **Geometry Processing**: Calculates bounding box coordinates for spatial analysis and placement.
4. **File Conversion**: Exports separated objects as individual OBJ files, then converts them to STL format using CloudCompare.
5. **Data Persistence**: Stores object data in CSV files for easy reference and further processing.
6. **File Organization**: Automatically organizes the resulting STL files into a designated folder structure.

## Prerequisites

- Windows operating system
- Blender 3.6 or later
- CloudCompare 2.13 or later (default path: C:\Program Files\CloudCompare\CloudCompare.exe)
- Python 3.7 or higher (included with Blender)

### Required Libraries

- Blender Python API (bpy) - included with Blender
- Standard Python libraries: os, csv, mathutils, hashlib - included in Python's standard library
- CloudCompare command-line interface - included in CloudCompare installation

No additional pip installations are required.

## Installation and Setup

1. **Download the Scripts**
   - Clone this repository or download both `FBX to OBJS.blend` and `OBJtoSTL.bat` files.

2. **Blender Configuration**
   - Launch Blender
   - Open the `FBX to OBJS.blend` file in Blender

3. **CloudCompare Configuration**
   - Ensure CloudCompare is installed in the default location or update the path in `OBJtoSTL.bat`

4. **Configure File Paths**
   - In Blender, open the Text Editor window and locate the script within the `FBX to OBJS.blend` file
   - Update the following paths in the script:
     ```python
     CONFIG = {
         "fbx_path": r"C:\Path\To\Your\InputModel.fbx",
         "obj_dir": r"C:\Path\To\Your\OutputOBJs",
         "csv_file_path": r"C:\Path\To\Your\OutputData.csv",
         "numbering_dir": r"C:\Path\To\Your\NumberingCSVs"
     }
     ```
   - Edit `OBJtoSTL.bat` if CloudCompare is installed in a non-default location:
     ```batch
     set "cloudcompare_executable=C:\Your\Custom\Path\To\CloudCompare.exe"
     ```

5. **Verify Blender Script**
   - In Blender, with the `FBX to OBJS.blend` file open, run the script from the Text Editor window
   - If no errors occur, the setup is successful

## Usage

### FBX to OBJ Conversion (Blender)

1. Open the `FBX to OBJS.blend` file in Blender
2. Adjust the CONFIG dictionary in the script if necessary. Replace the example paths with your specific directories:
   ```python
   CONFIG = {
       "fbx_path": r"C:\Path\To\Your\InputModel.fbx",
       "obj_dir": r"C:\Path\To\Your\OutputOBJs",
       "csv_file_path": r"C:\Path\To\Your\OutputData.csv",
       "numbering_dir": r"C:\Path\To\Your\NumberingCSVs"
   }
3.Run the script to process the FBX file and generate separated OBJ files

### OBJ to STL Conversion (CloudCompare)

1. Place `OBJtoSTL.bat` in the same directory as your OBJ files.
2. Double-click `OBJtoSTL.bat` to run it.
3. The script will:
   - Convert all OBJ files in the current directory to STL format.
   - Move the resulting STL files to a new 'stls' subdirectory.
   - Delete the original OBJ files.

## Caution

The OBJ to STL conversion script deletes the original OBJ files after conversion. Ensure you have backups before running the script.

## Troubleshooting

If the script fails to identify objects, check if your FBX file uses the expected keywords ("Column", "Wall", "Floor") in object names.
Ensure all file paths in the CONFIG dictionary are correctly set and accessible.
If CloudCompare fails to convert OBJ to STL, verify that CloudCompare is correctly installed and the path in the batch file is correct.

## Contributing

Contributions to improve FBX_to_STL_separator are welcome. Please feel free to submit pull requests or open issues to discuss proposed changes or report bugs.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
