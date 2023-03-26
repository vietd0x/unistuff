clear
clc
D ='E:\ppm-imgs';
d = {'T', 'D'};
csvwrite ('Result-ten.ods', d);

S = dir(fullfile(D,'*.ppm')); 
Block_size = 128;
MP_size_row = 3;
MP_size_column = 2;

% conver B, t1, t2 to string to embbed
Block_size_orderblocks=64;
MP_size_row_orderblocks=3;
MP_size_column_orderblock=2;
Str_Block_size = num2str(Block_size);
Str_MP_size_row = num2str(MP_size_row);
Str_MP_size_column = num2str(MP_size_column);
Block_size_orderblock = 64;

for k = 1:10000
    % read file path
    file = fullfile(D,S(k).name);
    Cover_Image = imread(file);
    %- image(Cover_Image)
    
Generating_random_text;
Secret_Message=fileread('random.txt');
[row_size_cover,column_size_cover]= size(Cover_Image(:,:,3));

% The tic function records the current time, 
% and the toc function uses the recorded value to calculate the elapsed time.
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

% B, t1, t2 for first embedded 
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

% redChannel = Cover_Image(:, :, 1);
% greenChannel = Cover_Image(:, :, 2);
% blueChannel = Cover_Image(:, :, 3);

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

for i=1:length(hh)
    text1=[text1 ']'];
    block = nw*(hh(i)-1)+ww(i);  
    text1 =[text1 num2str(block)];
end
text1=[text1 ']'];

blo_num_first=1;
c_b=1; 
ss=0;
if(isempty(ww)==1)
    fprintf('Warning: No message can be hidden in this image. Please change the cover image\n');
    disp(['Image id : ',num2str(k)]);
    continue;
else
    block_seed_counter=0;
    while (~isempty(text1) || c_b==0 )
    %img=b_first((hh_initial(blo_num_first)-1)*Block_size_orderblocks+1:(hh_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks,(ww_initial(blo_num_first)-1)*Block_size_orderblocks+1:(ww_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks);
    img = b_first(1:64, 1:64);
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
         cmp_img = img; % for compare reason.
         % hit bp: check res of MP_Generation_for_orderblocks
         [img, text1, c_b] = Embedding_orderblocks(ch1,text1,img);
         % imshowpair(cmp_img,img,"diff")
         
         area11 = [area11 (hh_initial(blo_num_first)-1)*Block_size_orderblocks+1];% the location of the beginning row
         area21 = [area21 (hh_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks]; % the beginning of the first column
         area22 = [area22 (ww_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks];     
         hh1 = [hh1 hh_initial(blo_num_first)];
         area12 = [area12 (ww_initial(blo_num_first)-1)*Block_size_orderblocks+1];
         ww1 = [ww1 ww_initial(blo_num_first)];
         s=img_t((hh_initial(blo_num_first)-1)*Block_size_orderblocks+1:(hh_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks,(ww_initial(blo_num_first)-1)*Block_size_orderblocks+1:(ww_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks,1:2);
         s(:,:,3)=img;
    end
    %b1_first((hh_initial(blo_num_first)-1)*Block_size_orderblocks+1:(hh_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks,(ww_initial(blo_num_first)-1)*Block_size_orderblocks+1:(ww_initial(blo_num_first)-1)*Block_size_orderblocks+Block_size_orderblocks)=img;
    b1_first(1:64,1:64)=img;
    blo_num_first=blo_num_first+1; % need set bp here after into above condition
    end

Cover_Image(:,:,3)=b1_first;
% aaa = Cover_Image(:,:,3)==temp_Cover_Image(:,:,3)
% aaa(1:64, 193:256)
% imshowpair(temp_Cover_Image(:,:,3), Cover_Image(:,:,3), "diff")
if Block_size==Block_size_orderblocks
    for i=1:length(ww)
        flag=0;
        for j=1:length(ww1)
            if(ww(i)==ww1(j)&& hh1(j)==hh(i))
                flag=1;
                ob=ob+1;
                break;
            end
        end
        if(flag==0)
            w=[w ww(i)];
            h=[h hh(i)];
        end
    end
else
    %[w, h]= Eliminating_blocks_with_overlap_by_orderblocks(Cover_Image,Block_size,Block_size,Block_size_orderblocks,area11,area21,area12,area22);
    for i=1:length(ww)
        if(ww(i)== 1 && hh(i)==1)
            continue;
        end
        w=[w ww(i)]; 
        h=[h hh(i)];
        
    end
end

for i=1:length(h)
    text1_temp=[text1_temp ']'];
    block = nw*(h(i)-1)+w(i);  
    text1_temp =[text1_temp num2str(block)];
end
text1_temp=[text1_temp ']'];

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
        % imshowpair(img, aaa, "diff")
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
     tmp_fileName = strcat(S(k).name, '.png');
     imwrite(Stego_image,fullfile(folder, tmp_fileName), 'PNG');
end
end
change = sum(Cover_Image(:)~=Stego_image(:))/numel(Cover_Image);
d= [tEnd, change];
dlmwrite('Result-ten.ods',d,'-append');
end
