clear; clc;

Controls_temp = xlsread('CCGB_TrainerII.xlsx',1);
Subjects_temp = xlsread('CCGB_TrainerII.xlsx',2);
Test_Healthy = xlsread('CCGB_TrainerII.xlsx',5);
Test_CRC = xlsread('CCGB_TrainerII.xlsx',6);

Controls = [Controls_temp, Test_Healthy];
Subjects = [Subjects_temp, Test_CRC];

CRC_Patients = [Controls, Subjects];

Diagnoses = [];
for i = 1:size(CRC_Patients,2)
    if(i > size(Controls))
        Diagnoses(1,i) = false;
        Diagnoses(2,i) = true;
    else
        Diagnoses(1,i) = true;
        Diagnoses(2,i) = false;
    end
end

CtrlNum = size(Controls_temp, 1);
TierSizes = [1.4 0.7];
Tiers = TierSizes .* CtrlNum - mod(TierSizes*CtrlNum,1);

perf = 1;
while(perf > 0.09)
    net = patternnet(Tiers);
    net = configure(net,CRC_Patients,Diagnoses);
    net = train(net,CRC_Patients,Diagnoses);

    y = net(CRC_Patients);
    perf = perform(net,Diagnoses,y);
end