% Make Deep Learning from Zero vol.4
% study for "bandit problem"
% may 24,2022: finished 1.4.3
runs = 200;
steps = 1000;
epsilon = 0.1;
alpha = 0.8;
agent_types = {'sample average', 'alpha const update'};
results = [];

for agent_type = agent_types
    all_rates = zeros(runs, steps);
    
    
    for run = 1:1:runs
        if isequal(agent_type, 'sample average')
            agent = Agent(epsilon);
        else
            agent = AlphaAgent(epsilon, alpha);
        end

        bandit = NonStatBandit();
        total_reward = 0;
        total_rewards = zeros(1, steps);
        rates = zeros(1, steps);
        
        for step = 1:1:steps
            action = agent.get_action();
            reward = bandit.play(action);
            agent.update(action, reward);
            total_reward = total_reward + reward;
        
            %total_rewards(step) = total_reward;
            rates(step) = total_reward /(step+1);
        end
        all_rates(run,:) = rates;
    end
end
avg_rates = mean(all_rates, 1);
%disp(total_reward);

% plot
figure(1)
x = 1:steps;
plot(x,avg_rates)
title('Average Rates')
xlabel('Steps')
ylabel('Average Rates')