% GUI for THC calculations
%Jonas Gruendler, HSR 

function myui (t,y, tspan, x0, val)

% create figure
f = figure('Visible','off');
update;

%create Sliders
salinity_Sp = uicontrol(f, 'Style', 'slider',... 
               'Min', 0.03, 'Max', 0.05, 'Value', val(4),...
               'Position', [400 10 120 20]);
addlistener(salinity_Sp, 'Value', 'PostSet', @salinity_SpCallBack);

salinity_Se = uicontrol(f, 'Style', 'slider',... 
               'Min', 0.03, 'Max', 0.05, 'Value', val(6),...
               'Position', [400 48 120 20]);
addlistener(salinity_Se, 'Value', 'PostSet', @salinity_SeCallBack);

temp_Tp = uicontrol(f, 'Style', 'slider',... 
               'Min', 5, 'Max', 20, 'Value', val(1),...
               'Position', [400 86 120 20]);
addlistener(temp_Tp, 'Value', 'PostSet', @temp_TpCallBack);

temp_Te = uicontrol(f, 'Style', 'slider',... 
               'Min', 5, 'Max', 20, 'Value', val(3),...
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
salinity_SpVal = uicontrol('Style', 'Text',...
    'Position', [400 35 120 15],...
    'String', num2str(roundn(val(4), -4)));

salinity_SeVal = uicontrol('Style', 'Text',...
    'Position', [400 73 120 15],...
    'String', num2str(roundn(val(6), -4)));

temp_TpVal = uicontrol('Style', 'Text',...
    'Position', [400 111 120 15],...
    'String', num2str(roundn(val(1), -1)));

temp_TeVal = uicontrol('Style', 'Text',...
    'Position', [400 149 120 15],...
    'String', num2str(roundn(val(3), -1)));


f.visible = 'on'

    function salinity_SpCallBack(hObj, event)
        x0(4) = get(event.AffectedObject, 'Value');
        set(salinity_Sp, 'String', num2str(roundn(val(4)), -4))); 
    end

    function salinity_SeCallBack(hObj, event)
        x0(6) = get(event.AffectedObject,'Value');
        set(velVal, 'String', num2str(roundn(val(6),-4)));
        update;
    end
        
    function temp_TpCallBack(hObj, event)
        x0(1) = get(event.AffectedObject,'Value');
        set(velVal, 'String', num2str(roundn(val(1),-4)));
        update;
    end

    function temp_TeCallBack(hObj, event)
        x0(3) = get(event.AffectedObject,'Value');
        set(velVal, 'String', num2str(roundn(val(3),-4)));
        update;
    end

%GUI update

   function update
        hold off;
        [t,y] =  ode45(@(t,y) odefun_3Box_1Flux(t,y,val), tspan, y0); 
        plotGraphs;
   end

    function plotGraphs
       %% Plot Temperature
        figure(1)
        plot(t,y(:,1));
        hold on
        plot(t,y(:,2));
        plot(t,y(:,3));
        hold off
        title('Temperature-plot')
        xlabel('time')
        ylabel('Temp(C)')
        legend('T1', 'T2', 'T3')

        %% Plot Salinity
        figure(2);
        plot(t,y(:,4));
        hold on
        plot(t,y(:,5));
        plot(t,y(:,6));
        hold off
        title('Salinity-plot')
        xlabel('time')
        ylabel('Salinity(psu)')
        legend('S1', 'S2', 'S3')

        %% Berechnung Fluss
        k = 1.5*10^(-6);
        a = 1.5*10^(-4);
        b = 8*10^(-4);
        q = k*(a*(y(:,2)-y(:,1))-b*(y(:,4)-y(:,3)));
        % q2 = k*(a*(y(:,3)-y(:,2))-b*(y(:,6)-y(:,5)));

        %% Plot Fluss
        figure(3) 
        plot(t,q);
        hold on
        % plot(t, q2);
        hold off
        title('Fluss-plot')
        xlabel('time')
        ylabel('Fluss')
        legend('q') 
       
    end

end
