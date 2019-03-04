maindir='D:\Users\Yunjie\Documents\courses\CS559 Biometrics\Assignment\Assignment2\LG2200-2008-03-11_13\2008-03-11_13'
subdir =  dir( maindir );   % ???????  
   
 for i = 1 : length( subdir )  
    if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) ||  ~subdir( i ).isdir )   % ????????  
        continue;  
    end  
      
    subdirpath = fullfile( maindir, subdir( i ).name, '*.tiff' );  
    images = dir( subdirpath );   % ????????????jpg???  
       
    % ??????  
 
     imagepath = fullfile( maindir, subdir( i ).name, images( 12 ).name  );  
     [A, B]=createiristemplate( imagepath );   % ?????????? 
     fulldir=strcat(maindir,'\',subdir(i).name,'\');
     save([fulldir, 'templatemask.mat'], 'A','B');
 
 end 