%% non stationary agent
classdef AlphaAgent
    properties
        actions = 10
        epsilon = 0.1
        alpha
        Qs = []             % Quality of each bandit
   end
   methods
        % init
        function obj = AlphaAgent(epsilon, alpha, actions)
            if nargin == 3
                obj.actions = actions;
                obj.epsilon = epsilon;
                obj.alpha = alpha;
            elseif nargin == 2
                obj.epsilon = epsilon;
                obj.alpha = alpha;
            end

            obj.Qs = zeros(1, obj.actions);
        end

        function obj = update(obj, action, reward)
            obj.Qs(action) = obj.Qs(action) + (reward - obj.Qs(action)) * obj.alpha ;
        end
        function r = get_action(obj)
            if rand() < obj.epsilon
                r = randi(length(obj.Qs));
            else
                [~,r] = max(obj.Qs);
            end
        end
   end
end