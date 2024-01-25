baseFolder = 'Z:\Selwyn_Aeolis\0.0mSLR_Run_1\Updated_Aeolis\ModDay_Veg_Gradients\';
%crestFolder = 'Z:\Selwyn_Aeolis\0.0mSLR_Run_1\Updated_Aeolis\ModDay_Veg_Gradients';

for i = 1:63
    cd(['Z:\Selwyn_Aeolis\0.0mSLR_Run_1\Updated_Aeolis\ModDay_Veg_Gradients\simulation' num2str(i, '%05.0f') '\']);
    myArray = load('veg.grd');
    for x = 1:3
        x
        count = 1;
        zeros = 0;
        arr_size = length(myArray(:,x))
        crest_max = 3; % Change this value for each gradient
        while count <= arr_size
            if myArray(count,x) == 0
                zeros = zeros + 1;
                count = count + 1;
                disp("equals zero")
            else
                disp('number')
                veg_inc = crest_max / (arr_size - zeros)
                disp(['veg_inc ' num2str(veg_inc)])
                myArray(count,x) = myArray(count-1,x) + veg_inc;
                count = count + 1;
            end
        end
    %save('veg.grd', 'myArray', '-ascii');
    %
    cd(baseFolder)
    end
end 
%disp(myArray)
% for i = 64:126
%     cd(['Z:\Selwyn_Aeolis\0.0mSLR_Run_1\Updated_Aeolis\ModDay_Veg_Gradients\simulation000' num2str(i) '\']);
%     myArray = load('veg.grd');
%     count = 1;
%     zeros = 0;
%     arr_size = length(myArray);
%     crest_max = 35; % Change this value for each gradient
%     
%     while count <= arr_size
%         if myArray(count) == 0
%             zeros = zeros + 1;
%             count = count + 1;
%         else
%             veg_inc = crest_max / (arr_size - zeros);
%             % disp(['veg_inc ' num2str(veg_inc)]);
%             myArray(count) = myArray(count - 1) + veg_inc;
%             count = count + 1;
%         end
%     end
%     save('veg.grd', 'myArray', '-ascii');
%     cd(baseFolder)
% end
% disp(myArray)
% for i = 127:189
%     cd(['Z:\Selwyn_Aeolis\0.0mSLR_Run_1\Updated_Aeolis\ModDay_Veg_Gradients\simulation' num2str(i, '%05.0f') '\']);
%     myArray = load('veg.grd');
%     count = 1;
%     zeros = 0;
%     arr_size = length(myArray);
%     crest_max = 67; % Change this value for each gradient
%     
%     while count <= arr_size
%         if myArray(count) == 0
%             zeros = zeros + 1;
%             count = count + 1;
%         else
%             veg_inc = crest_max / (arr_size - zeros);
%             % disp(['veg_inc ' num2str(veg_inc)]);
%             myArray(count) = myArray(count - 1) + veg_inc;
%             count = count + 1;
%         end
%     end
%     save('veg.grd', 'myArray', '-ascii');
%     cd(baseFolder)
% end
% disp(myArray)
