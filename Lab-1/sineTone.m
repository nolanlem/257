function [output] = sineTone(frequency, duration, sampleRate)
% sineWave: Generate a sine wave.
% arguments:
%    frequency: frequency of the sinusoid, in Hz.
%    duration: length of the sinusoid, in seconds.
%    sampleRate: sampling rate of the signal, in Hz.

    %INSERT CODE HERE: given our sampling rate (in samples per
    %second), and our duration (in seconds), how many samples long
    %will our output signal be?
    lengthInSamples = duration*sampleRate;
    
    %most functions in Matlab are designed to work with vectors and
    %matrices as well as singular numbers. This is a function
    %called linspace:
    t = linspace(0, duration,lengthInSamples);
    %linspace(a,b,n) returns a vector of n numbers from a to b.
    %here, we are creating a vector of the times at which we are
    %sampling.

    %the equation for a sinusoid is:
    % output = sin(2*pi*f*t + phase).
    % in this case we can set our phase to 0.
    % using our vector of times t, set output to a sinusoid:
    output = sin(2*pi*frequency*t);
end