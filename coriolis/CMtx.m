function C = CMtx(B)

if(class(B) ~= 'sym')
    error('B class must be sym!');
    
end

syms t1 t2 d1
symbols = [t1 d1 t2];
syms dt1 dt2 dd1
dsymbols = [dt1 dd1 dt2];

C = cast(eye(3)*0,'sym');


[r,c] = size(B);

if( r ~= c)
    error('B must be NxN!');
end


for row = 1:r % i
    
    for col = 1:r % j 
        
        for simb = 1:r % k
            
            C(row,col) = C(row,col) + diff(B(row,col),string(symbols(simb)));
            C(row,col) = C(row,col) + diff(B(row,simb),string(symbols(col)));
            C(row,col) = C(row,col) - diff(B(col,simb),string(symbols(row)));
            C(row,col) = C(row,col) * dsymbols(simb) * dsymbols(col) * 0.5;
        end
        
        C(row,col) = simplify(C(row,col));
    
    end
    
end






