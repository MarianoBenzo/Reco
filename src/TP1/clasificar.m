
function [matrix] = clasificar( n,matrix,mu1,mu2,mu3,mu4,mu5,mu6,m1,n1)
for i=1:m1
  
    for j=1:n1
        
    if(n(i,j,1)==mu1(1) & n(i,j,2)==mu1(2) & n(i,j,3)==mu1(3) )
    matrix(i,j)=1;
    
    elseif( n(i,j,1)==mu2(1) & n(i,j,2)==mu2(2) & n(i,j,3)==mu2(3) )
    matrix(i,j)=2; 
        
    elseif( n(i,j,1)==mu3(1) & n(i,j,2)==mu3(2) & n(i,j,3)==mu3(3) )
    matrix(i,j)=3;
   
    elseif( n(i,j,1)==mu4(1) & n(i,j,2)==mu4(2) & n(i,j,3)==mu4(3) )
    matrix(i,j)=4;
   
    elseif( n(i,j,1)==mu5(1) & n(i,j,2)==mu5(2) & n(i,j,3)==mu5(3) )
    matrix(i,j)=5;
   
    elseif( n(i,j,1)==mu6(1) & n(i,j,2)==mu6(2) & n(i,j,3)==mu6(3) )
    matrix(i,j)=6;
    else
    matrix(i,j)=7;
    end
    end
end

end

