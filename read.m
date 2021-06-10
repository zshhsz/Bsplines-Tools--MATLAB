clc;
clear;
close all;
%% 读入sphere_new.off文件
fid = fopen('sphere_new.off');
string = fgetl(fid);
num = fgetl(fid);
count = sscanf(num,'%d %d %d');
numVertices = count(1);
numFaces = count(2);
vlist = zeros(3,numVertices);
for vnum = 1:numVertices
    vert = fgetl(fid);
    vdata = sscanf(vert,'%f %f %f');
    vlist(:,vnum) = vdata;
end
flist = zeros(3,numFaces);
for fnum = 1:numFaces
    face = fgetl(fid);
    fdata = sscanf(face,'%d %d %d');
    flist(:,fnum) = fdata(2:end)+1;
end
trimesh(flist',vlist(1,:)',vlist(2,:)',vlist(3,:)');

%% 对球进行四边形划分
load('x1.mat');
surf(xoff,y0ff,zoff)
