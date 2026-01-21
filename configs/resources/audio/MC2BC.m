clc;
close all;
clearvars;
% fs=16e3;
parentdir = '/Users/vtokala/Documents/Research/send/webMUSHRA/configs/resources/audio';

SNRfolders = get_directory_names(parentdir);




for i = 1:length(SNRfolders)

    cd(fullfile(parentdir,SNRfolders(i),'Anechoic'))
    si = dir("*.wav");
    % cd(fullfile(parentdir,SNRfolders(i),'Reverb'))
    % si = dir("*.wav");
    fprintf('Computing SNR %s \n',SNRfolders(i));
    for k = 1:length(si)
        fprintf('Computing signal %d out of %d \n',k,length(si));
        cd(fullfile(parentdir,SNRfolders(i),'Anechoic'))
       [ a,fs,~,~]=v_readwav(si(k).name);
       a_bin = [a(:,1),a(:,2)];
       v_writewav(a_bin,fs,si(k).name,[],[],[],[]);
    end

        

end
