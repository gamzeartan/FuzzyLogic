clc;
clear;
close all;

global X mu_X mu_xi  ;
altsinir_x=0; ustsinir_x=540; altsinir_y=0; ustsinir_y=54; altsinir_z=0; ustsinir_z=540; altsinir_t=0; ustsinir_t=1;
    
    %Numerik Giriþler
     xi=120; yi=18; ti=0.2; zi=0; 
    %Bulanýk kümelerin tanýmlanmasý
    
    %1.PM10 giriþine ait üyelik fonksiyonlarý ve bulanýklaþtýrma
    ucgen(altsinir_x,0,52,203,ustsinir_x,xi); x_Y=X; mu_Y=mu_X; mu_xi_Y=mu_xi;
    ucgen(altsinir_x,67,269,472,ustsinir_x,xi); x_Z=X; mu_Z=mu_X; mu_xi_Z=mu_xi;
    ucgen(altsinir_x,280.7,485.7,540,ustsinir_x,xi); x_T=X; mu_T=mu_X; mu_xi_T=mu_xi;
   
    %2.CO giriþine ait üyelik fonksiyonlarý ve bulanýklaþtýrma
    ucgen(altsinir_y,0,2.25,20.25,ustsinir_y,yi); y_Y2=X; mu_Y2=mu_X; mu_yi_Y2=mu_xi;
    ucgen(altsinir_y,6.75,27,42.25,ustsinir_y,yi); y_Z2=X; mu_Z2=mu_X; mu_yi_Z2=mu_xi;
    ucgen(altsinir_y,33.75,54,54,ustsinir_y,yi); y_T2=X; mu_T2=mu_X; mu_yi_T2=mu_xi;
    
    %2.SO2 giriþine ait üyelik fonksiyonlarý ve bulanýklaþtýrma
    ucgen(altsinir_t,0,0.375,0.416,ustsinir_t,ti); t_Y3=X; mu_Y3=mu_X; mu_ti_Y3=mu_xi;
    ucgen(altsinir_t,0.125,0.5,0.8755,ustsinir_t,ti); t_Z3=X; mu_Z3=mu_X; mu_ti_Z3=mu_xi;
    ucgen(altsinir_t,0.6175,0.9658,1,ustsinir_t,ti); t_T3=X; mu_T3=mu_X; mu_ti_T3=mu_xi;
   
    %3.Hava KAlite Ýndeksi (AGI) çýkýþýna ait üyelik fonksiyonlarý
    ucgen(altsinir_z,0,23.3,100,ustsinir_z,zi); z_YC=X; mu_YC=mu_X; 
    ucgen(altsinir_z,50,87.5,150,ustsinir_z,zi); z_O=X; mu_O=mu_X; 
    ucgen(altsinir_z,100,149.5,200,ustsinir_z,zi); z_SZ=X; mu_SZ=mu_X; 
    ucgen(altsinir_z,150,225,300,ustsinir_z,zi); z_ZC=X; mu_ZC=mu_X; 
    ucgen(altsinir_z,200,300,400,ustsinir_z,zi); z_CZ=X; mu_CZ=mu_X;
    ucgen(altsinir_z,300,481,540,ustsinir_z,zi); z_TC=X; mu_TC=mu_X; 

   
    %AND baðlacý ve min operatörü

    %1.Kural I,I,I ise 
    mu_kural1=min(min(mu_xi_Y,mu_yi_Y2),mu_ti_Y3);
    %2.Kural I,I,Z ise 
    mu_kural2=min(min(mu_xi_Y,mu_yi_Y2),mu_ti_Z3);
    %3.Kural I,Z,I ise 
    mu_kural3=min(min(mu_xi_Y,mu_yi_Z2),mu_ti_Y3);
    %4.Kural Z,I,I ÝSE 
    mu_kural4=min(min(mu_xi_Z,mu_yi_Y2),mu_ti_Y3);
    %5.Kural I,I,T ise 
    mu_kural5=min(min(mu_xi_Y,mu_yi_Y2),mu_ti_T3);
    %6.Kural I,T,I ise 
    mu_kural6=min(min(mu_xi_Y,mu_yi_T2),mu_ti_Y3);
    %7.Kural T,I,I ise 
    mu_kural7=min(min(mu_xi_T,mu_yi_Y2),mu_ti_Y3);
    %8.Kural Z,Z,Z ise 
    mu_kural8=min(min(mu_xi_Z,mu_yi_Z2),mu_ti_Z3);
    %9.Kural Z,Z,I ise 
    mu_kural9=min(min(mu_xi_Z,mu_yi_Z2),mu_ti_Y3);
    %10.Kural Z,I,Z ise 
    mu_kural10=min(min(mu_xi_Z,mu_yi_Y2),mu_ti_Z3);
    %11.Kural I,Z,Z ise 
    mu_kural11=min(min(mu_xi_Y,mu_yi_Z2),mu_ti_Z3);
    %12.Kural T,T,T  ise 
    mu_kural12=min(min(mu_xi_T,mu_yi_T2),mu_ti_T3);
    %13.Kural Z,Z,T ise 
    mu_kural13=min(min(mu_xi_Z,mu_yi_Z2),mu_ti_T3);
    %14.Kural Z,T,Z ise 
    mu_kural14=min(min(mu_xi_Z,mu_yi_T2),mu_ti_Z3);
    %15.Kural T,Z,Z ise 
    mu_kural15=min(min(mu_xi_T,mu_yi_Z2),mu_ti_Z3);
    %16.Kural T,T,Z ise 
    mu_kural16=min(min(mu_xi_T,mu_yi_T2),mu_ti_Z3);
    %17.Kural T,Z,T ise 
    mu_kural17=min(min(mu_xi_T,mu_yi_Z2),mu_ti_T3);
    %18.Kural Z,T,T ise 
    mu_kural18=min(min(mu_xi_Z,mu_yi_T2),mu_ti_T3);
    %19.Kural I,I,T ise 
    mu_kural19=min(min(mu_xi_Y,mu_yi_Y2),mu_ti_T3);
    %20.Kural I,T,I ise 
    mu_kural20=min(min(mu_xi_Y,mu_yi_T2),mu_ti_Y3);
    %21.Kural T,I,I  ise 
    mu_kural21=min(min(mu_xi_T,mu_yi_Y2),mu_ti_Y3);
    %22.Kural I,Z,T ise 
    mu_kural22=min(min(mu_xi_Y,mu_yi_Z2),mu_ti_T3);
    %23.Kural T,I,Z ise 
    mu_kural23=min(min(mu_xi_T,mu_yi_Y2),mu_ti_Z3);
    %24.Kural T,T,I ise 
    mu_kural24=min(min(mu_xi_T,mu_yi_T2),mu_ti_T3);
    %25.Kural T,I,T ise 
    mu_kural25=min(min(mu_xi_T,mu_yi_Y2),mu_ti_T3);
    %26.Kural I,T,T ise 
    mu_kural26=min(min(mu_xi_Y,mu_yi_T2),mu_ti_T3);
   

   
    
    %Gerektirme operatörü olarak prod(*) 

    %1.Kural
    mu_sonuc1=mu_kural1*mu_YC;
    %2.Kural
    mu_sonuc2=mu_kural2*mu_O;
    %3.Kural
    mu_sonuc3=mu_kural3*mu_O;
    %4.Kural
    mu_sonuc4=mu_kural4*mu_O;
    %5.Kural
    mu_sonuc5=mu_kural5*mu_SZ;
    %6.Kural
    mu_sonuc6=mu_kural6*mu_SZ;
    %7.Kural
    mu_sonuc7=mu_kural7*mu_SZ;
    %8.Kural
    mu_sonuc8=mu_kural8*mu_ZC;
    %9.Kural
    mu_sonuc9=mu_kural9*mu_SZ;
    %10.Kural
    mu_sonuc10=mu_kural10*mu_SZ;
    %11.Kural
    mu_sonuc11=mu_kural11*mu_SZ;
    %12.Kural
    mu_sonuc12=mu_kural12*mu_CZ;
    %13.Kural
    mu_sonuc13=mu_kural13*mu_TC;
    %14.Kural
    mu_sonuc14=mu_kural14*mu_TC;
    %15.Kural
    mu_sonuc15=mu_kural15*mu_TC;
    %16.Kural
    mu_sonuc16=mu_kural16*mu_CZ;
    %17.Kural
    mu_sonuc17=mu_kural17*mu_CZ;
    %18.Kural
    mu_sonuc18=mu_kural18*mu_CZ;
    %19.Kural
    mu_sonuc19=mu_kural19*mu_CZ;
    %20.Kural
    mu_sonuc20=mu_kural20*mu_CZ;
    %21.Kural
    mu_sonuc21=mu_kural21*mu_CZ;
    %22.Kural
    mu_sonuc22=mu_kural22*mu_TC;
    %23.Kural
    mu_sonuc23=mu_kural23*mu_TC;
    %24.Kural
    mu_sonuc24=mu_kural24*mu_SZ;
    %25.Kural
    mu_sonuc25=mu_kural25*mu_SZ;
    %26.Kural
    mu_sonuc26=mu_kural26*mu_SZ;
    
    
    
    %Birleþtirme iþlemi ve  Çýkýþ Bulanýk kümesinin çizdirilmesi, birleþtirme opertörü olarak max 
    mu_birlestirme=max([max(mu_sonuc1,mu_sonuc2);max(mu_sonuc3,mu_sonuc4);max(mu_sonuc5,mu_sonuc6);max(mu_sonuc7,mu_sonuc8);max(mu_sonuc9,mu_sonuc10);max(mu_sonuc11,mu_sonuc12);max(mu_sonuc13,mu_sonuc14);max(mu_sonuc15,mu_sonuc16);max(mu_sonuc17,mu_sonuc18);max(mu_sonuc19,mu_sonuc20);max(mu_sonuc21,mu_sonuc22);max(mu_sonuc23,mu_sonuc24);max(mu_sonuc25,mu_sonuc26)]);
    plot(X,mu_birlestirme);

    %Durulaþtýrma iþlemi ve durulaþtýrma sonucunun grafikte gösterimi
    toplam_alan=sum(mu_birlestirme);
    if toplam_alan == 0
        'Agýrlýk Merkezi Yönteminde Toplam Alan Sýfýr';
    end
    z=sum(mu_birlestirme.*X)/toplam_alan;
    hold on;
    boy=0:0.01:1;
    line(z*ones(size(boy)),boy)
 

