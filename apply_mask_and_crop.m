function CROP = apply_mask_and_crop(IMG, MASK, center)
%    IMG: RGB image in uint8 format (from 0 to 255) 
%   MASK: logical array (only zeros and ones).
%          0 if not card,
%          1 if card
% center: 2-element vector, coordinate of the center of mass
%          center(1) is the horizontal coordinate
%          center(2) is the vertical coordinate
%
% CROP: RGB image in uint8 format (from 0 to 255) showing the cropped card

card_size = [420, 280]; % [height, width]
WHT = uint8(ones(size(IMG))*255);
WHT_masked = WHT .* uint8(~MASK);
IMG_masked = IMG .* uint8(MASK);

without_CROP = WHT_masked + IMG_masked;
x_to_move = card_size(2)/2;
y_to_move = card_size(1)/2;
if ((center(1)-x_to_move) <0&&(center(2)-y_to_move) <0)
    CROP=without_CROP(center(1):(center(1)+x_to_move),center(2):(center(2)+y_to_move),:);
else
    CROP=without_CROP((center(2)-y_to_move):(center(2)+y_to_move),(center(1)-x_to_move):(center(1)+x_to_move),:);
end
end