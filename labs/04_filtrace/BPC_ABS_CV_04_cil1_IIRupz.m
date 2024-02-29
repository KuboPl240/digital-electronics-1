% -------------------------------------------------------------------------
% BPC-ABS cvičení -04-          2024-02-27                  Martin Vítek 
% Filtrace driftu a síťového rušení v signálu EKG           Lukáš Smital 
% -------------------------------------------------------------------------
% Cíl 1: Návrh a analýza jednoduché upz 2.řádu:
% s přenosovou funkcí 
% H(z) = (1-2*cos(fi)z^(-1)+z^(-2)) / (1-2*r*cos(fi)z^(-1)+r^2*z^(-2)),
% kde fi=2*pi*fz/fvz, fz je střední kmitočet potlačovaného pásma
% -------------------------------------------------------------------------
% NÁVRH FILTRU A VYKRESLENÍ CHARAKTERISTIK
close all; clear; clc

% Můžete využít tyto funkce:
% freqz; linspace; abs; angle; zplane; impz; 
fvz = 250;
fz = 50;
r = 0.5;

b= [1 -2*cos((2*pi)/5) 1];
a = [1 -2*r*cos((2*pi)/5) r^2];
figure
zplane(a,b);

figure
freqz(b,a);

figure
impz(b,a, 20);

% -------------------------------------------------------------------------
% FILTRACE SIGNÁLU NAVRŽENÝM FILTREM

load("ekg250_50_drift.mat");
figure
plot(x);
figure
plot(filter(b,a,x));
% Můžete využít tyto funkce:
% load; conv; filter; filtfilt; linspace; fft;

