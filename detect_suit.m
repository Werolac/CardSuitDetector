function suit = detect_suit(CARD)
% CARD: RGB image of the card (uint8 type)
%
% cuit: char type, possible values:
%         'C' for clubs (♣)
%         'D' for diamonds (♦)
%         'H' for hearts (♥)
%         'S' for spades (♠)
suits = load('input/suits.mat');
suit = 'R';
results_of_convs = [];
grey_card=rgb2gray(CARD);
grey_card = grey_card<230;

 results_of_convs = [results_of_convs,max(max(conv2(grey_card,suits.clubs)))];
 results_of_convs = [results_of_convs,max(max(conv2(grey_card,suits.spades)))];
 results_of_convs = [results_of_convs,max(max(conv2(grey_card,suits.hearts)))];
 results_of_convs = [results_of_convs,max(max(conv2(grey_card,suits.diamonds)))];
 color=detect_color(CARD);
 if color == 'B'
     [~,index] = max(results_of_convs(1:2));
     if index == 1
         suit='C';
     else
         suit='S';
     end
 else
     [~,index] = max(results_of_convs(3:4));
     if index == 1
         suit='H';
     else
         [~,min_index] = min(results_of_convs);
         if min_index == 1
             suit='D';
         else
            suit='H';
         end
     end
 end
end