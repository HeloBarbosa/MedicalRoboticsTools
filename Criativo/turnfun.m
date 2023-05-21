function turnfun = turnfun(entradas)

global turn

t=entradas(1);

if (t>=0.38) %Ponto de coleta
    turn=-1;
end

turnfun=turn;

end
