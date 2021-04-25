program connoz
        !This is a program to compute nozzle charactaristics
        real::po,to,mdot,r,lratio,pe,patm      
        real::tstar,pstar,rhostar,astar,aout,m,gama,me,te,rhoe
        real::de,dt,pi
        real::thrustp,thrustm,thrust
        write(*,*)"Please enter the Chamber Pressure in Pa"
        read *,po
        write(*,*)"Please enter the Chamber Temperature in K"
        read *,to
        write(*,*)"Please enter the MassFlow rate in Kg/s"
        read *,mdot
        write(*,*)"Please enter the Gas Constant"
        read *,r
        write(*,*)"Please enter the Exhaust Pressure"
        read *,pe
        write(*,*)"Please enter the ratio of specific heats"
        read *,gama
        pi=3.141592654
        patm=101325
        tstar=(2/(gama+1))*to
        pstar=((2/(gama+1))**((gama-1)/gama))*po
        rhostar=pstar/(r*tstar)
        astar=mdot/(rhostar*((gama*r*tstar)**0.5))
        me=((2/(gama-1))*(((pstar/pe)**((gama-1)/gama))-1))**0.5
        te=tstar/(1+(((gama-1)/2)*(me**2)))
        rhoe=pe/(r*te)
        aout=mdot/(rhoe*((gama*r*te)**0.5))
        de=((4*aout)/pi)**0.5
        dt=((4*astar)/pi)**0.5
        thrustp=(pe-patm)*aout
        thrustm=mdot*me*((gama*r*te)**0.5)
        thrust=thrustp+thrustm
        write(*,*)"The throat area is", astar,"m2"
        write(*,*)"The throat dia is", dt, "m"
        write(*,*)"The inlet and exhaust areas are",aout,"m2"
        write(*,*)"The diameters are ",de,"m2"
        write(*,*)"Pressure Thrust is",thrustp,"N"
        write(*,*)"Momantum thrust is",thrustm,"N"
        write(*,*)"Total thust is",thrust,"N"
        write(*,*)"Mach number at exhaust is:",me
end program connoz
