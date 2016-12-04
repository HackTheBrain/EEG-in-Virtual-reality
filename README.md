# eeg-data-viz

## Who
*Michal Simonfy* -

*Filip Simonfy* - psychology/social science reserach/cognitive neuroscience graduate, background in mental health and data analysis, interest in contemporary audial and visual art

*Nikola Jajcay* - scientist at Dept. of Nonlinear Dynamics and Complex Systems, Institute of Computer Science and National Institute of Mental Health

## Why
*Please describe why you do what you do. Why is your project relevant?*

## What
EEG online data vizualization and sonification.

The project embodies the EEG signal in simple and comprehensible manner, making the participants aware of their mental states. Additionally, by possibility to control the virtual environment, the participants can rehearse their attentional focus.

Sonification part involves 4 channels in which the parameters describing the signal are computed and used in pure data to generate sounds.

## How

In sonification part the EEG cap is divided into left and right hemispheres and the data filtered to 1-16Hz and 16-40Hz, constituting 4 channels. In each channel, the spectral centroid and three Hjorth parameters are computed and transferred to pure data via OSC protocol, where these four parameters are used in generative sound algorithm.

## Ethical considerations

Our project takes into account the essential ethical considerations regarding work with human subjects and sensitive data. Deliberate action is required in order to take part in the project, participants are not in threat of any physical or psychological harm, and no data is stored during participation. Although the scope of the project is predominantly artistic, subjects may benefit from their participation beyond the scope of their sensational experience, creating a bridge between the brain mapping technology and general public.  
