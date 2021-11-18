function C = CMtx(B)

if(class(B) ~= 'sym')
    error('B class must be sym!');
    
end

syms t1 t2 d1
symbols = [t1 d1 t2];

A = cast(eye(3)*0,'sym');

F = cast(eye(3)*0,'sym');

[r,c] = size(B);

if( r ~= c)
    error('B must be NxN!');
end


for row = 1:r
    
    for col = 1:r
        
        for simb = 1:r
            
            A(row,col) = A(row,col) + diff(B(row,col),string(symbols(simb)));
            
        end
        
        A(row,col) = simplify(A(row,col));
    
    end
    
end

for i = 1:r
    
    for j = 1:r
        
        for k = 1:r
            
            F(j,k) = F(j,k) + diff(B(j,k),string(symbols(i)));
            
        end
        F(j,k) = simplify(F(j,k));
    
    end
    
end


C = A - 0.5*F;
