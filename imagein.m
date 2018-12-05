function [I, MAP] = imagein(path)
%IMAGEIN Read image in from current-working or specified directory.
% I = IMAGEIN displays a window containing all the files in the
% current directory, and saves in I the image selected from the
% current directory.
% [I, MAP] = IMAGEIN variable MAP is required to be an output
% argument when the image being read is an indexed image.
% [ . . .] = IMAGEIN('PATH') is used when the image to be read
% resides in a specified directory. For example, the input
% argument 'C:\MY_WORK\MY_IMAGES' opens a window showing
% the contents of directory MY_IMAGES. An image selected from
% that directory is read in as image I.

if nargin < 1
    path = pwd;
end

original_directory = pwd;
cd(path);
[FileName, PathName] = uigetfile('*.*', 'Image Open');
if isequal(FileName, 0) || isequal(PathName, 0)
    disp('Image input canceled.');
    I = [];
    MAP = [];
else
    [I, MAP] = imread(FileName);
end
cd(original_directory);