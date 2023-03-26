function [b,t1,t2,ord] = Extract_orderblocks(img, cb, t, t_c)
%EXTRACT_ORDERBLOCKS Summary of this function goes here
%   Detailed explanation goes here
z=zeros(t,t_c);

[hh,ww] = size(img);
h=1;w=1;
continue_t=1;

% seperate 
sep_mp = cb(2).mat;
end_mp = cb(1).mat;
tmp_s = '';

res = [];

while (1)
    invalid_blo=0;
    % extract MP
    im=img((h-1)*t+1:(h-1)*t+t,(w-1)*t_c+1:(w-1)*t_c+t_c);
    im_t=im;
    
    for i1=2:t
        for j1=1:t_c
            t_img=int16(im(i1,j1))-int16(im(i1-1,j1));
            z(i1,j1)=int16(t_img);
        end
    end
    
    if (z==end_mp)
        b = res(1); t1=res(2); t2=res(3);
        ord = res(4:end);
        return;
    end
    % search in codebook
    if (z==sep_mp)
        % seperate char
        res = [res, str2num(tmp_s)];
        tmp_s = '';     
    else
        for i=1:length(cb)
            if(z==cb(i).mat)
                tmp_s = [tmp_s cb(i).hi];
                break;
            end
        end
    end
    
    w=w+1;
    if w*t_c>ww
        w=1;h=h+1;
    end
end

% this part use for putting the end of block point or end of text point

% if(isempty(txt)==1)
%     if(num~=0) 
%         invalid_blo=1;
%         while(invalid_blo==1 && num~=0)
%             invalid_blo=0;
%             im=img((h-1)*t+1:(h-1)*t+t,(w-1)*t_c+1:(w-1)*t_c+t_c);
%             im_t=im;
%             for i=2:t
%                 for j=1:t_c
%                     img_t=(int16(im(i-1,j))+int16(charac(1).mat(i,j)));
%                     im(i,j)=uint8(img_t);
%                     if(img_t>255 || img_t<0)
%                         invalid_blo=1;
%                     end
%                 end
%             end
%             if(invalid_blo==1)
%                 im=Null_Matrix(im_t,t,t_c);
%             end
%             img((h-1)*t+1:(h-1)*t+t,(w-1)*t_c+1:(w-1)*t_c+t_c)=im;
%             num=num-1;
%             w=w+1;
%             if w*t_c>ww
%                 w=1;h=h+1;
%             end
%             if(num==0 && invalid_blo==1)
%                 continue_t=0;  % When all the secret message characters are embedded, but the block did not have more space to hide the "end of message" pattern in this block, in this case, we embed the "end of message" pattern in the next selected B by B block. If the current B by B block is the last block in this image or the next block(s) does not have any space for hiding, no error will happen.
%             end
%         end
%     end
% else
%     continue_t=0; % if the last t1xt2 matrix of this block is used for hiding the last character of the message
% end
end

