function g = intrans(f, method, varargin)
%INTRANS Performs intensity (gray-level) transformations.
%   G = INTRANS(F, 'neg') computes the negative of input image F.
%
%   G = INTRANS(F, 'log', C, CLASS) computes C*log(1 + F) and 
%   multiples the result by (positive) contanst C. If the last two
%   parameters are omitted, C defaults to 1. Because the log is used
%   frequently to display Fourier spectra, parameter CLASS offers 
%   the option to specify the class of the output as 'uint8' or 
%   'uint16'. If parameter CLASS is omitted, the output is of the
%   same class as the input.
%
%   G = INTRANS(F, 'gamma', GAM) performs a gamma transformation on
%   the input image  using parameter GAM (a required input).
% 
%   G = INTRANS(F, 'stretch', M, E) computes a contract-stretching
%   transformation using the expression 1./(1 + (M ./ F).^E).
% Verify the correct number of inputs.
% error(nargchk(2, 4, nargin)) % this is deprecated.
narginchk(2, 4)

if strcmp(method, 'log')
    % The log transform handles image class differently than the
    % other transforms, so let the logTransform function handle that
    % and then return.
    g = logTransform(f, varargin{:});
    return;
end

% If f is floating point, check to see if it is in the range [0 1].
% If it is not, force it to be using function mat2gray.
if isfloat(f) && (max(f(:)) > 1 || min(f(:)) < 0)
    f = mat2gray(f);
end

[f, revertclass] = tofloat(f); % Store class of f for use later.

% Perform the intensity transformation specified.
switch method
    case 'neg'
        g = imcomplement(f);
        
    case 'stretch'
        g = stretchTransform(f, varargin{:});
        
    otherwise
        error('Unkown enhancement method.');
end

% Convert to the class of the input image.
g = revertclass(g);

%------------------------------------------------------------------%
function g = logTransform(f, varargin)
[f, revertclass] = tofloat(f);
if numel(varargin) >= 2
    if strcmp(varargin{2}, 'uint8')
        revertclass = @im2uint8;
    elseif strcmp(varargin{2}, 'uint16')
        revertclass = @im2uint16;
    else
        error('Unsupported CLASS option for ''log'' method.')
    end
end

if numel(varargin) < 1
    % Set default for C.
    C = 1;
else
    C = varargin{1};
end

g = C * (log(1 + f));
g = revertclass(g);

%------------------------------------------------------------------%
function g = stretchTransform(f, varargin)
if isempty(varargin)
    % Use defaults.
    m = mean2(f);
    E = 4.0;
elseif length(varargin) == 2
    m = varargin{1};
    E = varargin{2};
else
    error('Incorrect number of inputs for the stretch method.');
end
g = 1./(1 + (m./f).^E);