# R Category-wise Bar Chart — Mariana Trench Observations by Tectonic Plate

An R script drawing a category-wise (stacked) bar chart of the number of depth
observation points per cross-section profile, coloured by the tectonic plate
each observation falls on.

## Related publication

This script produced Figure 12 (left) in:

Lemenkova, P. Statistical Analysis of the Mariana Trench Geomorphology Using R
Programming Language. Geodesy and Cartography 2019, 45(2), 57-84.

- DOI: https://doi.org/10.3846/gac.2019.3785
- figshare: https://doi.org/10.6084/m9.figshare.9762860
- HAL: https://hal.science/hal-02277500
- Zenodo: https://zenodo.org/record/3385005
- SSRN: https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3447481
- ISSN: 2029-6991 (Scopus)

## Scripts

- Categorywise_BarChart.R / 17_Categorywise_BarChart.R: read DepthTect.csv,
  remove NA rows, reshape wide to long with data.table::melt (patterns
  "^profile", "^tectonics", "^tg" into depths / tectonics / angles), and draw a
  stacked bar chart with ggplot2 geom_bar(aes(fill = tectonics)) over a
  ColorBrewer RdBu palette, with rotated profile labels.

(17_Categorywise_BarChart_agri.R is a later, unrelated FAOSTAT example.)

## Methods

- Wide-to-long reshaping (data.table::melt) and category-wise stacked bar
  aggregation of observation counts by a factor (tectonic plate).

## Data

- DepthTect.csv: per-observation depths, tectonic-plate membership and trench
  angles along the 25 Mariana Trench profiles.

## Requirements

- R (>= 3.5); packages: ggplot2, data.table, RColorBrewer

## Author and citation

Polina Lemenkova — ORCID https://orcid.org/0000-0002-5759-1089
Cite: Lemenkova, P. Statistical Analysis of the Mariana Trench Geomorphology
Using R Programming Language. Geodesy and Cartography 2019, 45(2), 57-84.
https://doi.org/10.3846/gac.2019.3785

## License

MIT — see the LICENSE file (Copyright Polina Lemenkova).
