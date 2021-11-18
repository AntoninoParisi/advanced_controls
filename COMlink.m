function COM = COMlink(link)

kinematicsParams;
COM = [0 0 0];
if(link == 1)
    COM = [ 0 0 a1/2];

end
if(link == 2)
    COM = [ a2/2 0 0];

end
if(link == 3)
    COM = [ 0 0 a3/2 ];

end
if(link == 4)
        COM = [ a4/2 0 0];

end


end