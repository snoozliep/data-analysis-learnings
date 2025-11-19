%This program outputs the time, day of the week, and day of a date
%Input Number of Year, Month, and Day
Year = input('Enter Year: ');
Month = input('Enter Month: ');
Day = input('Enter Day: ');
%Date Today
Today = datetime('now');
%Output
Date = datetime(Year, Month, Day);
Day_Of_The_Week = day(Date,'name');
Number_Of_Day = day(Date,'dayofweek');
Date.Format = 'MMM dd, yyyy';

%(b) Visualizations / Graphing Codes
disp("Calendar: ")
calendar(Year, Month)

disp((Day_Of_The_Week)+" is the day of the week.")
disp("   ")
disp((Number_Of_Day)+" is the number of day in the week.")
disp("   ")
%Time Left or Passed in terms of Hours:Minutes:Seconds
Timer = Date - Today;
x = (fix(days(Timer)));
%ConditionalStatement
if x < 0
    disp(abs(fix(days(Timer)))+" day/s have passed.")
elseif x > 0
    disp(abs(fix(days(Timer)))+" day/s left until the day comes! Which is:")
else 
    disp('Today is the day!!')
end
%Timer
disp("  ")
disp(Date)
%loop
if x < 0
    disp("Time passed:")
elseif x > 0
    disp("Time left:")
else 
    disp("Time Today:")
end
disp(abs(Timer))

%Holidays
H = holidays(Today, Date);
Dates = datestr(H); %datestr returns text representing the date and time in the default format.
H.Format = 'MMM dd, yyyy'; %Formats Date
disp('List of Holiday/s from Today to Desired Date: ')%Displays incoming holidays starting today, to the date user has inputted
disp(H)

%API for weather in Philippines
url = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Philippines?unitGroup=metric&include=todays&key=UJ6NLM4S42YYGXX8BX7MECSEQ&contentType=json';
data = webread(url);
c = (data.days.conditions);

%Weather
disp('Would you like to know the weather condition for today?')

%questdlg displays a pop up message asking a question to user
answer = questdlg('Would you like to know the weather condition for today?', ... %asks a question
	'Weather Today', ... %title
	'Yes, please!','Other','No thank you!','Yes, please!'); %Choices
disp(' ')
% Response
switch answer
    case 'Yes, please!'
        disp('Alrighty then! The Weather for today is:')
        disp(c)
        dessert = 1;
    case 'Other'
        disp('We currently have no feature to know the weather of other dates except for today. ')
        disp('We might consider learning more about it to satisfy your needs. Thank you!')
        disp('In case you do not want to repeat the whole process to know the date today, here it is:')
        disp(c)
        dessert = 2;
    case 'No thank you!'
        disp('Have a nice day.')
        dessert = 0;
end

%displays map of Philippines as proof of source of url
if dessert > 0
disp(' ')
disp("Here is a map")
geoplot(data.latitude,data.longitude)
title 'Philippines';
else
end


