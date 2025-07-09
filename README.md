# The Melper
The Melper converts a Moog case into a powered Eurorack case.

It requires +12V as an input and generates -12V and +5V.
These 3 voltage rails supply 6 Eurorack power connectors.
Three LEDs monitor the supply rails.
It is targeted to Moog cases, but can be used in any case that has +12V.
Typically, a 12 volt wall wart like the one that Moog supplies is used.

This repo contains the schematic and layout files needed to create the Melper.
These files are for KiCAD Version: 8.0.8

The repo contains the BOM files that are used to buy the components.
These are found in the _BOM_ folder.
The BOM files for DigiKey and JLCPCB are provided in .csv format.
Other suppliers typically will accept these files with minor modifications.

The repo also contains the files needed for fabrication. These are found in the _fab_ folder.
These include the gerber files, which are provided both as a zip file and as the full unzipped folder structure.
Also included in the _fab_ folder are the files needed for pick and place.
The .xlsx file is the pick-and-place file. It is formatted for JLCPCB.
The raw position files are found in the _pos_ folder.

# Making Changes
The process of making changes usually starts with altering the schematic followed by other actions as required.
This requires a properly configured KiCAD installation. Download the KiCAD [repo](https://github.com/shannon-greenlight/KiCAD) and follow the instructions in the README to install.
When the system is configured follow the steps outlined below. Some steps are optional depending on what has changed.

- Update schematic
- If any parts have changed, Update BOMs
	- From KiCAD Schematic Editor, run Tools->Generate Legacy Bill of Materials using bom2grouped_csv.xsl
		- bom2grouped_csv.xsl is found in the Greenface KiCAD repo.
		- Here is a sample command line: xsltproc -o "%O.csv" "C:\Users\shann\Dropbox\KiCAD\bom2grouped_csv.xsl" "%I"
		- This creates a .csv and an xsl file. The xml file is used in the next step.
	- Run _generate_boms.bat_
		- This creates 3 .csv files
			- BOM\Digi-Key\Melper_full.csv (all components)
			- BOM\Digi-Key\Melper_split.csv (just components not found in LCSC BOM)
			- BOM\LCSC\Melper_bom.csv (just components to be assembled by JLCPCB)
		- generate_boms.bat requires Python and the Greenface Python [libraries](https://github.com/shannon-greenlight/PYTHON_BOM) to be installed
			- Place the Greenface Python folder in a convienient place on your computer and set the variable %plugin_dir% to point to that folder location.
			- Python is invoked as 'py' in the batch file. This may need to be changed depending on your Python installation.
- Update layout if required
	- Plot the Gerber files
		- Set the output directory to _fab\gerber\\_
		- Make sure to Generate Drill Files
		- Create a zip archive of the Gerber files. (This is required by JLCPCB)
			- Use Windows Send To Compressed Folder
			- Alternatively, use zip_gerbers.bat
			- zip_gerbers.bat requires 7z.exe
			- Edit this file if 7z.exe is installed somewhere other than C:\Program Files\7-Zip
	- Create the pick-and-place files
		- From KiCAD PCB Editor, run File->Fabrication Outputs->Component Placement
		- Set the output directory to _fab\pos\\_
		- This creates the files used by the next step
		- Update melper_cpl.xlsx
			- melper_cpl.xlsx uses Excel Queries to convert pos\Melper-top-pos.csv into a format compatible with JLCPCB
			- Excel requires an absolute path to the source folder of the data. Edit the query to enter the path to your project.
			- *note: This process does not produce a perfect placement file due to differences in how KiCAD and JLCPCB orient components. However, JLCPCB is able to use the file without problems. So, even if the placement looks wrong when specifying the build, they will use the file and produce correct boards.
			- **note: There is probably a KiCAD plugin available that does a better job. The user is encouraged to try this route and report the results back.
- Upload to JLCPCB
	- JLCPCB requires the following files:
		- fab\melper_gerbers.zip
		- fab\melper_cpl.xlsx (only needed for assembly)
		- bom\LCSC\Melper_bom.csv (only needed for assembly)
