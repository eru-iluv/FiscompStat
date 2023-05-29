module DlaModule
    implicit none
    real(8), parameter :: pi =  acos(-1.d0)

contains    

    subroutine andarDoBebado(x,  y, z)
        integer, intent(out) :: x, y, z
        real(8) ::  numAleatorio
        integer ::  dx, dy, dz
        
        call random_number(numAleatorio)
        dx = nint(2*numAleatorio - 1)
        x = x + dx

        call random_number(numAleatorio)
        dy = nint(2*numAleatorio - 1)
        y = y + dy
        
        call random_number(numAleatorio)
        dz = nint(2*numAleatorio - 1)
        z = z + dz
    end subroutine andarDoBebado
    

    subroutine escrevePonto(numPontos, r)
        integer, intent(in) :: numPontos
        real(8) :: r
        write(1, *) numPontos, r
    end subroutine escrevePonto


    integer function raioQuad(x, y, z)
        integer, intent(in) :: x, y, z
        raioQuad = x**2 + y**2 + z**2
    end function raioQuad



    integer function numVizinhos(x, y, z, tabuleiro)
        integer :: x, y, z, tabuleiro(-75:75,-75:75,-75:75)
        numVizinhos = &
            tabuleiro(x+1, y, z) + tabuleiro(x-1,y,z) + &
            tabuleiro(x, y+1, z) + tabuleiro(x,y-1,z) + &
            tabuleiro(x, y, z+1) + tabuleiro(x,y,z-1)
    end function numVizinhos


    subroutine geraPonto(r, tabuleiro, numPontos)
        integer :: x, y, z, tabuleiro(-75:75,-75:75,-75:75), numPontos
        real(8), intent(out) :: r
        real(8) :: teta, fi, numAleatorio
        ! rho pertence [rhoMin, rhoMin + drho]
        real(8) :: rhoMin, drho, rho 

        ! gera teta
        call random_number(numAleatorio)
        teta =  pi*numAleatorio
        
        ! gera fi
        call random_number(numAleatorio)
        fi = 2*pi*numAleatorio

        ! gera p
        call random_number(numAleatorio)
        rhoMin = r + 5
        drho = 0.5d0*rhoMin
        rho = rhoMin + drho*numAleatorio 
        x = floor(rho*sin(teta)*cos(fi))
        y = floor(rho*sin(teta)*sin(fi))
        z = floor(rho*cos(teta))

        do while ( raioQuad(x,y,z) .le. (1.5d0*rhoMin)**2 &
             .and. abs(x) < 74 .and. abs(y) < 74 .and. abs(z) < 74 )
            call andarDoBebado(x,y,z)
            ! Achou local para acoplar, atualiza tabuleiro
            if ( numVizinhos(x,y, z, tabuleiro) > 0 ) then
                numPontos = numPontos + 1
                tabuleiro(x,y,z) = 1
                if ( raioQuad(x,y,z) > r**2  ) then
                    r = raioQuad(x,y,z)**(1.d0/2.d0)  
                end if
                call escrevePonto(numPontos,r)
                exit
            end if

        end do

    end subroutine geraPonto
    
end module DlaModule

program DLA_3D
    use DlaModule
    implicit none
    integer, save :: tabuleiro(-75:75,-75:75,-75:75)
    integer :: numPontos 
    real(8) :: r

    ! Iniciamos nosso tabuleiro
    tabuleiro = 0
    tabuleiro(0,0,0) = 1
    numPontos = 1
    
    open(1, file="saida-3-11820833")
    
    r = 0.d0
    
    do while (numPontos .le. 10000 .and. r < 70)
        call geraPonto(r, tabuleiro, numPontos)
    end do
    close(1)    


end program DLA_3D