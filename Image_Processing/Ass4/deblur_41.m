%Group 41 Mingyang Xu 250902744, Maiduo Wu, Ziqing Shang
%implementation from note:https://owl.uwo.ca/access/lessonbuilder/item/126137504/group/35da5c11-bc8e-4651-a2dc-ab4cc461bac4/Lectures/deblur-4.pdf

function im2=deblur_41(im,h)
%the in taken h is a vector

%construct H, size NxM, n=11 from assignment
[rowsize,N]=size(im);
n=size(h,2);
M=N+n-1;
H=zeros(N,M);
%fill H with n ones
temp=ones(1,n);
for i=1:N
    H(i,(i:i+n-1))=temp;
end
H=H/n;

%construct P, combine a NxN identity matrix and a Nx(n-1) zeros matrix
%use eye(n,m) to directly generate it
P=eye(N,N+n-1);

%applying derivated equation
im2=zeros(rowsize,M);
%default constant to be 10^6(1000000)
%From testing, it appears that higher value gives better deblurred image,
%but higher noise
lagrange=1000000;
%precalculate constant to increse speed
C1=lagrange*transpose(H)*H+transpose(P)*P;
C2=transpose(lagrange*H+P);

for i=1:rowsize
    im2(i,:)=transpose(C1\C2*transpose(im(i,:)));
end


end

