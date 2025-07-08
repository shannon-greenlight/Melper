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
This requires a properly configured KiCAD installation. Download the KiCAD [a link](https://github.com/shannon-greenlight/KiCAD) repo and follow the instructions in the README to install.
The details are outlined below. Some steps are optional depending on what has changed.

- Update schematic
- Update BOMs
- Update layout
- Update fabrication files
