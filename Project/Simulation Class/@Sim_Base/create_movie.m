function create_movie(S)
%CREATE_MOVIE Summary of this function goes here
%   Detailed explanation goes here
loops=length(S.t_history);
%M(loops) = struct('cdata',[],'colormap',[]);

writerObj = VideoWriter(S.file_name,'MPEG-4');
writerObj.FrameRate = 30;
open(writerObj);
set(gca,'nextplot','replacechildren');
set(gcf,'Renderer','zbuffer');
for i = 1:loops
%figure('Units','normalized','Position',[0 0 1 1])
S.plot_layers(S.t_history(i))
frame = getframe(gcf);
writeVideo(writerObj,frame);
close
end
close(writerObj);
winopen([S.file_name,'.mp4'])
