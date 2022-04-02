function color = detect_color(CARD)
% CARD: RGB image of the card (uint8 type)
%
% color: char type, possible values:
%         'R' for red
%         'B' for black
R=CARD(:,:,1);
G=CARD(:,:,2);
if max(max(R-G)) > 140
    color= 'R';
else
    color = 'B';
end
end


"asd"