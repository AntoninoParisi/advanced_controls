
params
hold on
j = {'*r','*g','*b','*y'};
for i = 1:4
t = Tmtx(i,dh_table_s);
t = t(1:3,4);
k = R_i{i}*t;
k = eval(subs(k,{t1,d1,t2},th(2:end)));
disp(k)

scatter3(k(1),k(2),k(3),2000,j{i})
hold on

end