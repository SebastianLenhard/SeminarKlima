%% Thermal inertia
fileID = fopen('../Data/global_ti_60n_50s_8ppd.img');
A = fread(fileID);
Afloat = double(typecast( uint8(A), 'single'));
imgdata = reshape(Afloat, 2880, 882)'; %8pixls/degree [-50.125 60.125]
thermalImpulse = zeros(1440, 2880);
thermalImpulse((1440/2)-(60.125*8) : (1440/2)+(50.125*8)-1,:) = imgdata;
save('thermalImpulse.mat', 'thermalImpulse');
I = mat2gray(thermalImpulse);
figure(1)
imshow(I);

%% Albedo
fileID = fopen('../Data/global_albedo_8ppd.img');
A = fread(fileID);
Afloat = double(typecast( uint8(A), 'single'));
albedo = reshape(Afloat, 2880, 1440)'; %8pixls/degree
save('albedo.mat', 'albedo');
I = mat2gray(albedo);
figure(2);
imshow(I);
% figure(2)
% histogram(img)
