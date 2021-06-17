clear all
warning off
tic
for x=1:50
    tbelandaimg{x} = imread(['\src\class0\',num2str(x),'.jpg']);
    tbulathijauimg{x} = imread(['\src\class1\',num2str(x),'.jpg']);
    
    tbelandaR{x}= tbelandaimg {x} (:,:,1);
    tbelandaG{x}= tbelandaimg {x} (:,:,2);
    tbelandaB{x}= tbelandaimg {x} (:,:,3);
    tbelandagray{x}= tbelandaR{1}*0.2+tbelandaG{x}*0.5+tbelandaB{x}*0.3;
    tbelandaresize{x} = imresize(tbelandagray{x},[50,50]); 
    figure(1),imshow(tbelandaimg{x});
    tbelandavector{x} = tbelandaresize{x}(:);  %Mengubah gambar tbelanda menjadi vector
    
    tbulathijauR{x}=tbulathijauimg{x}(:,:,1);
    tbulathijauG{x}=tbulathijauimg{x}(:,:,2);
    tbulathijauB{x}=tbulathijauimg{x}(:,:,3);
    tbulathijaugray{x}= tbulathijauR{x}*0.2+tbulathijauG{x}*0.5+tbulathijauB{x}*0.3;
    tbulathijauresize{x} = imresize(tbulathijaugray{x},[50,50]); 
    figure(1),imshow(tbulathijauimg{x});
    tbulathijauvector{x} = tbulathijauresize{x}(:);  %Mengubah gambar tbulathijau menjadi vector
   
    
    tbelanda{x} = tbelandavector{x}.'; %Transpose vektor tbelanda  
    tbulathijau{x} = tbulathijauvector{x}.';   %Transpose vektor tbulathijau
    
end

trtbelanda = [tbelanda{1}];
for k=1:49
    trtbelanda = [trtbelanda;tbelanda{k+1}];
end

trtbulathijau = [tbulathijau{1}];
for m=1:49
    trtbulathijau = [trtbulathijau;tbulathijau{m+1}];
end

mastertrv = [trtbelanda;trtbulathijau];
mastertrc = [zeros(50,1);ones(50,1)];

res = [];
for a=1:100
    trv=mastertrv;
    trv(a,:)=[];
    trc=mastertrc;
    trc(a)=[];
    tsv=mastertrv(a,:);
    tsc=mastertrc(a);
    
    c=knnclassify(tsv,trv,trc,7);
    res=[res ;c];
end

Con = confusionmat(mastertrc,res)
fres = classperf(mastertrc,res);
display(['Akurasi  : ' num2str(fres.CorrectRate)]);
pie(Con)

toc