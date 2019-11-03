% Project 3

data = dlmread('sysmat1.txt');
prod_data = dlmread('prodvec1.txt');
prod = prod_data(2:n+1);
prod = (prod)';


n = data(1);
sys = zeros(n);

i = 2;
for c = 1:n
    for r = 1:n
        sys(c, r) = data(i);
        i = i + 1;
    end
end
    
sys_prod = [sys prod]; 

disp(sys_prod)

%Gets the row of the highest first column value.
[maxNumber, row] = max(sys_prod(:,1));

%Moves the row with the largest absolute value to the top.
sys_prod([1,row],:) = sys_prod([row, 1],:);
disp(sys_prod);
