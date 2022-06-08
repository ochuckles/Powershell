function [ bit_flip ] = tar_test( Dest )
%%tar_test basic test of data processing function
%just tars the file and outputs a 1 for progressing powershell

fileloc = Dest;
folder = ('image_test');

addpath(fileloc);
mkdir(fileloc,folder);

tarcat = ('_t');
tarfile = strcat(folder, tarcat);

tar(tarfile,folder,fileloc);


bit_flip = 0;
end

