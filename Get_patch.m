function [patch] = Get_patch(img, center, r)
%PATCH 此处显示有关此函数的摘要
%   此处显示详细说明
sizeX = size(img,1);
sizeY = size(img,2);
up = center(1,1) - r;
down = center(1,1) + r;
left = center(1,2) - r;
right = center(1,2) + r;

if up < 1
    up = 1;
end
if down > sizeX
    down = sizeX;
end
if left < 1
    left = 1;
end
if right > sizeY
    right = sizeY;
end

patch = img(up:down,left:right);

end

