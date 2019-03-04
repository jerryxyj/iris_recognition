probemaindir =  'D:\Users\Yunjie\Documents\courses\CS559 Biometrics\Assignment\Assignment2\LG2200-2010-04-27_29\2010-04-27_29';
prosubdir =  dir( probemaindir );  
M= zeros(89,221);
for j = 1 : length( prosubdir )
    if( isequal( prosubdir( j ).name, '.' ) ||  isequal( prosubdir( j ).name, '..' ) ||  ~prosubdir( j ).isdir )   % ????????  
        continue;  
    end
     probefilename=strcat(probemaindir,'\',prosubdir(j).name,'\','templatemask.mat');    
     C=load(probefilename,'A');
     D=load(probefilename,'B');
     M(1,j+1)= str2num(prosubdir(j).name);

maindir = 'D:\Users\Yunjie\Documents\courses\CS559 Biometrics\Assignment\Assignment2\LG2200-2008-03-11_13\2008-03-11_13';  
subdir =  dir( maindir );   
   
   for i = 1 : length( subdir )  
       if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) ||  ~subdir( i ).isdir )   % ????????  
        continue;  
       end  
      
     filename=strcat(maindir,'\',subdir(i).name,'\','templatemask.mat');    
     E=load(filename,'A');
     F=load(filename,'B');
     hd=gethammingdistance(C.A,D.B,E.A,F.B,1);
     M(i+1,1)=str2num(subdir(i).name);
     M(i+1, j+1)= hd;

   end 
   
end
comparedhmvalue='D:\Users\Yunjie\Documents\courses\CS559 Biometrics\Assignment\Assignment2\hd\';
dirfilename=strcat(comparedhmvalue,'Right eye_LG2200-2008-03-11_13_LG2200-2010-04-27_29_shift=-8-8.xlsx'); 
xlswrite(dirfilename,M)