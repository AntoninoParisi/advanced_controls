function P = HTrans(M,p)

[r,c] = size(p);

if(c>r)
    p=p';
end

[r,c] = size(M);

if(c~=r)
    ME = MException('M must be NxN!');
    throw(ME)
end
p = [p;1];
P = M*p;