function [mass_x, mass_y] = find_center(MASK)
% MASK: logical array (only zeros and ones).
%
% mass_x: coordinate of center of mass (horizontal), integer
% mass_y: coodrinate of center of mass (vertical), integer
SoM = size(MASK);
x_of_SoM =1:SoM(2);
y_of_SoM=1:SoM(1);
[X,Y]=meshgrid(x_of_SoM,y_of_SoM);
X_Masked=zeros(size(X));
Y_Masked=zeros(size(Y));
X_Masked(MASK) = X(MASK);
Y_Masked(MASK) = Y(MASK);
X_center = sum(X_Masked(:)) / sum(MASK(:));
Y_center = sum(Y_Masked(:)) / sum(MASK(:));
mass_x = round(X_center);
mass_y = round(Y_center);
end