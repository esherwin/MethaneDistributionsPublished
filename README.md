# ReadMe Sherwin et al. 2024
Code for "US oil and gas system emissions from one million aerial site measurements", published in Nature.

Sherwin, E.D., Rutherford, J.S., Zhang, Z., Chen, Y., Wetherley, E.B., Yakovlev, P.V., Berman, E.S.F.,  Jones, B.B., Cusworth, D.H., Thorpe, A.K., Ayasse, A.K., Duren, R.M., Brandt, A.R. US oil and gas system emissions from nearly  one million aerial site measurements. Nature. 627, 328-334 (2024)

Includes results and documentation for the 2025 correction to this paper.

See https://zenodo.org/records/10064774 for the originally published data and code.

## Analytica models
The key models used to conduct the primary analysis in the paper, e.g. the numbers underlying most figures in the paper.
The model to run is "Regional Oil and gas Aerial Methane Synthesis model.ana."
The other two files are linked data modules, saved externally to reduce the file size, which contain 1 million well site emissions estimates from the Rutherford et al. simulation for each basin in this study.

The model contains comprehensive embedded documentation, explaining every operation in the code.
Code is structured in an influence diagram, displaying the underlying relationships between variables.
The opening screen is a user interface for running the model and viewing key results.
The dark blue rectangles with rounded edges and thick black outlines are modules, like folders, which contain other variables and can be opened by double-clicking.

Opening the model will require a version of Analytica software, a Windows-only program.
With the free version of Analytica, one can open and explore the model free of charge, running many sub-processes.
The free version is available for download here: https://analytica.com/#try-for-free

Running the full model requires an Analytica Enterprise license due to the size of some of the input data.
Analytica Enterprise is available for purchase here: https://analytica.com/products/analytica-enterprise/

## Figure generation code
The DistributionsMain.ipynb Jupyter notebook takes in exported spreadsheet results from the Analytica model. and converts them into figures and key numbers for the paper.
The "CDF_data" folder contains well site cumulative emissions distribution function data for fifteen main study scenarios, producing ten such CDFs for each scenario (one for each batch, averaged over 100 Monte Carlo iterations each).
The final CDFs used in this study are the average of these 10 batches, an averaging process conducted automatically in DistributionsMain.ipynb.

The remaining key results, such as scenario-wide emission levels, are saved in the "Other input data" folder, in "Key sim results correction 20250812.xlsx".
This folder also includes data reproduced from Irakulis-Loitxate et al. 2021, which are used to generate a figure in the supplementary information.
Note that DistributionsMain.ipynb includes a code chunk to conduct a similar analysis using TROPOMI-derived emissions presented in Lauvaux et al. 2022, but we do not have permission to reproduce these data.
To access the underlying data from Lauvaux et al. 2022, please submit a request at https://www.methanewatch.kayrros.com/.

### Required dependencies
Ensure Python 3.13 or above is installed

Package requirements documented in requirements.txt

For the Analytica model, use Version 6.5.11.266 or later for best performance.

### File structure
Note that all Analytica, CSV, and XLSX files are stored on Git in large file storage.

## Campaign coverage notebooks
This folder contains Jupyter notebooks used to convert Enverus microdata and aerial survey shapefiles to compute well and hydrocarbon production coverage for each scenario.
These aggregate coverage information, e.g. the total number of well visits or total natural gas production in a given aerial survey scenario, is then incorporated into the Analytica model.
Because Enverus microdata are proprietary, we cannot include them in this repository.
However, we include documentation in our code that we hope will be sufficient for anyone with Enverus access to reproduce our analysis and apply it to new remote sensing surveys.
These Jupyter notebooks were originally designed and executed using Google Colab.

## LICENSE
This work is subject to an MIT License, described in the LICENSE file in this folder.
Here is additional detail on MIT licenses: https://mit-license.org/
