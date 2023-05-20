module DlaModule
    implicit none
    real(8), parameter :: pi =  acos(-1.d0)
    integer, parameter :: idx(0:8) = (/-1, -1, -1,  0, 0, 0,  1, 1, 1/),&
                          idy(0:8) = (/-1,  0,  1, -1, 0, 1, -1, 0, 1/)
contains    

    subroutine andarDoBebado(x,  y)
        integer, intent(out) :: x, y
        real(8) ::  numAleatorio
        integer ::  idr
        
        call random_number(numAleatorio)
        idr = nint(8*numAleatorio)

        x = x + idx(idr)
        y = y + idy(idr)
    end subroutine andarDoBebado
    

    subroutine escrevePonto(x,  y, numPontos, r)
        integer, intent(in) :: x, y, numPontos
        real(8) :: r
        write(1, *) x, y, numPontos, r
    end subroutine escrevePonto


    integer function numVizinhos(x, y,tabuleiro)
        integer :: x, y, tabuleiro(-100:100,-100:100)
        numVizinhos = tabuleiro(x+1,y) &
            + tabuleiro(x-1,y) + tabuleiro(x,y+1) &
            + tabuleiro(x, y-1)
    end function numVizinhos


    integer function raioQuad(x, y)
        integer, intent(in) :: x, y
        raioQuad = x**2 + y**2
    end function raioQuad


    subroutine geraPonto(r, tabuleiro, numPontos)
        integer :: x, y, tabuleiro(-100:100,-100:100), numPontos
        real(8), intent(out) :: r
        real(8) :: teta, numAleatorio
        ! rho pertence [rhoMin, rhoMin + drho]
        real(8) :: rhoMin, drho, rho 

        ! gera teta
        call random_number(numAleatorio)
        teta =  2*pi*numAleatorio
        
        ! gera p
        call random_number(numAleatorio)
        rhoMin = r + 5
        drho = 0.5d0*rhoMin
        rho = rhoMin + drho*numAleatorio 
        x = floor(rho*cos(teta))
        y = floor(rho*sin(teta))

        do while ( raioQuad(x, y) .le. (1.5d0*rhoMin)**2 &
             .and. abs(x) < 99 .and. abs(y) < 99 )
            call andarDoBebado(x,y)
            
            ! Achou local para acoplar, atualiza tabuleiro
            if ( numVizinhos(x,y,tabuleiro) > 0 ) then
                numPontos = numPontos + 1
                tabuleiro(x,y) = numPontos
                if ( raioQuad(x,y) > r**2  ) then
                    r = raioQuad(x,y)**(1.d0/2.d0)  
                end if
                call escrevePonto(x, y, numPontos,r)
                
                exit
            end if

        end do

    end subroutine geraPonto
        
end module DlaModule

program DLA
    use DlaModule
    integer, save :: tabuleiro(-100:100,-100:100)
    integer :: numPontos
    real(8) :: r

    ! Iniciamos nosso tabuleiro
    tabuleiro = 0
    tabuleiro(0,0) = 1
    numPontos = 1
    
    open(1, file="saida-1-11820833")
    
    r = 0.d0
    
    do while (numPontos .le. 3000 .and. r < 98)
        call geraPonto(r, tabuleiro, numPontos)
    end do
    close(1)

end program DLA