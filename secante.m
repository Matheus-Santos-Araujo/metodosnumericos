function secant_method()
    ap = input("\n Digite o a: \n"); %(1)
    f = @(x) ap*e^x - 4*x^2;
    eps = input("\n Digite o erro: \n"); %(1e-4)
    x0 = 3.5; %Preciso disso
    x1 = x0 - 1;
    
    [solution,no_iterations] = secant(f, x0, x1, eps);
    if no_iterations > 0   % Solution found
        fprintf('Numero de iteracoes: %d\n', 2 + no_iterations);
        fprintf('d = %f\n', solution)
    else
        fprintf('Execucao abortada.\n')
    end
end

function [solution,no_iterations] = secant(f, x0, x1, eps)
    f_x0 = f(x0);
    f_x1 = f(x1);
    iteration_counter = 0;
    while abs(f_x1) > eps && iteration_counter < 100
        try
            denominator = (f_x1 - f_x0)/(x1 - x0);
            x = x1 - (f_x1)/denominator;
        catch
            fprintf('Erro! - denominador zero para x = \n', x1)
            break
        end
        x0 = x1;
        x1 = x;
        f_x0 = f_x1;
        f_x1 = f(x1);
        iteration_counter = iteration_counter + 1;
    end
    % Here, either a solution is found, or too many iterations
    if abs(f_x1) > eps
        iteration_counter = -1;
    end
    solution = x1;
    no_iterations = iteration_counter;
end
