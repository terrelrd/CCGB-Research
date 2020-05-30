clear; clc;
%This is meant to calculate the Disease Risk Index of a person. Below are
%the bacteria of note as well as the control value, subject values, the
%fold change, and p-values.

%Decreased Growth
%"Bacteroides finegoldii"          "0.7400"     "0.2900"    2.5     .0032
%"Bacteroides intestinalis"        "0.5300"     "0.1900"    2.9     .0063
%"Prevotella copri"                "4.0900"     "0.0000"    40      .0000
%"Prevotella oris"                 "1.6400"     "0.0000"    16      .0001
%"Ruminococcus obeum"              "0.6200"     "0.3400"    1.8     .0009
%"Dorea formicigenerans"           "0.2400"     "0.0800"    2.9     .0001
%"Lachnobacterium bovis"           "1.2000"     "0.6200"    1.9     .0002
%"Lachnospira pectinoschiza"       "0.5400"     "0.2100"    2.6     .0005
%"Pseudobutyrivibrio ruminis"      "0.3900"     "0.1200"    3.2     .0000
%"Bacteroides capillosus"          "0.2300"     "0.1000"    2.2     .0057
%"Ruminococcus albus"              "0.3600"     "0.0300"    10.3    .0008
%"Dialister invisus"               "3.4500"     "0.0700"    48.7    .0000    
%"Dialister pneumosintes"          "0.4800"     "0.0100"    52.6    .0000   
%"Megamonas hypermegale"           "0.2400"     "0.0000"    44.5    .0001  

%Increased Growth
%"Acidaminobacter uncsfied"        "0.0500"     "0.3900"    7.7     .0045
%"Phascolarctobacterium uncsfied"  "3.3100"     "11.000"    3.2     .0000
%"Citrobacter farmeri"             "0.0800"     "0.3700"    4.6     .0050
%"Akkermansia muciniphilia"        "3.5400"     "12.800"    3.6     .0032

Names = ["Bacteroides finegoldii";
    "Bacteroides intestinalis";
    "Prevotella copri";
    "Prevotella oris";
    "Ruminococcus obeum";
    "Dorea formicigenerans";
    "Lachnobacterium bovis";
    "Lachnospira pectinoschiza";
    "Pseudobutyrivibrio ruminis";
    "Bacteroides capillosus";
    "Ruminococcus albus";
    "Dialister invisus";
    "Dialister pneumosintes";
    "Megamonas hypermegale";
    "Acidaminobacter uncsfied";
    "Phascolarctobacterium uncsfied";
    "Citrobacter farmeri";
    "Akkermansia muciniphilia"];

Controls = [0.74;           %"Bacteroides finegoldii"
    0.53;                   %"Bacteroides intestinalis"
    4.09;                   %"Prevotella copri" 
    1.64;                   %"Prevotella oris" 
    0.62;                   %"Ruminococcus obeum"
    0.24;                   %"Dorea formicigenerans"
    1.2;                    %"Lachnobacterium bovis" 
    0.54;                   %"Lachnospira pectinoschiza"
    0.39;                   %"Pseudobutyrivibrio ruminis" 
    0.23;                   %"Bacteroides capillosus"  
    0.36;                   %"Ruminococcus albus"    
    3.45;                   %"Dialister invisus" 
    0.48;                   %"Dialister pneumosintes" 
    0.24;                   %"Megamonas hypermegale"
    0.05;                   %"Acidaminobacter uncsfied" 
    3.31;                   %"Phascolarctobacterium uncsfied"
    0.08;                   %"Citrobacter farmeri"    
    3.54];                  %"Akkermansia muciniphilia"  


Subject = [.29;             %"Bacteroides finegoldii"
    0.19;                   %"Bacteroides intestinalis"
    0;                      %"Prevotella copri" 
    0;                      %"Prevotella oris" 
    0.34;                   %"Ruminococcus obeum"
    0.08;                   %"Dorea formicigenerans"
    0.62;                   %"Lachnobacterium bovis" 
    0.21;                   %"Lachnospira pectinoschiza"
    0.12;                   %"Pseudobutyrivibrio ruminis" 
    0.1;                    %"Bacteroides capillosus"  
    0.03;                   %"Ruminococcus albus"    
    0.07;                   %"Dialister invisus" 
    0.01;                   %"Dialister pneumosintes" 
    0;                      %"Megamonas hypermegale"
    0.39;                   %"Acidaminobacter uncsfied" 
    11;                     %"Phascolarctobacterium uncsfied"
    0.37;                   %"Citrobacter farmeri"    
    12.8];                  %"Akkermansia muciniphilia"  


Direction = [-1;            %"Bacteroides finegoldii"
    -1;                     %"Bacteroides intestinalis"
    -1;                     %"Prevotella copri" 
    -1;                     %"Prevotella oris" 
    -1;                     %"Ruminococcus obeum"
    -1;                     %"Dorea formicigenerans"
    -1;                     %"Lachnobacterium bovis" 
    -1;                     %"Lachnospira pectinoschiza"
    -1;                     %"Pseudobutyrivibrio ruminis" 
    -1;                     %"Bacteroides capillosus"  
    -1;                     %"Ruminococcus albus"    
    -1;                     %"Dialister invisus" 
    -1;                     %"Dialister pneumosintes" 
    -1;                     %"Megamonas hypermegale"
    1;                      %"Acidaminobacter uncsfied" 
    1;                      %"Phascolarctobacterium uncsfied"
    1;                      %"Citrobacter farmeri"    
    1];                     %"Akkermansia muciniphilia"  

stdev = [std(xlsread("CCGB_Statdata", 'Combined', 'J1:M1')); %"Bacteroides finegoldii"
    std(xlsread("CCGB_Statdata", 'Combined', 'J2:M2'));      %"Bacteroides intestinalis"
    std(xlsread("CCGB_Statdata", 'Combined', 'J3:M3'));      %"Prevotella copri" 
    std(xlsread("CCGB_Statdata", 'Combined', 'J4:M4'));      %"Prevotella oris" 
    std(xlsread("CCGB_Statdata", 'Combined', 'J5:M5'));      %"Ruminococcus obeum"
    std(xlsread("CCGB_Statdata", 'Combined', 'J6:M6'));      %"Dorea formicigenerans"
    std(xlsread("CCGB_Statdata", 'Combined', 'J7:M7'));      %"Lachnobacterium bovis"
    std(xlsread("CCGB_Statdata", 'Combined', 'J8:M8'));      %"Lachnospira pectinoschiza" 
    std(xlsread("CCGB_Statdata", 'Combined', 'J9:M9'));      %"Pseudobutyrivibrio ruminis"  
    std(xlsread("CCGB_Statdata", 'Combined', 'J10:M10'));    %"Bacteroides capillosus"  
    std(xlsread("CCGB_Statdata", 'Combined', 'J11:M11'));    %"Ruminococcus albus"
    std(xlsread("CCGB_Statdata", 'Combined', 'J12:M12'));    %"Dialister invisus"
    std(xlsread("CCGB_Statdata", 'Combined', 'J13:M13'));    %"Dialister pneumosintes"
    std(xlsread("CCGB_Statdata", 'Combined', 'J14:M14'));    %"Megamonas hypermegale"
    std(xlsread("CCGB_Statdata", 'Combined', 'J15:M15'));    %"Acidaminobacter uncsfied" 
    std(xlsread("CCGB_Statdata", 'Combined', 'J16:M16'));    %"Phascolarctobacterium uncsfied"
    std(xlsread("CCGB_Statdata", 'Combined', 'J17:M17'));    %"Citrobacter farmeri"  
    std(xlsread("CCGB_Statdata", 'Combined', 'J18:M18'))] ; %"Akkermansia muciniphilia" 
counter = 0;
while counter < length(stdev)
    counter = counter + 1;
    if stdev(counter) == 0
        stdev(counter) = 0.001;
    else
        %do nothing
    end
end

numgrowth = nnz(Direction == 1);

PatientExample = [1;        %"Bacteroides finegoldii"
    1;                      %"Bacteroides intestinalis"
    5;                      %"Prevotella copri" 
    2;                      %"Prevotella oris" 
    1;                      %"Ruminococcus obeum"
    1;                      %"Dorea formicigenerans"
    2;                      %"Lachnobacterium bovis" 
    2;                      %"Lachnospira pectinoschiza"
    2;                      %"Pseudobutyrivibrio ruminis" 
    3;                      %"Bacteroides capillosus"  
    4;                      %"Ruminococcus albus"    
    4;                      %"Dialister invisus" 
    4;                      %"Dialister pneumosintes" 
    4;                      %"Megamonas hypermegale"
    .02;                    %"Acidaminobacter uncsfied" 
    .20;                    %"Phascolarctobacterium uncsfied"
    .005;                   %"Citrobacter farmeri"    
    3];                     %"Akkermansia muciniphilia"  

supcounter = 0;
startingpoint = 'B1:B18';
excelletters = ['B','C','D','E','F','G','H','I','N','O','P','Q','J','K','L','M'];
DRIlisthealthy = [];
DRIlistsick = [];
DRIlisttraining = [];

%Input abundance (%) data of patient here in order of microbes listed above
%then click run, the output will be the DRI

while supcounter < length(excelletters)
    supcounter = supcounter + 1;
    if supcounter == 1
Patient = [xlsread("CCGB_Statdata", 'Average Healthy', 'B1:B18')];
    elseif supcounter < 9
       substring = strrep(startingpoint, 'B', excelletters(supcounter));
       Patient = [xlsread("CCGB_Statdata", 'Average Healthy', substring)];
    elseif supcounter > 12
        substring = strrep(startingpoint, 'B', excelletters(supcounter));
       Patient = [xlsread("CCGB_Statdata", 'Average Cancer', substring)];
    elseif supcounter > 8
        substring = strrep(startingpoint, 'B', excelletters(supcounter));
       Patient = [xlsread("CCGB_Statdata", 'Average Cancer', substring)];
    end

Patient = Patient/10;

%Make the assumption now that the controls and stdev values are population
%values (use Z-scores), this is not entirely based on statistics but a mix
%of that and trying to work through the trends

Patientdiff = Direction.*Subject - Direction.*Patient;
PatientT = abs(Patientdiff./stdev);
Values = [tcdf(PatientT,length(xlsread("CCGB_Statdata", 'Combined', 'J18:M18'))-1)];
 Values(3) = Values(3)*6;
 Values(4) = Values(4)*6;
 Values(12) = Values(12)*3;
 Values(13) = Values(13)*3;
 Values(14) = Values(14)*3;
 Values(16) = Values(16)*5;
DRI = (1-(sum(Values)/38-.5)*2)*100;
if supcounter < 9
DRIlisthealthy = [DRIlisthealthy; DRI];
elseif supcounter > 12
     DRIlisttraining = [DRIlisttraining; DRI];
elseif supcounter > 8
     DRIlistsick = [DRIlistsick; DRI];
end
end
DRIlisthealthy
DRIlistsick
DRIlisttraining
