Overview
========

The following project explores optimal trajectories to minimize the time for a boat subject to currents to reach a particular point on the shore: such 
a problem is known as the Zermelo's problem. The ship is located at the point $(x_i,y_i) = (−20,0)$ ml at time t = 0, and has to reach the shore as soon 
as possible due to a medical emergency. It is known that there is a small city at the location $(x_f,y_f) = (−15,35.5)$ ml with a medical center. We want
therefore to determine the fastest possible route to the city. It is assumed that the speed of the ship with respect to the water is constant, 
$V = 15ml.hr^{-1}$. We also know the speed and direction of the sea currents in the area, which are given by a meteorological satellite as
$\vec{v}_c = u(x,y)\textbf{i} +v(x,y)\textbf{j}$.

# General formulation

We want to minimize 

$J(u) = \int _0 ^{t_f} dt = t_f$ 

subject to 

$\dot x = Vcos(\theta) + u(x,y)$

$\dot y = Vsin(\theta) + v(x,y)$

The Hamiltonian can be written as

$\mathcal{H} = 1 + p^T\dot X = 1 + p_xVcos(\theta) + p_xu(x,y) + p_yVsin(\theta) + p_yv(x,y)$

The adjoint equations yield

$\dot p_x = -\frac{\partial \mathcal{H}}{\partial x} = -\left(p_x\frac{\partial u}{\partial x} + p_y\frac{\partial v}{\partial x}\right)$

$\dot p_y = -\frac{\partial \mathcal{H}}{\partial y} = -\left(p_x\frac{\partial u}{\partial y} + p_y\frac{\partial v}{\partial y}\right)$

At optimal control, 

$\frac{\partial \mathcal{H}}{\partial \theta} = 0 = -Vp_xsin(\theta) + Vp_ycos(\theta)$

$\implies \boxed{tan(\theta) = \frac{p_y}{p_x}}$

$X(0)$, $X(t_f)$, $t_0$ are known, and $t_f$ is free, so the transversality condition can be written $\mathcal{H}(t_f) = 0$. Given that at optimal control, $\mathcal{H}$ is constant, that yields 

$\forall t ~~~ \mathcal{H}(t) = \mathcal{H}(t_f) = 0$

$1 + p_xVcos(\theta) + p_xu(x,y) + p_yVsin(\theta) + p_yv(x,y) = 0$

$1 + p_x\left(Vcos(\theta) + u(x,y)\right) + p_xtan(\theta)\left(Vsin(\theta) + v(x,y)\right) = 0$ 

Yielding

$p_x = - \frac{cos(\theta)}{V + cos(\theta)u(x,y) + sin(\theta)v(x,y)}$

$p_y = - \frac{sin(\theta)}{V + cos(\theta)u(x,y) + sin(\theta)v(x,y)}$

Let's now apply these general relationships to particular use cases.

# Constant currents

The currents are assumed to be constant given by $\vec{v}_c = 2\textbf{i} - 6\textbf{j}$.

The state equations become therefore

$\dot x = Vcos(\theta) + 2$

$\dot y = Vsin(\theta) -6$

And the adjoint state equations

$\dot p_x = 0 \implies p_x = C_1$

$\dot p_y = 0 \implies p_y = C_2$ 

The control heading $\theta$ is then constant given by $\boxed{\tan(\theta) = \frac{C_2}{C_1}}$

The state equations can be then integrated to give

$x(t) = (Vcos(\theta) + 2)t + x_i$

$y(t) = (Vsin(\theta) -6)t_f + y_i$

We therefore end up with a system of 3 equations for 3 unknowns ($C_1$, $C_2$, and $t_f$) to solve:

$x_f = (Vcos(\theta) + 2)t_f + x_i$

$y_f = (Vsin(\theta) -6)t_f + y_i$

$(Vsin(\theta) − 6)(x_f − x_i) = (Vcos(\theta) + 2)(y_f − y_i)$

The code [Boat_Currents_constant.m](https://github.com/Antoine-Marin-Git/Optimal_Guidance_and_Control_problems/blob/main/Boat_Currents_contant.m) gives the following components evolution with time, and the associated optimal trajectory. It is a straight line that, in the current configurations, lead a final time $t_f = 3.95 ~ h$ with a control heading of $\theta = 92.8 ~ ^\circ$. The start and end points are highlighted in green and orange respectively.

![alt text](Graphics/Opt_Traj_Constant.png)

![alt text](Graphics/Opt_Compo_Constant.png)

# Linear Currents

Coming soon!


