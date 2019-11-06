% Project 3

data = dlmread('sysmat1.txt');
prod_data = dlmread('prodvec1.txt');
n = data(1);
prod = prod_data(2:n+1);
prod = (prod)';

sys = zeros(n);

i = 2;
for c = 1:n
    for r = 1:n
        sys(c, r) = data(i);
        i = i + 1;
    end
end
    
sys_prod = [sys prod]; 
disp("The system matrix:");
disp(sys_prod)

%Gets the row of the highest first column value.
[maxNumber, row] = max(sys_prod(:,1));

%Moves the row with the largest absolute value to the top.
sys_prod([1,row],:) = sys_prod([row, 1],:);

%Zeros the element at (2,1) by multiplying the first row by 6.3, the second
%row by -8.1 and adding them to create the new second row.
firstRow = sys_prod(2,1);
secondRow = -sys_prod(1,1);
for j = 1:n + 1
    sys_prod(2,j)=(firstRow*(sys_prod(1,j))+secondRow*sys_prod(2,j));
end

%Multiplies the first row by -7.5 and the third row by -8.1 and add to
%create the new third row.
firstRow = sys_prod(3,1);
thirdRow = -sys_prod(1,1);
for k = 1:n+1
    sys_prod(3,k) = firstRow*(sys_prod(1,k))+thirdRow*sys_prod(3,k);
end
disp("Column 1:")
disp(sys_prod);

%Multiplies row 3 by -50.85, row 2 by -45.3 and add to form row
secondRow = -sys_prod(3,2);
thirdRow = sys_prod(2,2);
for l = 1:n+1
    sys_prod(3,l) = -(secondRow*(sys_prod(2,l))+thirdRow*sys_prod(3,l));
end
disp("Column 2:")
disp(sys_prod);

%Now that it is in upper triangular form we can solve for the three values.
x_3 = sys_prod(3,4)/sys_prod(3,3);
x_2=(sys_prod(2,4)-sys_prod(2,3)*x_3)/sys_prod(2,2);
x_1=(sys_prod(1,4) - sys_prod(1,3)*x_2 - sys_prod(1,2)*x_3)/sys_prod(1,1);

disp("Solution vector:");
disp(x_1);
disp(x_2);
disp(x_3);
