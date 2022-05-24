% Make Deep Learning from Zero vol.4
% study for "bandit problem"
% may 24,2022: finished 1.4.3
runs = 200;
steps = 1000;
epsilon = 0.1;
all_rates = zeros(runs, steps);


for run = 1:1:runs

    bandit = Bandit();
    agent = Agent(epsilon);
    total_reward = 0;
    total_rewards = zeros(1, steps);
    rates = zeros(1, steps);
    
    for step = 1:1:steps
        action = agent.get_action();
        reward = bandit.play(action);
        agent.update(action, reward);
        total_reward = total_reward + reward;
    
        total_rewards(step) = total_reward;
        rates(step) = total_reward /(step+1);
    end
    all_rates(run,:) = rates;
end

avg_rates = mean(all_rates, 1);
disp(total_reward);

% plot
figure(1)
tiledlayout(2,1)
ax1 = nexttile;
x = 1:steps;
plot(ax1,x,total_rewards)
title(ax1,'total rewards')
xlabel(ax1,'Steps')
ylabel(ax1,'Total Rewards')

ax2 = nexttile;
x = 1:steps;
plot(ax2,x,avg_rates)
title(ax2,'Rates')
xlabel(ax2,'Steps')
ylabel(ax2,'Rates')