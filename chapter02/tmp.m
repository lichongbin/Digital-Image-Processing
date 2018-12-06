identity = @(x) x;
tosingle = @im2single;
table = {
    'uint8',   tosingle, @im2uint8
    'uint16',  tosingle, @im2uint16
    'int16',   tosingle, @im2int16
    'logical', tosingle, @logical
    'double',  identity, identity
    'single',  identity, identity
    };

f = imread('Fig0206(a).tif');