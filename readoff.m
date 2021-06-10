clc;
clear;
close all;
fid = fopen('sphere_new.off','r');
if fid<0
    error('open faild!');
end
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
    fdata = sscanf(face,'%d %d %d %d');
    flist(:,fnum) = fdata(2:end)+1;
end
trimesh(flist',vlist(1,:)',vlist(2,:)',vlist(3,:)');
load('x1.mat');
load('y1.mat');
load('z1.mat');
figure(2);
surf(xoff,y0ff,zoff)