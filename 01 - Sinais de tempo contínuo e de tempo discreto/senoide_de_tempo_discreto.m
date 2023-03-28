% Sequências senoidias de tempo discreto 
% para diferentes frequências

clc
close
clear
format rat

% frequências discretas dadas em radianos
omega_0 = linspace(0, 2*pi, 17);
nImages = length(omega_0);

n = 0:50;

%% Geração do GIF animado
% Referência: https://www.mathworks.com/help/matlab/ref/imwrite.html#btv452g-1

% Captura a sequência de plots
fig = figure;
for idx = 1:length(omega_0)
    x = cos(omega_0(idx).*n);
    stem(n,x,'k','LineWidth',2)
    xlabel('amostras')
    ylabel('amplitude')
    title(['x[n] = cos(' num2str(omega_0(idx)/pi,'%.3f') '\pi\cdotn)'])
    ax = gca; ax.FontSize = 16;
    drawnow
    frame = getframe(fig);
    im{idx} = frame2im(frame);
end
close;

% Plota a série de imagens em uma única figura
figure;
subplot_nrows = round(nImages/2);
for idx = 1:nImages
    subplot(subplot_nrows,subplot_nrows,idx)
    imshow(im{idx});
end

% Save the nine images into a GIF file. Because 
% three-dimensional data is not supported for GIF files, 
% call rgb2ind to convert the RGB data in the image to an 
% indexed image A with a colormap map. To append multiple
% images to the first image, call imwrite with the 
% name-value argument WriteMode set to "append".
filename = "D:\IFMG\Disciplinas\Sinais-e-sistemas\Aulas\2023\FIGURAS\01 - Sinais de tempo contínuo e de tempo discreto\testAnimated.gif"; % Specify the output file name
for idx = 1:nImages
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",2);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",2);
    end
end
close;
