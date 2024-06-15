%simpson.m
function [I, steps] = simpson(fun, a, b, tol, varargin)
% 复化自适应步长辛普森公式求解数值积分，并返回区间划分步长
% 输入参数：
% fun：被积函数
% a, b：积分区间的端点
% tol：误差容忍度
% varargin：函数fun的附加参数
% 输出参数：
% I：求得的积分值
% steps：区间划分的步长列表

  if nargin < 4 || isempty(tol)
    tol = 1e-4; % 默认误差容忍度
  end

  [I, steps] = adaptiveSimpson(fun, a, b, tol, a, b, varargin{:});
end

function [I, steps] = adaptiveSimpson(fun, a, b, tol, fullA, fullB, varargin)
  % 自适应辛普森积分辅助函数
  % 使用递归方法自动调整积分步长以满足误差要求，并记录每次划分的中点

  c = (a + b) / 2;
  S1 = simpsonRule(fun, a, b, varargin{:});
  S2 = simpsonRule(fun, a, c, varargin{:}) + simpsonRule(fun, c, b, varargin{:});

  if abs(S1 - S2) < 15 * tol
    I = S2 + (S2 - S1) / 15;
    steps = c;
  else
    [IL, stepsL] = adaptiveSimpson(fun, a, c, tol/2, fullA, fullB, varargin{:});
    [IR, stepsR] = adaptiveSimpson(fun, c, b, tol/2, fullA, fullB, varargin{:});
    I = IL + IR;
    steps = [stepsL, c, stepsR];
  end

  % 如果是最外层调用，则添加区间的起始和结束点
  if a == fullA && b == fullB
    steps = [a, steps, b];
  end
end

function S = simpsonRule(fun, a, b, varargin)
  % 辛普森规则计算函数
  c = (a + b) / 2;
  fa = feval(fun, a, varargin{:});
  fb = feval(fun, b, varargin{:});
  fc = feval(fun, c, varargin{:});
  S = (b - a) * (fa + 4*fc + fb) / 6;
end