% homogenuos transformation M is 3x4 and p is 3x1
function P = Htrans(M,p)

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