% Project 3

data = dlmread('sysmat1.txt');
prod_data = dlmread('prodvec1.txt');
prod = prod_data(2:n+1);
prod = (prod)';


n = data(1);
sys_data = zeros(n);

i = 2;
for c = 1:n
    for r = 1:n
        sys_data(c, r) = data(i);
        i = i + 1;
    end
end
    
matrix = [sys_data prod]; 

disp(matrix)