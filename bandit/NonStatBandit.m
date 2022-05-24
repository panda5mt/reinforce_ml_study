%% non stationary Bandit
classdef NonStatBandit
    properties
        arms = 10
        rates = []
   end
   methods
        % init
       function obj = NonStatBandit(arms)
            if nargin == 1
                obj.arms = arms;
            end
           rng('default');
           obj.rates = rand(1, obj.arms);
        end
        function r = play(obj, arm)
            rate = obj.rates(arm);
            obj.rates = obj.rates + 0.1 .* randn(1,obj.arms); % add noise
            if rate > rand()
                r = 1;
            else
                r = 0;
            end
        end
   end
end