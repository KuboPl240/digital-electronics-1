% -------------------------------------------------------------------------
% BPC-ABS cvičení -04-          2024-02-27                  Martin Vítek 
% Filtrace driftu a síťového rušení v signálu EKG           Lukáš Smital 
% -------------------------------------------------------------------------
% Cíl 3: Skript slouží pro filtraci driftu a síťového rušení EKG signálu: 
% 1) pomocí FIR filtru a funkce "fir1"
% 2) pomocí IIR filtru a funkce "butter"
% -------------------------------------------------------------------------
close all; clear; clc

% Nahrajeme signál EKG. Signal se uloží do proměnné x
load ekg250_50_drift.mat
fvz = 250;          % vzorkovací frekvence signálu
x = x - mean(x);    % odstranění stejnosměrné složky

% -------------------------------------------------------------------------
% NÁVRH FILTRU

% Můžete využít tyto funkce:
% fir1; butter

% zvolte jeden z následujících řádků (zakomentovat/odkomentovat)
F = 'HP FIR drift'; N = 500; fmez = 0.67;               % N = délka imp. char.  
% F = 'PZ FIR 50';    N = 500; fmez1 = 49; fmez2 = 51;    % N = délka imp. char.  
% F = 'HP IIR drift'; N = 3;   fmez = 0.67;               % N = řád filtru
% F = 'PZ IIR 50';    N = 3;   fmez1 = 49; fmez2 = 51;    % N = řád filtru

switch F
    case 'HP FIR drift'	% Návrh FIR filtru pro odstranění driftu (HP, fmez = 0.67 Hz)
        % //DOPLŇTE//
        Wn = fmez/(fvz/2);       	% přepočet mezní frekvence 
        a = 1;         	% koeficienty filtru
        b = fir1(N,Wn);
    case 'PZ FIR 50'       % Návrh FIR filtru pro odstranění sítového rušení (PZ, 49-50 Hz)
        % //DOPLŇTE//
        Wn = 0;       	% přepočet mezní frekvence 
        a = 1;         	% koeficienty filtru
        b = 0;
    case 'HP IIR drift'    % Návrh IIR filtru pro odstranění driftu (HP, fmez = 0.67 Hz)
        % //DOPLŇTE//
        Wn = 0;       	% přepočet mezní frekvence 
        a = 1;         	% koeficienty filtru
        b = 0;
    case 'PZ IIR 50'       % Návrh IIR filtru pro odstranění sítového rušení (PZ, 49-50 Hz)
        % //DOPLŇTE//
        Wn = 0;       	% přepočet mezní frekvence 
        a = 1;         	% koeficienty filtru
        b = 0;
end

% -------------------------------------------------------------------------
% VÝPOČET A ZOBRAZENÍ FREKVENČNÍ CHARAKTERISTIKY

% Můžete využít tyto funkce:
% freqz; linspace;

M = 10000;
H = zeros(1,M); % //DOPLŇTE// výpočet 10000 bodů celé periody frekv.char.

% výpočet frekvenční osy
fosa = 1:M;     % //DOPLŇTE//

% vykreslení frekvenčních charakteristik
figure;  
ax1 = subplot(2,1,1);
plot(fosa, abs(H)); 
title(['Amplitudová frekvenční charakteristika (' F ')']);
xlabel('Frekvence [Hz]'); ylabel('Přenos')
ax2 = subplot(2,1,2);
plot(fosa, unwrap(angle(H))); 
title(['Fazová frekvenční charakteristika (' F ')']);
xlabel('Frekvence [Hz]'); ylabel('Fáze')
linkaxes([ax1 ax2],'x');

% -------------------------------------------------------------------------
% FILTRACE EKG A ZOBRAZENÍ VÝSLEDKŮ

% Můžete využít tyto funkce:
% conv; filter; filtfilt

y = zeros(1,length(x)); 	% //DOPLŇTE// výpočet výstupního signálu

% vykreslíme signál
figure; 
ax3 = subplot(2,1,1); plot( x );
xlabel('Vzorky [-]'); ylabel('Napětí [\muV]'); title('Vstupní signál')
ax4 = subplot(2,1,2); plot( y );
xlabel('Vzorky [-]'); ylabel('Napětí [\muV]'); title(['Výstupní signál (' F ')'])
linkaxes([ax3 ax4],'x');

