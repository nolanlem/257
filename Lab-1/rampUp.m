function [ output ] = rampUp( duration, fs, input )
    nSamples = duration*fs;
    if nSamples > length(input)
        error('Error: Duration chosen for ramp longer than input signal!');
        output = input
        return
    end
    
    envelope = linspace(0,1,nSamples);
    input(1:nSamples) = input(1:nSamples) .* envelope;
    
    output = input;
end

