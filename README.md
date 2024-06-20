Overview
========

The following project explores optimal trajectories to minimize the time for a boat to reach a particular point on the shore after a medical emergency, 
subject to currents. The ship is located at the point $(x_i,y_i) = (−20,0)$ ml at time t = 0, and has to reach the shore as soon as possible. It is 
known that there is a small city at the location $(x_f,y_f) = (−15,35.5)$ ml with a medical center. We want therefore to determine the fastest possible 
route to the city. It is assumed that the speed of the ship with respect to the water is constant, $v = 15ml.hr^{-1}$. We also know the speed and direction 
of the sea currents in the area, which are given by a meteorological satellite as $\vec{v}_c = u(x,y)\textbf{i} +v(x,y)\textbf{j}$.

# General form

We want to minimize 

$J(u) = \int _0 ^{t_f} dt = t_f$ 

subject to 

$\dot x = vcos(\theta) + u(x,y)$

$\dot y = vsin(\theta) + v(x,y)$

The Hamiltonian can be written as

$\mathcal{H} = 1 + p^T\dot X = 1 + p_xvcos(\theta) + p_xu(x,y) + p_yvsin(\theta) + p_yv(x,y)$

The adjoint equations yield

$\dot p_x = -\frac{\partial \mathcal{H}}{\partial x} = -\left(p_x\frac{\partial u}{\partial x} + p_y\frac{\partial v}{\partial x}\right)$

$\dot p_y = -\frac{\partial \mathcal{H}}{\partial y} = -\left(p_x\frac{\partial u}{\partial y} + p_y\frac{\partial v}{\partial y}\right)$

At optimal control, 

$\frac{\partial \mathcal{H}}{\partial \theta} = 0 = -vp_xsin(\theta) + vp_ycos(\theta)$

$\implies \boxed{tan(\theta) = \frac{p_y}{p_x}}$

$X(0)$, $X(t_f)$, $t_0$ are known, and $t_f$ is free, so the transversality condition can be written $\mathcal{H}(t_f) = 0$. Given that at optimal control, $\mathcal{H}$ is constant, that yields 

$\forall t ~~~ \mathcal{H}(t) = \mathcal{H}(t_f) = 0$

$1 + p_xvcos(\theta) + p_xu(x,y) + p_yvsin(\theta) + p_yv(x,y) = 0$

$1 + p_x\left(vcos(\theta) + u(x,y)\right) + p_xtan(\theta)\left(vsin(\theta) + v(x,y)\right) = 0$ 

Yielding

$p_x = - \frac{1}{vcos(\theta) + u(x,y) + tan(\theta)(vsin(\theta) + v(x,y))}$

$p_y = - \frac{tan(\theta)}{vcos(\theta) + u(x,y) + tan(\theta)(vsin(\theta) + v(x,y))}$

Finally, from optimality condition,

$\frac{d}{dt}\left(\frac{\partial \mathcal{H}}{\partial \theta}\right) = 0$

$\dot p_x vcos(\theta) - \dot \theta p_x vsin(\theta) + \dot p_y vsin(\theta) + \dot \theta p_y vcos(\theta) = 0$

$\theta\left(p_y vcos(\theta) - p_x vsin(\theta)\right) = - \left(\dot p_x vcos(\theta) + \dot p_y vsin(\theta)\right)$


Let's now apply these general relationships to particular use cases.

# Constant currents

The currents are assumed to be constant given by $\vec{v}_c = 2\textbf{i} - 6\textbf{j}$.

The state equations become therefore

$\dot x = vcos(\theta) + 2$

$\dot y = vsin(\theta) -6$

And the adjoint state equations

$\dot p_x = 0 \implies p_x = C1$

$\dot p_y = 0 \implies p_y = C2$ 

The control heading $\theta$ is then constant given by $\boxed{\tan(\theta) = \frac{C_2}{C_1}}$

The state equations can be then integrated to give

$x(t) = (vcos(\theta) + 2)t + x_i$

$y(t) = (vsin(\theta) -6)t + y_i$
