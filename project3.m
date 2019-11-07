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

z = 2;
for j = 1:n-1
    
    disp(sys_prod);
    for l = z:n
        firstRow = sys_prod(l,j);
        secondRow = -sys_prod(j,j);
        for k = 1:n+1
            sys_prod(l,k)=(firstRow*(sys_prod(j,k))+secondRow*sys_prod(l,k));
        end
    end
    
    disp("Column "+ j +":")
    disp(sys_prod);
    if(z<n)
        if(abs(sys_prod(z,z))<abs(sys_prod(z+1,z)))
            temp = sys_prod(z + 1,:);
            sys_prod(z+1,:) = sys_prod(z,:);
            sys_prod(z, :)=temp;
        end
    end
    
    z = z+1;
end

%Now that it is in upper triangular form we can solve for the three values.
disp("Solution vector:");
x=inv(sys)*prod;
disp(x);
