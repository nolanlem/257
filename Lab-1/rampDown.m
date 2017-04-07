function [ output ] = rampDown( duration, fs, input )
    nSamples = duration*fs;
    if nSamples > length(input)
        error('Error: Duration chosen for ramp longer than input signal!');
        output = input
        return
    end
    
    envelope = linspace(1,0,nSamples);
    input(end-nSamples+1:end) = input(end-nSamples+1:end) .* envelope;
    
    output = input;
end
