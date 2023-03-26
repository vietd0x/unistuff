clear
clc
D ='E:\ppm-imgs';
d = {'T', 'D'};
csvwrite ('Result-ten.ods', d);


S = dir(fullfile(D,'*.ppm')); 
Block_size = 128;
MP_size_row = 3;
MP_size_column = 2;


Block_size_orderblocks=64;
MP_size_row_orderblocks=3;
MP_size_column_orderblock=2;
Str_Block_size = num2str(Block_size);
Str_MP_size_row = num2str(MP_size_row);
Str_MP_size_column = num2str(MP_size_column);
Block_size_orderblock = 64;

for k = 1:10000
    file = fullfile(D,S(k).name);
    Cover_Image = imread(file);
    
Generating_random_text;
Secret_Message=fileread('random.txt');
[row_size_cover,column_size_cover]= size(Cover_Image(:,:,3));


tStart = tic;
temp_Cover_Image=Cover_Image;
[ww, hh]=Preprocessing_algorithm(Cover_Image,Block_size);
[HH,WW]=size(Cover_Image(:,:,3));
nw=fix(WW/Block_size);
nw_set=((fix(WW/Block_size_orderblock) * fix(HH/Block_size_orderblock)));

text1=[];
w=[];
h=[];
ww1=[];
hh1=[];
area11=[];
area12=[];
area21=[];
area22=[];
ob=0;

text1=Str_Block_size;
text1=[text1 ']'];
text1=[text1 Str_MP_size_row];
text1=[text1 ']'];
text1=[text1 Str_MP_size_column];
text1_temp=text1;

img_t=Cover_Image;
b_first=img_t(:,:,3);
b1_first=img_t(:,:,3);
img_g=img_t(:,:,2);

[hh_init,ww_init]=size(b_first);

nh_initial=fix(hh_init/Block_size_orderblock);
nw_initial=fix(ww_init/Block_size_orderblock);

hh_initial=[];
ww_initial=[];

for i=1:nh_initial
    for j=1:nw_initial
        hh_initial=[hh_initial i];
        ww_initial=[ww_initial j];
    end
end
last_order_block_h = hh(length(hh))
last_order_block_w = ww(length(ww));

for i=1:length(h)
    text1=[text1 ']'];
    block = nw*(h(i)-1)+w(i);  
    text1 =[text1 num2str(block)];
end
text1=[text1 ']'];

blo_num_first=1;

c_b=1; % counter_block

    while (~isempty(text1_temp) || c_b==0 )
    %img=b_first((hh_initial(blo_num_first)-1)*Block_size_orderblocks+1:(hh_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks,(ww_initial(blo_num_first)-1)*Block_size_orderblocks+1:(ww_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks);
    img=b_first(1:64, 1:64);
    img_g1=img_g((hh_initial(blo_num_first)-1)*Block_size_orderblocks+1:(hh_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks,(ww_initial(blo_num_first)-1)*Block_size_orderblocks+1:(ww_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks);
    [ch1, n]=MP_Generation_for_orderblocks(img_g1);
  
    if (n~=0)
        
         [img, text1_temp, c_b]=Embedding_orderblocks(ch1,text1_temp,img);
         s=img_t((hh_initial(blo_num_first)-1)*Block_size_orderblocks+1:(hh_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks,(ww_initial(blo_num_first)-1)*Block_size_orderblocks+1:(ww_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks,1:2);
         s(:,:,3)=img;
    end
    b1_first((hh_initial(blo_num_first)-1)*Block_size_orderblocks+1:(hh_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks,(ww_initial(blo_num_first)-1)*Block_size_orderblocks+1:(ww_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks)=img;
    blo_num_first=blo_num_first+1;
    end
end
Cover_Image(:,:,3)=b1_first;

text=Secret_Message;
ltxt=length(text);
img_t=Cover_Image;
b=img_t(:,:,3);
b1=img_t(:,:,3);
blo_num=1;
c_b=1;
useful_block=0;
test_work=0;

capacity = length(w); % number of blocks chosen for hidding
while ((~isempty(text) || c_b==0)&& blo_num ~=capacity+1 )
    test_work = test_work+1;
    img = b((h(blo_num)-1)*Block_size+1:(h(blo_num)-1)*Block_size+Block_size,(w(blo_num)-1)*Block_size+1:(w(blo_num)-1)*Block_size+Block_size);
    img_g2 = img_g((h(blo_num)-1)*Block_size+1:(h(blo_num)-1)*Block_size+Block_size,(w(blo_num)-1)*Block_size+1:(w(blo_num)-1)*Block_size+Block_size);
   [ch1, n] = MP_Generation(img_g2,MP_size_row,MP_size_column);
    
   if (n~=0) 
        useful_block=useful_block+1;
        old_text_size= length(text);
        aaa = img;
        [img, text, c_b] = Embedding(ch1,text,img,MP_size_row,MP_size_column);
        new_text_size= length(text);
        three_layers_of_stego_block = Cover_Image((h(blo_num)-1)*Block_size+1:(h(blo_num)-1)*Block_size+Block_size,(w(blo_num)-1)*Block_size+1:(w(blo_num)-1)*Block_size+Block_size,1:2);
        three_layers_of_stego_block(:,:,3) = img;
        block = nw*(h(blo_num)-1)+w(blo_num);
   end
    
    b1((h(blo_num)-1)*Block_size+1:(h(blo_num)-1)*Block_size+Block_size,(w(blo_num)-1)*Block_size+1:(w(blo_num)-1)*Block_size+Block_size)=img;
    blo_num = blo_num+1;
end

tEnd = toc(tStart);

if  ~isempty(text)
     numb_of_hidd_char=ltxt-length(text);
     Stego_image=Cover_Image;
     Stego_image(:,:,3)=b1;
     folder='E\Results';
     imwrite(Stego_image,fullfile(folder,sprintf('%d_Hidden_characters_%d.ppm',k, numb_of_hidd_char)));
else
    numb_of_hidd_char = ltxt-length(text);
     Stego_image = Cover_Image;
     Stego_image(:,:,3) = b1;
     folder='E:\ppm-imgs\Results';
     imwrite(Stego_image,fullfile(folder, S(k).name), 'PNG');
end
change = sum(Cover_Image(:)~=Stego_image(:))/numel(Cover_Image);
d= [tEnd, change];
dlmwrite('Result-ten.ods',d,'-append');