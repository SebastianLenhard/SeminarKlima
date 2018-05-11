% GUI for THC calculations
%Jonas Gruendler, HSR 

function myui (solution, x0, parameter)
s = parameter;
N = 800;
ss = 0.5;

% create figure
f = figure('Visible','off');
update;

%create Sliders
salinity_Sp = uicontrol(f, 'Style', 'slider',... 
               'Min', 0.03, 'Max', 0.05, 'Value', x0(4),...
               'Position', [400 10 120 20]);
addlistener(salinity_Sp, 'Value', 'PostSet', @salinity_SpCallBack);

salinity_Se = uicontrol(f, 'Style', 'slider',... 
               'Min', 0.03, 'Max', 0.05, 'Value', x0(6),...
               'Position', [400 48 120 20]);
addlistener(salinity_Se, 'Value', 'PostSet', @salinity_SeCallBack);

temp_Tp = uicontrol(f, 'Style', 'slider',... 
               'Min', 5, 'Max', 20, 'Value', x0(1),...
               'Position', [400 86 120 20]);
addlistener(temp_Tp, 'Value', 'PostSet', @temp_TpCallBack);

temp_Te = uicontrol(f, 'Style', 'slider',... 
               'Min', 5, 'Max', 20, 'Value', x0(3),...
               'Position', [400 124 120 20]);
addlistener(temp_Te, 'Value', 'PostSet', @temp_TeCallBack);
%create button
btn = uicontrol('Style', 'pushbutton', 'String', 'Graphs',...
                   'Position', [20 20 80 20],...
                   'Callback', @btnCallBack);
%create text             
Salinity_SpTxt = uicontrol('Style','text',...
    'Position',[520 10 30 20],...
    'String','Salnity Sp');

Salinity_SeTxt = uicontrol('Style','text',...
    'Position',[520 48 30 20],...
    'String','Salnity Se');

temp_TpTxt = uicontrol('Style','text',...
    'Position',[520 86 30 20],...
    'String','Temp Tp');

temp_TeTxt = uicontrol('Style','text',...
    'Position',[520 124 30 20],...
    'String','Temp Te');

% TODO: Create Values for salinity and temp



f.visible = 'on'

    function salinity_SpCallBack(hObj, event)
        x0(4) = get(event.AffectedObject, 'Value');
        set(salinity_Sp, 'String', num2str(roundn(x0(4)), -2))); 
    end

    function salinity_SeCallBack(hObj, event)
        x0(6) = get(event.AffectedObject,'Value');
        set(velVal, 'String', num2str(roundn(x0(6),-5)));
        update;
    end
        
    function temp_TpCallBack(hObj, event)
        x0(1) = get(event.AffectedObject,'Value');
        set(velVal, 'String', num2str(roundn(x0(1),-5)));
        update;
    end

function temp_TeCallBack(hObj, event)
        x0(3) = get(event.AffectedObject,'Value');
        set(velVal, 'String', num2str(roundn(x0(3),-5)));
        update;
end

%GUI update

    function update
        
  

end
