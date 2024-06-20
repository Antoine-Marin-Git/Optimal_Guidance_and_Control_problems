Overview
========

The following explores optimal trajectories to minimize the time for a boat to reach a particular point on the shore after a medical emergency, 
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

\begin{equation*}
    \mathcal{H} = 1 + p^T\dot X = 1 + p_xvcos(\theta) + p_xu(x,y) + p_yvsin(\theta) + p_yv(x,y) \tag{1}
\end{equation*}

The adjoint equations yield

\begin{align*}\left\{\begin{array}{r@{\mskip\thickmuskip}l}
 \dot p_x & = -\frac{\partial \mathcal{H}}{\partial x} = -\left(p_x\frac{\partial u}{\partial x} + p_y\frac{\partial v}{\partial x}\right) \\
 \dot p_y & = -\frac{\partial \mathcal{H}}{\partial y} = -\left(p_x\frac{\partial u}{\partial y} + p_y\frac{\partial v}{\partial y}\right) \tag{2}
\label{dotp}
\end{array}\right.
\end{align*}

At optimal control, 

\begin{equation*}
\frac{\partial \mathcal{H}}{\partial \theta} = 0 = -vp_xsin(\theta^*) + vp_ycos(\theta^*) \implies \boxed{tan(\theta^*) = \frac{p_y}{p_x}} \tag{3}
\label{tan(theta)}
\end{equation*}

$X(0)$, $X(t_f)$, $t_0$ are known, and $t_f$ is free, so the transversality condition can be written $\mathcal{H}(t_f) = 0$. Given that at optimal control, $\mathcal{H}(t_f)$ is constant, that yields 

\begin{gather*}
    \forall t ~~ \mathcal{H}(t) = \mathcal{H}(t_f) = 0 \\
    1 + p_xvcos(\theta) + p_xu(x,y) + p_yvsin(\theta) + p_yv(x,y) = 0 \\
    1 + p_x\left(vcos(\theta^*) + u(x,y)\right) + p_xtan(\theta^*)\left(vsin(\theta^*) + v(x,y)\right) = 0 ~~~ \text{from Eq. \textbf{(\ref{tan(theta)})}}
\end{gather*}

Yielding

\begin{align*}\left\{\begin{array}{r@{\mskip\thickmuskip}l}
p_x & = - \frac{1}{vcos(\theta^*) + u(x,y) + tan(\theta^*)(vsin(\theta^*) + v(x,y))} \\
p_y & = - \frac{tan(\theta^*)}{vcos(\theta^*) + u(x,y) + tan(\theta^*)(vsin(\theta^*) + v(x,y))} \tag{4}
\end{array}\right.
\label{p}
\end{align*}

Finally, from optimality condition,

\begin{gather*}
    \frac{d}{dt}\left(\frac{\partial \mathcal{H}}{\partial \theta}\right) = 0 \\
    \dot p_x vcos(\theta^*) - \dot \theta^* p_x vsin(\theta^*) + \dot p_y vsin(\theta^*) + \dot \theta^* p_y vcos(\theta^*) = 0 \\
    \dot \theta^*\left(p_y vcos(\theta^*) - p_x vsin(\theta^*)\right) = - \left(\dot p_x vcos(\theta^*) + \dot p_y vsin(\theta^*)\right) \tag{5}
\label{opti}
\end{gather*}

Let now apply these general relationships to particular use cases.

# Constant currents

