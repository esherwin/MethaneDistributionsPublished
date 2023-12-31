# ReadMe Sherwin et al. 2023
[![DOI](https://zenodo.org/badge/681375064.svg)](https://zenodo.org/doi/10.5281/zenodo.10064773)

US oil and gas system emissions from one million aerial site measurements

## Analytica models
Written by Evan D. Sherwin

The key models used to conduct the primary analysis in the paper, e.g. the numbers underlying most figures in the paper.
The model to run is "Regional Oil and gas Aerial Methane Synthesis model.ana" (ROAMS).
The other two files are linked data modules, saved externally to reduce the file size, which contain 1 million well site emissions estimates from the Rutherford et al. simulation for each basin in this study.

The model contains comprehensive embedded documentation, explaining every operation in the code.
Code is structured in an influence diagram, displaying the underlying relationships between variables.
The opening screen is a user interface for running the model and viewing key results.
The dark blue rectangles with rounded edges and thick black outlines are modules, like folders, which contain other variables and can be opened by double-clicking.

Opening the model will require a version of Analytica software, a Windows-only program.
With Analytica Free 101, one can open and explore the model free of charge, running many sub-processes.
Analytica Free 101 is available for download here: https://analytica.com/products/free101/

Running the full model requires an Analytica Enterprise license due to the size of some of the input data.
Analytica Enterprise is available for purchase here: https://lumina.com/purchase-analytica/

## Figure generation code
Written by Evan D. Sherwin

The DistributionsMain.ipynb Jupyter notebook takes in exported spreadsheet results from the Analytica model. and converts them into figures and key numbers for the paper.
The "CDF_data" folder contains well site cumulative emissions distribution function data for fifteen main study scenarios, producing ten such CDFs for each scenario (one for each batch, averaged over 100 Monte Carlo iterations each).
The final CDFs used in this study are the average of these 10 batches, an averaging process conducted automatically in DistributionsMain.ipynb.

The remaining key results, such as scenario-wide emission levels, are saved in the "Other input data" folder, in "Key sim results 20230830.xlsx".
This folder does not include the data from Irakulis-Loitxate et al. 2021, which are used to generate a figure in the supplementary information. These data can be downloaded free of charge here: https://pubs.acs.org/doi/10.1021/acs.est.1c04873.
Note that DistributionsMain.ipynb includes a code chunk to conduct a similar analysis using TROPOMI-derived emissions presented in Lauvaux et al. 2022, but we do not have permission to reproduce these data.
To access the underlying data from Lauvaux et al. 2022, please submit a request at https://www.methanewatch.kayrros.com/.

### Required dependencies
Ensure Python 3.7 or above is installed
Packages: jupyter, pandas, scipy, matplotlib, numpy, pathlib, scikit-fda, openpyxl, xlrd

The above packages are included in the requirements.txt file.

To install required packages via pip, use the following command:

$ pip install -r requirements.txt

## Campaign coverage notebooks
Written by Evan D. Sherwin and Zhan Zhang

This folder contains Jupyter notebooks used to convert Enverus microdata and aerial survey shapefiles to compute well and hydrocarbon production coverage for each scenario.
These aggregate coverage information, e.g. the total number of well visits or total natural gas production in a given aerial survey scenario, is then incorporated into the Analytica model.
Because Enverus microdata are proprietary, we cannot include them in this repository.
However, we include documentation in our code that we hope will be sufficient for anyone with Enverus access to reproduce our analysis and apply it to new remote sensing surveys.
These Jupyter notebooks were originally designed and executed using Google Colab.

Preprocessing_Enverus.ipynb: Converts Enverus datasets into the format needed for regional aggregation scripts.

Summarize_campaign_well_and_prod_stats.ipynb: Computes campaign-specific and basin-specific summary statistics of oil and gas production and well visits

Well_and_production_counting_KairosPermian.ipynb: A version of the above script tailored to anonymized data provided by Kairos Aerospace for the New Mexico Permian campaign.

US-wide survey map + individual campaigns.ipynb: Produces map figures in the paper.

LoadRutherfordResults.ipynb: Draws 1 million random well site samples per basin from the 100 Monte Carlo realizations produced from the Rutherford et al. simulations.

## LICENSE
This work is subject to an MIT License, described in the LICENSE file in this folder.
Here is additional detail on MIT licenses: https://mit-license.org/
