close all;
t=0:0.0001:5;

fo=1.3;
fs=2;

tSamp=0:1/fs:5;

xCount=cos(2*pi*fo*t);
xSamp=cos(2*pi*fo*tSamp);

figure;
hold on;
set(gca,'fontsize',9,'fontweight','bold');
plot(t,xCount,'b','linewidth',2);
plot(tSamp,xSamp,'ko','linewidth',2);

if fs < 2 * fo
    contin=1;
    m=0;
    while(contin)
        fAlias=abs(fo-m*fs);
        if fAlias <= fs/2
            contin=0;
        else
            m=m+1
        end
    end
        plot(t,cos(2*pi*fAlias*t),'r','linewidth',2);
        title(['Aliased Frequency ',num2str(fAlias) ' Hz ']);
else
    title('No Alias');
end

            
        