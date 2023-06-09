function fig = serie2_2extra()
% This is the machine-generated representation of a Handle Graphics object
% and its children.  Note that handle values may change when these objects
% are re-created. This may cause problems with any callbacks written to
% depend on the value of the handle at the time the object was saved.
% This problem is solved by saving the output as a FIG-file.
%
% To reopen this object, just type the name of the M-file at the MATLAB
% prompt. The M-file and its associated MAT-file must be on your path.
% 
% NOTE: certain newer features in MATLAB may not have been saved in this
% M-file due to limitations of this format, which has been superseded by
% FIG-files.  Figures which have been annotated using the plot editor tools
% are incompatible with the M-file/MAT-file format, and should be saved as
% FIG-files.

load serie2_2extra

h0 = figure('Color',[0.8 0.8 0.8], ...
	'Colormap',mat0, ...
	'FileName','\\Platao\Mestrado\Telecom\Temporario\TP503\fun��es\serie2_2extra.m', ...
	'Name','Exerc�cio extra', ...
	'PaperPosition',[18 180 576 432], ...
	'PaperUnits','points', ...
	'Position',[336 123 643 420], ...
	'Tag','Fig1', ...
	'ToolBar','none');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[443.25 129.75 27.75 15], ...
	'String','50', ...
	'Style','edit', ...
	'Tag','caixa');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.831372549019608 0.815686274509804 0.784313725490196], ...
	'ListboxTop',0, ...
	'Position',[431.25 150.75 42.75 15], ...
	'String','Valor de N', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.831372549019608 0.815686274509804 0.784313725490196], ...
	'Callback','extra2', ...
	'ListboxTop',0, ...
	'Position',[443.25 66 29.25 18], ...
	'String','Start', ...
	'Tag','Pushbutton1');
h1 = axes('Parent',h0, ...
	'Box','on', ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'Color',[1 1 1], ...
	'ColorOrder',mat1, ...
	'NextPlot','add', ...
	'Position',[0.13 0.5810982658959537 0.775 0.3439017341040462], ...
	'Tag','Axes2', ...
	'XColor',[0 0 0], ...
	'XGrid','on', ...
	'XLim',[-1 1], ...
	'XLimMode','manual', ...
	'YColor',[0 0 0], ...
	'YGrid','on', ...
	'YLim',[-0.1998995858098491 1.2], ...
	'YLimMode','manual', ...
	'ZColor',[0 0 0], ...
	'ZGrid','on');
h2 = line('Parent',h1, ...
	'Color',[0 0 1], ...
	'Tag','Axes2Line2', ...
	'XData',mat2, ...
	'YData',mat3);
h2 = line('Parent',h1, ...
	'Color',[0 0 0], ...
	'Tag','Axes2Line1', ...
	'XData',mat4, ...
	'YData',mat5);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[-0.002012072434607437 -0.43484776804367 17.32050807568877], ...
	'String','frequencia em unidades de pi', ...
	'Tag','Axes2Text4', ...
	'VerticalAlignment','cap');
set(get(h2,'Parent'),'XLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[-0.002012072434607437 1.268526553151531 17.32050807568877], ...
	'String','Magnitude de X(exp(jw))', ...
	'Tag','Axes2Text3', ...
	'VerticalAlignment','bottom');
set(get(h2,'Parent'),'Title',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',mat6, ...
	'Rotation',90, ...
	'String','Magnitude', ...
	'Tag','Axes2Text2', ...
	'VerticalAlignment','baseline');
set(get(h2,'Parent'),'YLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Position',[-1.3420523138833 1.503474735385352 17.32050807568877], ...
	'Tag','Axes2Text1', ...
	'Visible','off');
set(get(h2,'Parent'),'ZLabel',h2);
h1 = axes('Parent',h0, ...
	'Box','on', ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'Color',[1 1 1], ...
	'ColorOrder',mat7, ...
	'NextPlot','add', ...
	'Position',[0.13 0.11 0.775 0.3439017341040462], ...
	'Tag','Axes1', ...
	'XColor',[0 0 0], ...
	'XGrid','on', ...
	'XLim',[-1 1], ...
	'XLimMode','manual', ...
	'YColor',[0 0 0], ...
	'YGrid','on', ...
	'YLim',mat8, ...
	'YLimMode','manual', ...
	'ZColor',[0 0 0], ...
	'ZGrid','on');
h2 = line('Parent',h1, ...
	'Color',[0 0 1], ...
	'Tag','Axes1Line2', ...
	'XData',mat9, ...
	'YData',mat10);
h2 = line('Parent',h1, ...
	'Color',[0 0 0], ...
	'Tag','Axes1Line1', ...
	'XData',mat11, ...
	'YData',mat12);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[-0.002012072434607437 -1.599999999999997 17.32050807568877], ...
	'String','frequencia em unidades de pi', ...
	'Tag','Axes1Text4', ...
	'VerticalAlignment','cap');
set(get(h2,'Parent'),'XLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[-0.002012072434607437 1.316666666666664 17.32050807568877], ...
	'String','Fase de X(exp(jw))', ...
	'Tag','Axes1Text3', ...
	'VerticalAlignment','bottom');
set(get(h2,'Parent'),'Title',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',mat13, ...
	'Rotation',90, ...
	'String','pi radianos', ...
	'Tag','Axes1Text2', ...
	'VerticalAlignment','baseline');
set(get(h2,'Parent'),'YLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Position',[-1.3420523138833 4.999999999999991 17.32050807568877], ...
	'Tag','Axes1Text1', ...
	'Visible','off');
set(get(h2,'Parent'),'ZLabel',h2);
if nargout > 0, fig = h0; end
