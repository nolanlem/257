%TEST OUR LAB 1 FUNCTIONS
close all; clear all;

%configuration: Feel free to mess around with this.
fs = 48000; %our sample rate
dur = 5; %Total duration of the sine tone
rampUpTime = 0.1; %total time to ramp up
rampDownTime = 0.1; %total time to ramp down;
%make a sine tone at 440 Hz.
y = sineTone(440,5,fs);

%play back our sine wave. Note: On CCRMA machines, this feature is
%currently broken.
%soundsc(y, fs);

figure;
t = linspace(0,5, fs*5);
subplot(2,2,1)
%plot the first 1000 samples of our sine wave:
plot(t(1:1000), y(1:1000));
title('1000 Samples of our Sine Wave');



%apply our rampUp and rampDown functions:
y = rampUp(1,fs,y);
y = rampDown(1,fs,y);

subplot(2,2,2)
plot(t,y);
title('Full Signal, with envelope');

subplot(2,2,3)
plot(t(1:rampUpTime*fs), y(1:rampUpTime*fs));
title('ramp up')

subplot(2,2,4)
plot(t(end - rampDownTime*fs-1:end), y(end - rampDownTime*fs-1:end));
title('ramp down')

%save our audio to a wav file:
wavwrite(y, fs, 'sineTone.wav');

%%Victory lap:
bpm = 100;

seconds_per_beat = (1/(bpm/60));
seconds_per_triplet = seconds_per_beat/3;

triplet_release = seconds_per_triplet*0.4;
triplet_attack = seconds_per_triplet * 0.05;

quarter_note_release = seconds_per_beat * 0.4;
quarter_note_attack = seconds_per_beat * 0.05;

a_csharp_triplet = sineTone(440, seconds_per_triplet, fs) + sineTone(554.365, seconds_per_triplet, fs);
g_b_triplet = sineTone(391.995, seconds_per_triplet, fs) + sineTone(493.883, seconds_per_triplet, fs);

a_csharp_beat = sineTone(440, seconds_per_beat, fs) + sineTone(554.365, seconds_per_beat, fs);
f_a_beat = sineTone(349.228, seconds_per_beat, fs) + sineTone(440, seconds_per_beat, fs);
g_b_beat = sineTone(391.995, seconds_per_beat, fs) + sineTone(493.883, seconds_per_beat, fs);

a_csharp_qt =sineTone(440, seconds_per_triplet*2, fs) + sineTone(554.365, seconds_per_triplet*2, fs);


%apply envelopes
a_csharp_triplet = rampUp(triplet_attack, fs, rampDown(triplet_release,fs,a_csharp_triplet));
g_b_triplet = rampUp(triplet_attack, fs, rampDown(triplet_release, fs, g_b_triplet));

a_csharp_beat = rampUp(quarter_note_attack, fs, rampDown(quarter_note_release, fs, a_csharp_beat));
f_a_beat = rampUp(quarter_note_attack, fs, rampDown(quarter_note_release,fs, f_a_beat));
g_b_beat = rampUp(quarter_note_attack, fs, rampDown(quarter_note_release, fs, g_b_beat));

a_csharp_qt = rampUp(triplet_attack, fs, rampDown(quarter_note_release, fs, a_csharp_qt));

victory = [a_csharp_triplet, a_csharp_triplet, a_csharp_triplet, a_csharp_beat, f_a_beat, g_b_beat, a_csharp_qt, g_b_triplet, a_csharp_beat];

wavwrite(victory*0.5,fs,'victory.wav')