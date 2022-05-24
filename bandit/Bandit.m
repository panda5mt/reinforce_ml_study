classdef Bandit
    properties
        arms = 10
        rates = []
   end
   methods
        % init
        function obj = Bandit(arms)
            if nargin == 1
                obj.arms = arms;
            end
           rng('default');
           obj.rates = rand(1, obj.arms);
        end
        function r = play(obj, arm)
            rate = obj.rates(arm);
            if rate > rand()
                r = 1;
            else
                r = 0;
            end
        end
   end
end