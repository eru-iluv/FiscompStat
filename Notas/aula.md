# Analise Espectral de dados com Somas de Fourier

$$y(t) = \sum y_i\sin(2\pi f_i + \varphi_i)$$
$$\sum (y_i \cos(\varphi_i)\sin(2\pi f_it)) + (y_i\sin(\varphi_i)\cos(\pi f_it))$$
$$y(t) = \int_{-\infty}^\infty Y(f)e^{-i2\pi f t}df$$

Como temos uma série discreta, o menor compŕimento de onda que podemos observar de maneira discreta é $\dfrac{1}{2\Delta x}$