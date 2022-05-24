classdef Agent
    properties
        action_size = 10
        epsilon = 0.1
        Qs = []             % Quality of each bandit
        ns = []             % count of play
   end
   methods
        % init
        function obj = Agent(epsilon, action_size)
            if nargin == 2
                obj.action_size = action_size;
                obj.epsilon = epsilon;
            elseif nargin == 1
                obj.epsilon = epsilon;
            end

            obj.Qs = zeros(1,obj.action_size);
            obj.ns = zeros(1,obj.action_size);
        end

        function obj = update(obj, action, reward)
            obj.ns(action) = obj.ns(action) + 1;
            obj.Qs(action) = obj.Qs(action) + (reward - obj.Qs(action)) / obj.ns(action);
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