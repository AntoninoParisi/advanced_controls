function C = CMtx(B)

if(class(B) ~= 'sym')
    error('B class must be sym!');
    
end

syms t1 t2 d1
symbols = [t1 d1 t2];
syms dt1 dt2 dd1
dsymbols = [dt1 dd1 dt2];

A = cast(eye(3)*0,'sym');

F = cast(eye(3)*0,'sym');

[r,c] = size(B);

if( r ~= c)
    error('B must be NxN!');
end


for row = 1:r
    
    for col = 1:r
        
        for simb = 1:r
            
            A(row,col) = A(row,col) + diff(B(row,col),string(symbols(simb)))*dsymbols(simb)*dsymbols(col);
            
        end
        
        A(row,col) = simplify(A(row,col));
    
    end
    
end

for i = 1:r
    
    for j = 1:r
        
        for k = 1:r
            
            F(j,k) = F(j,k) + diff(B(j,k),string(symbols(i)))*dsymbols(row)*dsymbols(col);
            
        end
        F(j,k) = simplify(F(j,k));
    
    end
    
end

syms DQ1 DQ2 DQ3 real
C = A - 0.5*F;
