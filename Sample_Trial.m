function [response] = Sample_Trial(trialNo)

global parameters
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVIES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Noun training
    movietoplay_noun1a = 'Movies/1_noun_1a.mov';
    movietoplay_noun1b = 'Movies/1_noun_1b.mov';
    movietoplay_noun1_distractor = 'Movies/1_noun_1_distractor';
    movietoplay_noun2a = 'Movies/2_noun_2a.mov';
    movietoplay_noun2b = 'Movies/2_noun_2b.mov';
    movietoplay_noun2_distractor = 'Movies/2_noun_2_distractor';

    %Trial movies
    movietoplay_target = strcat('Movies/', char(parameters.pBiasV(trialNo)));
    movietoplay_distractor = strcat('Movies/', char(parameters.mBiasV(trialNo)));
    movietoplay_sign = strcat('Movies/', char(parameters.ambigV(trialNo)));
    movietoplay_trainV1 = strcat('Movies/', char(parameters.trainV1(trialNo)));
    movietoplay_trainV2 = strcat('Movies/', char(parameters.trainV2(trialNo)));
    movietoplay_trainV3 = strcat('Movies/', char(parameters.trainV3(trialNo)));
    movietoplay_mTest = strcat('Movies/', char(parameters.mTestV(trialNo)));
    movietoplay_pTest = strcat('Movies/', char(parameters.pTestV(trialNo)));
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AUDIO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    soundtoplay_ambigAudioFuture = strcat('Audio_stimuli_creation/Finished/', char(parameters.ambigAudioFuture(trialNo)));
    soundtoplay_ambigAudioPast = strcat('Audio_stimuli_creation/Finished/', char(parameters.ambigAudioPast(trialNo)));
    soundtoplay_trainAudioFuture1 = strcat('Audio_stimuli_creation/Finished/', char(parameters.trainAudioFuture1(trialNo)));
    soundtoplay_trainAudioPast1 = strcat('Audio_stimuli_creation/Finished/', char(parameters.trainAudioPast1(trialNo)));
    soundtoplay_trainAudioFuture2 = strcat('Audio_stimuli_creation/Finished/', char(parameters.trainAudioFuture2(trialNo)));
    soundtoplay_trainAudioPast2 = strcat('Audio_stimuli_creation/Finished/', char(parameters.trainAudioPast2(trialNo)));
    soundtoplay_trainAudioFuture3 = strcat('Audio_stimuli_creation/Finished/', char(parameters.trainAudioFuture3(trialNo)));
    soundtoplay_trainAudioPast3 = strcat('Audio_stimuli_creation/Finished/', char(parameters.trainAudioPast3(trialNo)));
    soundtoplay_whichOne = strcat('Audio_stimuli_creation/Finished/', char(parameters.whichOneAudio(trialNo)));
    soundtoplay_letsFind = strcat('Audio_stimuli_creation/Finished/aa_lets_find/', char(parameters.letsFindAudio(trialNo)));
    soundtoplay_letsWatchMore = 'Audio_stimuli_creation/Finished/aa_motivation/letswatchmore.wav';
    soundtoplay_getReady = 'Audio_stimuli_creation/Finished/aa_motivation/getready.wav';
    soundtoplay_goodJob = 'Audio_stimuli_creation/Finished/aa_motivation/goodjob.wav';
    soundtoplay_nowLetsSee = 'Audio_stimuli_creation/Finished/aa_motivation/nowletssee.wav';
    soundtoplay_wow = 'Audio_stimuli_creation/Finished/aa_motivation/wow.wav';
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STAR IMAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    
    starImageStart = 'stars/stars.001.jpg';
    starImageTrials = strcat('stars/', char(parameters.starImage(trialNo)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BIAS TEST VIDEO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        Show_Blank;

        Play_Sound(soundtoplay_ambigAudioFuture, 'toBlock');
    
        PlayCenterMovie(movietoplay_sign);
        PlayCenterMovie(movietoplay_sign);
        Show_Blank;

        Play_Sound(soundtoplay_ambigAudioPast, 'toBlock');
        
        Show_Blank; 
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % BIAS TEST
    % Play the two event movies; movie always plays L then R
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Play_Sound(soundtoplay_letsFind, 'toBlock');
    Show_Blank;      
           
    if parameters.LorR_bias == 0 %play Target Movie on left

        PlaySideMovies(movietoplay_target,'','caption_left','');
        PlaySideMovies('',movietoplay_distractor,'caption_right','');
        

    else %play Distractor Movie on left

        PlaySideMovies(movietoplay_distractor,'','caption_left','');
        PlaySideMovies('',movietoplay_target,'caption_right','');
        
    end
    
    
    Play_Sound(soundtoplay_whichOne, 'toBlock');
    
    parameters.biasTestAns(trialNo) = Take_Response();
    Show_Blank();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3 TRAINING VIDEOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Play_Sound(soundtoplay_letsWatchMore, 'toBlock');
    Text_Show('Ready to learn some verbs? Press space.');
    Take_Response();
    Show_Blank;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 111111111111111111111111111111111111111111111111111111111111111111111111
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    parameters.trainStart(trialNo) = GetSecs;

    Play_Sound(soundtoplay_trainAudioFuture1, 'toBlock');

    PlayCenterMovie(movietoplay_trainV1);
    PlayCenterMovie(movietoplay_trainV1);
    Show_Blank;

    Play_Sound(soundtoplay_trainAudioPast1, 'toBlock');

    WaitSecs(1.500);
    
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 2222222222222222222222222222222222222222222222222222222222222222222222222
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Play_Sound(soundtoplay_trainAudioFuture2, 'toBlock');

    PlayCenterMovie(movietoplay_trainV2);
    PlayCenterMovie(movietoplay_trainV2);
    Show_Blank;

    Play_Sound(soundtoplay_trainAudioPast2, 'toBlock');

    WaitSecs(1.500);
    
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 333333333333333333333333333333333333333333333333333333333333333333333333%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Play_Sound(soundtoplay_trainAudioFuture3, 'toBlock');

    PlayCenterMovie(movietoplay_trainV3);
    PlayCenterMovie(movietoplay_trainV3);
    Show_Blank;

    Play_Sound(soundtoplay_trainAudioPast3, 'toBlock');

    parameters.trainEnd(trialNo) = GetSecs;
   
    WaitSecs(1.500);
    Show_Blank;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % READY FOR THE TEST?
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Text_Show('Ready for the test? Press space.');
    Take_Response();
    Show_Blank;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLAY THE TEST MOVIE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    parameters.finalTestStart(trialNo) = GetSecs;

    Play_Sound(soundtoplay_letsFind, 'toBlock');
    Show_Blank;      

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
    if parameters.LorR_final == 0 %play Target Movie on left

        PlaySideMovies(movietoplay_mTest,'','caption_left','');
        PlaySideMovies('',movietoplay_pTest,'caption_right','');

    else %play Distractor Movie on left

        PlaySideMovies(movietoplay_pTest,'','caption_left','');
        PlaySideMovies('',movietoplay_mTest,'caption_right','');
 
    end
    
    Play_Sound(soundtoplay_whichOne, 'toBlock');
    
    parameters.finalTestAns(trialNo) = Take_Response();
 
    parameters.finalTestEnd(trialNo) = GetSecs;
    
    imageArray = imread(char(parameters.starImage(trialNo)));
    
    rect = parameters.scr.rect;
    
    winPtr = parameters.scr.winPtr;
    
    Screen('PutImage', winPtr , imageArray, rect );
    
    Screen('flip',winPtr)
    resp1 = Take_Response();
    Show_Blank;
    
end




