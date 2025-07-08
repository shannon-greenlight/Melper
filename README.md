# The Melper
The Melper converts a Moog case into a powered Eurorack case.

It requires +12V as an input and generates -12V and +5V.
These 3 voltage rails supply 6 Eurorack power connectors.
Three LEDs monitor the supply rails.
It is targeted to Moog cases, but can be used in any case that has +12V.
Typically, a 12 volt wall wart like the one that Moog supplies is used.

This repo contains the KiCAD files needed to build the Melper.
They were created using Version: 8.0.8, release build

The repo also contains the BOM files that are used to buy the components.
These are found in the BOM folder.
The BOM files for DigiKey and JLCPCB are provided in .csv format.
Other suppliers typically will accept these files with minor modifications.

The repo also contains the files needed for fabrication. These are found in the FAB folder.
These include the gerber files, which are provided both as a zip file and as the full unzipped folder structure.
Also included in the FAB folder are the files needed for pick and place.
The .xlsx file is the pick-and-place file. It is formatted for JLCPCB.
The raw position files are found in the _pos_ folder.


