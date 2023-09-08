clear |\color{codeviolet}all|, close |\color{codeviolet}all|, clc

% Incialización de Variables
Fs = 48e3;
T = 2;
F = 100;
NO_lim = floor(F*T);
NO = 3;
N = floor(T*Fs);
t = (0:N-1)/Fs;

% Onda Senosoidal
w = 2*pi*F;
x = ((exp(1j*w*t)-exp(-1j*w*t))/2j)';

% DFT
xz = [x;zeros(N,1)];
L = length(xz);
xw = xz.*hamming(L);
X = fft(xw);

% Bin de Corrección debido al ventaneo
[~,ko] = max(X(1:L/2));
d = 0.5*(abs(X(ko+1))-abs(X(ko-1)))/((2*abs(X(ko)))-abs(X(ko+1))-abs(X(ko-1)));
k = (0:L-1)+d;
df = Fs/L;
f = k*df;

% Plot
fig = figure();
plot(t,x,LineWidth=1)
fontname(fig,"Times")
%fontsize(fig,15,"points")
set(gca,FontSize=12)
xlabel('Time (s)',FontSize=16.5)
ylabel('Amplitude',FontSize=16.5)
xlim([0 NO/F])
grid |\color{codeviolet}on|
grid |\color{codeviolet}minor|

% Guardar figura
saveas(fig,'senoide','eps');