%程序入口
function Loan(totalMoney, loanYears, yearlyInterestRate)
totalLoan=(1-0.3)*totalMoney;
loanMonths=12*loanYears;
monthlyInterestRate=yearlyInterestRate/12;
fprintf('等额本金方式还款：\n');
equalPrincipal(totalLoan, loanMonths, monthlyInterestRate);

fprintf('等额本息方式还款：\n');
equalPrincipalAndInterest(totalLoan, loanMonths, monthlyInterestRate);
end

% 等额本金方式还款
function equalPrincipal(totalLoan, loanMonths, monthlyInterestRate)
monthlyPrincipal = totalLoan / loanMonths;
totalInterest = 0;
results = zeros(loanMonths, 3);
for i = 1:loanMonths
    remainingPrincipal = totalLoan - (i-1) * monthlyPrincipal;
    monthlyInterest = remainingPrincipal * monthlyInterestRate;
    totalInterest = totalInterest + monthlyInterest;
    monthlyPayment = monthlyPrincipal + monthlyInterest;
    results(i, :) = [i, monthlyPayment, monthlyInterest];
end
writematrix(results, 'equalPrincipal.csv');
fprintf('总利息：%f\n', totalInterest);
end

% 等额本息方式还款
function equalPrincipalAndInterest(totalLoan, loanMonths, monthlyInterestRate)
monthlyPayment = (totalLoan * monthlyInterestRate * (1 + monthlyInterestRate)^loanMonths) / ((1 + monthlyInterestRate)^loanMonths - 1);
totalInterest = loanMonths * monthlyPayment - totalLoan;
results = [monthlyPayment, totalInterest];
writematrix(results, 'equalPrincipalAndInterest.csv');
fprintf('总利息：%f\n',totalInterest);
end

