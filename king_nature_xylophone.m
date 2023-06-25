function [ support_details ] = elder_care_support(alzheimer_risks, fall_risks)
%This function provides support and care for elderly individuals, helping them to remain independent and comfortable in their homes. 
%The function takes in two input parameters, Alzheimer risks and fall risks, and provides the necessary support details.

%Initialize output
support_details = {};

%Check Alzheimer risks
if alzheimer_risks > 3
    support_details{end+1} = '1.Timely medication check or a reminder system to ensure proper medication intake.';
    support_details{end+1} = '2.Frequent monitoring of patient''s behaviour changes.';
    support_details{end+1} = '3.Activities that boost cognitive skills and perceptions.';
end

%Check fall risks
if fall_risks > 3
    support_details{end+1} = '4.Regular physical exercise to increase mobility and strength.';
    support_details{end+1} = '5.Aids for walking such as a cane or a walker.';
    support_details{end+1} = '6.Falls prevention training.';
    support_details{end+1} = '7.Wearing safety belts or medical alert systems for emergency situations.';
end

%Other ways of providing support
support_details{end+1} = '8.Providing transportation to and from medical appointments.';
support_details{end+1} = '9.Assisting with meal preparation.';
support_details{end+1} = '10.Helping with housekeeping and laundry.';
support_details{end+1} = '11.Outings to places of interest.';
support_details{end+1} = '12.Providing social interaction and companionship.';
support_details{end+1} = '13.Financial assistance for medical bills and other expenses.';

end