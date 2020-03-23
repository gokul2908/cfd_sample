clear all
close all
clc 
% 2D HEAT CONDUCTION
% (1,2,3) steady state
% 4,5,6,7 for unsteady / transient state
% (1,2,3) or (5,6,7) for (jacobi,gs,SOR)
% 4 explicit
% 5,6,7 implicit
Z = 6; 

%input
l = 1; %length
b = 1; %breadth

%number of nodes along x & y axis
nx = 10;
ny = 10;
% Discretization
x = linspace(0,l,nx);
y = linspace(0,b,ny);
% Boundary condition
T_t = 600;
T_b = 900;
T_l = 400;
T_r = 800;

T = 400*ones(nx,ny);

% boundary conditions
T(1,2:nx-1) = T_t;
T(nx,2:nx-1) = T_b;
T(2:ny-1,1) = T_l;
T(2:ny-1,ny) = T_r;
% corner temperature
T(1,1) = (T(1,2)+T(2,1))/2;
T(1,nx) = (T(1,nx-1)+T(2,nx))/2;
T(ny,1) = (T(ny-1,1)+T(ny,2))/2;
T(nx,ny) = (T(nx,ny-1)+T(nx-1,ny))/2;
%constant
dx = 0.245;
dy = dx;
k = 2*((dx^2+dy^2)/(dx^2*dy^2));
error = 1;
tolerance = 1e-4;
Told = T;
A = 0; B = A; C = A; % to find no of iterations

% steady state
if Z == 1 % jacobi
    tic
    %converge loop
    while error > tolerance
        %space loop
        for j = 2:nx-1
            for i = 2:ny-1
                T(i,j) = (k^-1)*(((Told(i-1,j)+Told(i+1,j))/dx^2)+((Told(i,j-1)+Told(i,j+1))/dy^2));
            end
        end
        error = max(max(T-Told));
        Told = T;
        A = A+1;
    end
    ab = toc;
    [X,Y] = contourf(x,y,T);
    colorbar
    colormap(jet);
    clabel(X,Y);
    titlex = (sprintf('Jacobi iteration no.: %d & time taken: %d', A,ab));
    title(titlex);
    xlabel('xaxis')
    ylabel('yaxis')
end

if Z == 2 % for gauss seidel
    %converge loop
    tic
    while error > tolerance
        %space loop
        for j = 2:nx-1
            for i = 2:ny-1
                T(i,j) = (k^-1)*(((T(i-1,j)+Told(i+1,j))/dx^2)+((T(i,j-1)+Told(i,j+1))/dy^2));
            end
        end
        error = max(max(T-Told));
        Told = T;
        B = B+1;
    end
    ab = toc;
    [X,Y] = contourf(x,y,T);
    colorbar
    colormap(jet);
    clabel(X,Y);
    titlex = (sprintf('Gauss-Seidel iteration no.: %d & time taken: %d', B,ab));
    title(titlex);
    xlabel('xaxis')
    ylabel('yaxis')
end

if Z == 3 % for Sucessive over relaxation
    %converge loop
    w = 1.1; % Relaxation factor
    tic
    while error > tolerance
        %space loop
        for j = 2:nx-1
            for i = 2:ny-1
                term_1 = (k^-1)*(((T(i-1,j)+Told(i+1,j))/dx^2)+((T(i,j-1)+Told(i,j+1))/dy^2));
                T(i,j) = ((1-w)*Told(i,j))+(w*(term_1));
            end
        end
        error = max(max(T-Told));
        Told = T;
        C = C+1;
    end
    ab = toc;
    [X,Y] = contourf(x,y,T);
    colorbar
    colormap(jet);
    clabel(X,Y);
    titlex = (sprintf('SOR iteration no.: %d & time taken: %d',C,ab));
    title(titlex);
    xlabel('xaxis')
    ylabel('yaxis')
end

% Transient/Unsteady state
nt = 1500; %
dt = 0.01

if Z == 4 % Explicit method
    alpha = 1.5;% Thermal condutivity
    k_1 = alpha*(dt)/(dx^2);
    k_2 = alpha*(dt)/(dy^2);
    CFL = k_1+k_2
    Tprevious = T;
    tic
    for t = 1:nt
        for j = 2:ny-1
            for i =  2:nx-1
                term_1 = k_1*(Told(i-1,j)-2*Told(i,j)+Told(i+1,j));
                term_2 = k_2*(Told(i,j-1)-2*Told(i,j)+Told(i,j+1));
                T(i,j) = Told(i,j)+term_1+term_2;
            end
        end
        Told = T;
    end
    ab = toc;
    [X,Y] = contourf(x,y,T);
    colorbar
    colormap(jet);
    clabel(X,Y);
    titlex = (sprintf('Unsteady state Explicit method, time taken: %d', ab));
    title(titlex);
    xlabel('xaxis')
    ylabel('yaxis')
end


    % Explicit method
if Z == 5 % Jacobi
    %dt = 100
    alpha = 1.5;
    k_1 = alpha*(dt)/(dx^2);
    k_2 = alpha*(dt)/(dy^2);
    D = 0;
    CFL = k_1+k_2
    T_prev = T;
    tic
    for t = 1:nt %time loop
        while error > tolerance % convergence looop
            for j = 2:ny-1 % space loop
                for i =  2:nx-1
                    term_1 = (1+2*k_1+2*k_2)^-1;
                    term_2 = k_1*(Told(i-1,j)+Told(i+1,j));
                    term_3 = k_2*(Told(i,j-1)+Told(i,j+1));
                    T(i,j) = term_1*(T_prev(i,j)+term_2+term_3);
                end
            end
            error = max(max(T-Told));
            Told = T ;
            D = D+1;
        end
        T_prev = T;
    end
    ab = toc;
    [X,Y] = contourf(x,y,T);
    colorbar
    colormap(jet);
    clabel(X,Y);
    titlex = (sprintf('Explicit method, Jacobi iteration no.: %d & time taken: %d',D,ab));
    title(titlex);
    xlabel('xaxis')
    ylabel('yaxis')
end


% Gauss seidal 
if Z == 6
    tic
    alpha = 1.5;
    k_1 = alpha*(dt)/(dx^2);
    k_2 = alpha*(dt)/(dy^2);
    CFL = k_1+k_2
    E = 0;
    T_prev = T;
    for t = 1:nt %time loop
        while error > tolerance % convergence looop
            for j = 2:ny-1 % space loop
                for i =  2:nx-1
                    term_1 = (1+2*k_1+2*k_2)^-1;
                    term_2 = k_1*(T(i-1,j)+T(i+1,j));
                    term_3 = k_2*(T(i,j-1)+T(i,j+1));
                    T(i,j) = term_1*(T_prev(i,j)+term_2+term_3);
                end
            end
            error = max(max(T-Told));
            Told = T ;
            E = E+1;
        end
        T_prev = T;
    end
    ab = toc;
    [X,Y] = contourf(x,y,T);
    colorbar
    colormap(jet);
    clabel(X,Y);
    titlex = (sprintf('Explicit method, Gauss seidal no_iteration: %d & time taken: %d',E,ab));
    title(titlex);
    xlabel('xaxis')
    ylabel('yaxis')
end

 % SOR 
if Z == 7
    tic
    alpha = 1.5;
    k_1 = alpha*(dt)/(dx^2);
    k_2 = alpha*(dt)/(dy^2);
    F = 0;
    w = 1.2;
    T_prev = T;
    for t = 1:nt %time loop
        while error > tolerance % convergence looop
            for j = 2:ny-1 % space loop
                for i =  2:nx-1
                    term_1 = (1+2*k_1+2*k_2)^-1;
                    term_2 = k_1*(T(i-1,j)+T(i+1,j));
                    term_3 = k_2*(T(i,j-1)+T(i,j+1));
                    term_4 = term_1*(T_prev(i,j)+term_2+term_3);
                    T(i,j) = ((1-w)*Told(i,j))+(w*(term_4));
                end
            end
            error = max(max(T-Told));
            Told = T ;
            F = F+1;
        end
        T_prev = T;
    end
    ab = toc;
    [X,Y] = contourf(x,y,T);
    colorbar
    colormap(jet);
    clabel(X,Y);
    titlex = (sprintf('Explicit method, SOR no_iteration: %d & time taken: %d',F,ab));
    title(titlex);
    xlabel('xaxis')
    ylabel('yaxis')
end
