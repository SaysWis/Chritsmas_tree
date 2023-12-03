%% Christmas Tree
clear, clc, close all

%%
fig = figure 

%% Tree drawing
drawtree()

%% Presents drawing
drawPresent(2*0.03,-0.005,-0.1,0.1,0.1,0.1);
drawPresent(-4*0.03,-0.005,-0.1,0.05,0.1,0.1);
drawPresent(-6*0.03,-0.005,-0.1,-0.1,0.04,0.05);
drawPresent(-5*0.03,-0.05,-0.1,-0.1,0.04,0.05);

%% Add snow
letitsnow(fig, 0.8)
pause(15)
close all

%% Private functions
function drawtree()
    hold on 
    N = 6^5; c = 50; k = randi(6,c,1); l = randperm(N,c);
    q = @(x) rand(N,1); a = q()*2*pi; z = q(); r = .4*(1-z); t = q();
    x = r.*cos(a); y = r.*sin(a); P = {'ro','ys','md','b^','kh','c*'};
    scatter3(x.*t,y.*t,z,[],[zeros(N,1) (t.*r).^.6 zeros(N,1)],'*')
    plot3(0,0,1.05,'rp','markers',12,'markerf','r')
    for i = 1:6
        L = l(k==i);
        plot3(x(L),y(L),z(L),P{i},'markers',8,'linew',2);
    end

    [X,Y,Z] = cylinder(.025,30);
    surf(X,Y,-Z*.1)
    view(3, 9)
    axis equal off
end

function drawPresent(dx,dy,dz,scalex,scaley,scalez)
    %the standard present coordinates
    presentX=[0.5 0.5 0.5 0.5 0.5; 0 1 1 0 0; 0 1 1 0 0; 0 1 1 0 0; 0.5 0.5 0.5 0.5 0.5];
    presentY=[0.5 0.5 0.5 0.5 0.5; 0 0 1 1 0; 0 0 1 1 0; 0 0 1 1 0; 0.5 0.5 0.5 0.5 0.5];
    presentZ=[0 0 0 0 0; 0 0 0 0 0; 0.5 0.5 0.5 0.5 0.5; 1 1 1 1 1; 1 1 1 1 1];

    %draw some presents with random colors
    %scale present and move it to the right place and get the plot handle
    myHandle=surf((presentX*scalex+dx),(presentY*scaley+dy), (presentZ*scalez+dz));
    %some random color map
    randColorMap(:,:,1)=repmat(rand,[5,5]);%r component
    randColorMap(:,:,2)=repmat(rand,[5,5]);%g component
    randColorMap(:,:,3)=repmat(rand,[5,5]);%b component
    
    %Assign colormap just to the plot handle object of the present, so the tree
    %does not change color
    set(myHandle,'CData',randColorMap)

end