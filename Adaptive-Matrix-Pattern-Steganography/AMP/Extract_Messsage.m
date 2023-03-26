function [res, done] = Extract_Messsage(img, cb, t, t_c)
z=zeros(t,t_c);

[hh,ww] = size(img);
h=1;w=1;

end_mp = cb(1).mat;
done = 0;
res = '';

while (1)
    % extract MP
    try
        im=img((h-1)*t+1:(h-1)*t+t,(w-1)*t_c+1:(w-1)*t_c+t_c);
    catch
        return;
    end
    
    for i1=2:t
        for j1=1:t_c
            t_img=int16(im(i1,j1))-int16(im(i1-1,j1));
            z(i1,j1)=int16(t_img);
        end
    end
    
    if (z==end_mp)
        
    end
    % search in codebook
    if (z==end_mp)
        done = 1;
        return;     
    else
        for i=1:length(cb)
            if(z==cb(i).mat)
                res = [res cb(i).ch];
                break;
            end
        end
    end
    
    w=w+1;
    if w*t_c>ww
        w=1;h=h+1;
    end
end

