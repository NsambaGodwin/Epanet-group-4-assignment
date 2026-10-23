clc;
clear;
close all;
start_toolkit;
B = epanet('Group4.inp');

% Run the complete hydraulic simulation
B.solveCompleteHydraulics;

% Obtain computed hydraulic results
pressure = B.getNodePressure;
flow = B.getLinkFlows;
velocity = B.getLinkVelocity;

% Display results
disp('Node pressures:');
disp(pressure);

disp('Pipe flow rates:');
disp(flow);

disp('Pipe velocities:');
disp(velocity);

%%Plot network topology
B.plot;
%%Plot nodes IDs
B.plot('nodes', 'yes', 'fontsize', 12)
%%Plot links IDs
B.plot('links', 'yes', 'fontsize', 12)
%%Plot link indices
B.plot('linksindex', 'yes', 'fontsize',8);
%%Plot node indices
B.plot('nodesindex', 'yes', 'fontsize',14);
%%Highlight specific links
B.plot('links', 'yes', 'highlightlink',{'10'}, 'fontsize',8);        
%%Highlight specific nodes
B.plot('highlightnode',{'10', '32'});
%%Plot only links
B.plot('point', 'no');
%%Plot only nodes
B.plot('line', 'no');
%%Highlight multiple links with different colors 
linkSet1 = B.getLinkNameID(1:4);
colorLinkSet1 = repmat({'r'},1,length(linkSet1));
linkSet2 = B.getLinkNameID([5,6,7,8]);
colorLinkSet2=repmat({'g'},1,length(linkSet2));
B.plot('highlightlink',[linkSet1 linkSet2],'colorlink',[colorLinkSet1 colorLinkSet2])
%%Highlight multiple nodes with different colors 
nodeSet1 = B.getNodeNameID(1:4);
colorLinkSet1 = repmat({'y'},1,length(nodeSet1));
nodeSet2 = B.getNodeNameID([5,6,7,8]);
colorLinkSet2=repmat({'g'},1,length(nodeSet2));
B.plot('highlightnode',[nodeSet1 nodeSet2],'colornode',[colorLinkSet1 colorLinkSet2])
%%Hide legend
B.plot('legend', 'hide')
%%Extent network on figure
B.plot('extend', 'yes')

B.plot('legendposition', 'EastOutside')
%%Plot at specific axes
h = figure;
B.plot('axes', h)

% Plot for matlab apps (GUIs)
%d.plot('uifigure', app.UIFigure, 'axes', app.UIAxes,'legend','hide');
%%Plot graph
%h =B.plotGraph
title('Network Graph');
% Show ID of nodes
%B.plotGraph('nodes', 'yes');
title('Network Graph with node IDs');
%%Unload library
B.unload;