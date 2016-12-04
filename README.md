# eeg-data-viz

## Who
*Michal Simonfy* -

*Filip Simonfy* - 

*Nikola Jajcay* - scientist at Dept. of Nonlinear Dynamics and Complex Systems, Institute of Computer Science and National Institute of Mental Health

## Why
*Please describe why you do what you do. Why is your project relevant?*

## What
EEG online data vizualization and sonification.

[viz part]

Sonification part involves 4 channels in which the parameters describing the signal are computed and used in pure data to generate sounds.

## How

In sonification part the EEG cap is divided into left and right hemispheres and the data filtered to 1-16Hz and 16-40Hz, constituting 4 channels. In each channel, the spectral centroid and three Hjorth parameters are computed and transferred to pure data via OSC protocol, where these four parameters are used in generative sound algorithm.

## Ethical considerations
*please share the insights about ethical matters surrounding your work. Some "ethical cards" have been distributed to support the discussion about this subject.*
