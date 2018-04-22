function [cost,CMatrix]=Assignment(C,ismin) 
% Assignment problem solved by hungarian method. 
% 
% input: 
% C         - ϵ�����󣬿�����Ӧworkers��tasks��Ŀ��ͬ������ 
% ismin     - 1��ʾ��С�����⣬0��ʾ������� 
% ouput: 
% cost      - ���ջ��Ѵ��� 
% CMatrix   - ��Ӧ��ƥ�����Ԫ��1����λ��c_{ij}��ʾj task����� i worker�� 
% 
  
[m,n]=size(C); 
if ismin==0 
    C=max(C(:))-C; 
end 
 
%workes ��tasks��Ŀ����ͬ 
if m<n 
    C=[C;zeros(n-m,n)]; 
elseif m>n 
    C=[C zeros(m,m-n)]; 
end 
copyC=C; 
d=max(m,n);% ����ϵ�������ά�� 
C=C-repmat(min(C,[],2),1,d); 
C=C-repmat(min(C,[],1),d,1); 

while 1 
    CMatrix=zeros(d); 
    nLines=0; 
    A=(C==0); 
    idx=[]; 
    idy=[]; 
    sr=[]; 
    sc=[]; 
    while 1 
        r=sum(A,2); 
        c=sum(A,1); 
        r(sr)=0; 
        c(sc)=0; 
        trc=[r(:);c(:)]; 
        [trc,idtrc]=sort(trc,1,'ascend'); 
        [~,idn0]=find(trc'>0); 
        if ~isempty(idn0) 
            id=idtrc(idn0(1)); 
            if id>d 
                tc=A(:,id-d); 
                [~,idr]=find(tc'==1); 
                A(idr(1),:)=0;  
                nLines=nLines+1; 
                idy=[idy,idr(1)]; 
                CMatrix(idr(1),id-d)=1; 
                sc=[sc,id-d]; 
            else 
                tr=A(id,:); 
                [~,idc]=find(tr==1); 
                A(:,idc(1))=0; 
                nLines=nLines+1; 
                idx=[idx,idc(1)]; 
                CMatrix(id,idc(1))=1; 
                sr=[sr,id]; 
            end  
        else 
            break; 
        end 
    end 
    if nLines==d 
        if ismin 
            cost=sum(copyC(:).*CMatrix(:)); 
        else 
            cost=sum((max(copyC(:))-copyC(:)).*CMatrix(:)); 
        end 
        CMatrix=CMatrix(1:m,1:n); 
        break; 
    else 
        tempC=C; 
        tempC(idy,:)=[]; 
        tempC(:,idx)=[]; 
        minUnOverlap=min(tempC(:)); 
        C=C-minUnOverlap; 
        C(idy,:)=C(idy,:)+minUnOverlap; 
        C(:,idx)=C(:,idx)+minUnOverlap; 
    end 
end 
 
end