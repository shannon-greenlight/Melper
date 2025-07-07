@echo off

echo This creates BOM files for building the Melper
echo It requires Melper.xml as an input. Make sure that it is up to date. Use the KiCAD schematic BOM generator with the bom2grouped_csv.xsl plugin that's supplied with KiCAD.

set bin_dir=C:\Program Files\KiCad\bin
set plugin_dir=C:\Users\shann\Dropbox\Python\BOM

py "%plugin_dir%/bom_lcsc.py" "Melper.xml" "bom\LCSC\Melper_bom.csv"

py "%plugin_dir%/bom_digikey_split.py" "Melper.xml" "bom\Digi-Key\Melper_split.csv"

py "%plugin_dir%/bom_digikey_full.py" "Melper.xml" "bom\Digi-Key\Melper_full.csv"

if not errorlevel 1 echo Success!

pause
