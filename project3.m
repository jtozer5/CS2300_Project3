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

%Zeros the element at (2,1) by multiplying the first row by 6.3, the second
%row by -8.1 and adding them to create the new second row.
firstRow = sys_prod(2,1);
secondRow = -sys_prod(1,1);
for j = 1:n + 1
    sys_prod(2,j)=(firstRow*(sys_prod(1,j))+secondRow*sys_prod(2,j));
end
disp(sys_prod);

%Multiplies the first row by -7.5 and the third row by -8.1 and add to
%create the new third row.
firstRow = sys_prod(3,1);
thirdRow = -sys_prod(1,1);
for k = 1:n+1
    sys_prod(3,k) = firstRow*(sys_prod(1,k))+thirdRow*sys_prod(3,k);
end
disp(sys_prod);
