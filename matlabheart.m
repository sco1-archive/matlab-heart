% Setup data set
% Equation from: http://slodive.com/web-development/google-tricks/

stepsize = 0.001; % Smaller step size: more heart shaped, longer play time
x = -1.55:stepsize:1.55;
y = (sqrt(cos(x)).*cos(200.*x)+sqrt(abs(x))-0.7).*(4-x.*x).^0.01;

xmin = -1.75; xmax =  1.75;
ymin = -1.75; ymax =  1.75;

% Create video object, write a frame for each iteration of the loop
% *.mp4 capped at 173 frames for the figure size

framerate = 173; % frames per second
heartvid = VideoWriter('matlabheart.mp4','MPEG-4');
heartvid.FrameRate = framerate;
open(heartvid);

% DIY comet plot, super inefficient
for ii = 1:length(x)
   plot(x(1:ii),y(1:ii),'-r'); % data trace
   hold on;
   plot(x(ii),y(ii),'og'); % comet head
   axis([xmin xmax ymin ymax]); 
   hold off
   
   frame = getframe;
   writeVideo(heartvid, frame);
end
close(heartvid);