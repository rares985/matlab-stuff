function w = eulermethod(a,b,N,cond_initiala)
%euler method
    h=(b-a)/N;
    t=a;
    aprox=cond_initiala;
    for i=1:N+1
        f=aprox+t;
        aprox=aprox+h*f;
        if (i==N+1)
            break 
        end
        t=a+i*h;
    end
    w=aprox;
end
