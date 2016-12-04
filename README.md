# ⚡️ EEG in VR
EEG transformed into immersive sound and virtual reality environment


## Who
*Filip Simonfy* - psychology/social science research/cognitive neuroscience graduate, background in mental health and data analysis, interest in contemporary audial and visual art

*Michal Simonfy* - designer and visual artist with interest in interactive installations, data processing, and human-computer interaction

*Nikola Jajcay* - nonlinear pioneer and fellow data cruncher, in spare time also physicist/scientist 


## Why
The project embodies the EEG signal in a simple and comprehensible manner, making the participants aware of the neural activity linked to ongoing mental processes in their brain. Additionally, by possibility to control the virtual environment in real time, participants can rehearse their attentional focus, following the neurofeedback paradigm.


## What
The project's aim is a transformation of online EEG data into audial and visual stimuli.

The sonification aspect involves 4 channels in which the parameters describing the signal are computed and used in pure data to generate sounds. The visual part of our project consists of meditative virtual environment presented in Oculus Rift VR. Participants connected to online EEG can control objects and the dynamics of the environment by their attention focus.

!["EEG visualized in VR"](http://i.imgur.com/50S32GZ.jpg)


## How

In sonification part, the EEG cap is divided into left and right hemispheres and the data filtered to 1-16Hz and 16-40Hz, constituting 4 channels. In each channel, the spectral centroid and three Hjorth parameters are computed and transferred to pure data via OSC protocol, where these four parameters are used in the generative sound algorithm.

Visual part of the project builds upon the theta activity in parietal brain region (4-8Hz) and the imagery evolves reflecting the current attentional focus of the participant.


## Ethical considerations

Our project takes into account the essential ethical considerations regarding work with human subjects and sensitive data. Deliberate action is required in order to take part in the project, participants are not in threat of any physical or psychological harm, and no data is stored during participation. Although the scope of the project is predominantly artistic, subjects may benefit from their participation beyond the scope of their sensational experience, creating a bridge between the brain mapping technology and the general public.  
