clear
clc

D='E:\ppm-imgs\Results';
S = dir(fullfile(D,'*.png'));

Block_size_orderblocks=64;
MP_size_row_orderblocks=3;
MP_size_column_orderblock=2;

Block_size_orderblock = 64;

for k = 1:10000
    file = fullfile(D,S(k).name);
    Stego_Image = imread(file);
    
[hh_init,ww_init]=size(Stego_Image);
nh_initial=fix(hh_init/Block_size_orderblock);
nw_initial=fix(ww_init/Block_size_orderblock);

[HH,WW]=size(Stego_Image(:,:,3));
nw_set=((fix(WW/Block_size_orderblock) * fix(HH/Block_size_orderblock)));

hh_initial=[];
ww_initial=[];

for i=1:nh_initial
    for j=1:nw_initial
        hh_initial=[hh_initial i];
        ww_initial=[ww_initial j];
    end
end

[row_size_stego, column_size_stego] = size(Stego_Image);
% first 64x64 image in blue channel
bfirst = Stego_Image(1:64, 1:64, 3);
img_g = Stego_Image(:,:,2);
img_b = Stego_Image(:,:,3);

ord = [];

% generate codebook
blo_num_first=1;
c_b=1; 
ss=0;

block_seed_counter=0;
while (c_b~=0)
    %img=b_first((hh_initial(blo_num_first)-1)*Block_size_orderblocks+1:(hh_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks,(ww_initial(blo_num_first)-1)*Block_size_orderblocks+1:(ww_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks);
    img_g1=img_g((hh_initial(blo_num_first)-1)*Block_size_orderblocks+1:(hh_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks,(ww_initial(blo_num_first)-1)*Block_size_orderblocks+1:(ww_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks);
    [ch1, n]=MP_Generation_for_orderblocks(img_g1);
    block_seed_counter= block_seed_counter +1;

    if (nw_set == block_seed_counter)
        fprintf('Warning: Image is Simple and Smooth. Initial seeds cannot be hidden. Please change the cover image\n');
        disp(['Image id : ',num2str(k)]);
        ss = 1;
    end

    if(ss)
        break;
    end

    if (n~=0)
         % hit bp: check res of MP_Generation_for_orderblocks
         [Block_size, MP_size_row, MP_size_column, ord] = Extract_orderblocks(bfirst, ch1, MP_size_row_orderblocks, MP_size_column_orderblock);
         % imshowpair(img, cmp_img, "diff")
         c_b = 0;
    end
    blo_num_first=blo_num_first+1;
end

after_ord = [];
% remove first block
for i=1:length(ord)
    if(ord(i) ~=1)
        after_ord = [after_ord ord(i)];
    end
end
%========================================================
[HH,WW]=size(Stego_Image(:,:,3));
nw=fix(WW/Block_size);

blo_num=1;
c_b=1;
mes = [];
b = Stego_Image(:,:,3);
capacity = length(ord); % number of blocks chosen for hidding

h=[];w=[];
for i=1:capacity
    y = mod(ord(i), nw);
    if(y == 0)
        y = y+nw
    end
    x = (ord(i)-y)/nw + 1
    h = [h x];
    w = [w y];
end


fileID = fopen('myfile.txt','a+');

while (blo_num ~=capacity+1 )
    img = b((h(blo_num)-1)*Block_size+1:(h(blo_num)-1)*Block_size+Block_size,(w(blo_num)-1)*Block_size+1:(w(blo_num)-1)*Block_size+Block_size);
    img_g2 = img_g((h(blo_num)-1)*Block_size+1:(h(blo_num)-1)*Block_size+Block_size,(w(blo_num)-1)*Block_size+1:(w(blo_num)-1)*Block_size+Block_size);
   [ch1, n] = MP_Generation(img_g2,MP_size_row,MP_size_column);
    
   if (n~=0)
        [mes, done] = Extract_Messsage(img, ch1,MP_size_row,MP_size_column);
        nbytes = fprintf(fileID,'%s',mes)
        block = nw*(h(blo_num)-1)+w(blo_num);
   end
    blo_num = blo_num+1;
end
% end
end