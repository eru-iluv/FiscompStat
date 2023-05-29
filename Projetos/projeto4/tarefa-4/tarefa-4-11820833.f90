module DlaModules
    implicit none
    real(8), parameter :: pi =  acos(-1.d0)
    integer, parameter :: idx(0:8) = (/-1, -1, -1,  0, 0, 0,  1, 1, 1/),&
                          idy(0:8) = (/-1,  0,  1, -1, 0, 1, -1, 0, 1/)
contains    

    integer function bernoulli(p)
        real(8) :: p, numAleatorio
        call random_number(numAleatorio)
        if ( numAleatorio < p ) then
            bernoulli = 1
        else 
            bernoulli = 0
        end if
    end function bernoulli

    subroutine andarDoBebado(x,  y)
        integer, intent(out) :: x, y
        real(8) ::  numAleatorio
        integer ::  idr
        
        call random_number(numAleatorio)
        idr = nint(8*numAleatorio)

        x = x + idx(idr)
        y = y + idy(idr)
    end subroutine andarDoBebado
    

    subroutine escrevePonto(x,  y, numPontos, z)
        integer, intent(in) :: x, y, numPontos
        integer :: z
        write(1, *) x, y, numPontos, z
    end subroutine escrevePonto


    integer function numVizinhos(x, y, tabuleiro)
        integer :: x, y, tabuleiro(-100:100,0:100)
        numVizinhos = tabuleiro(x+1,y) &
            + tabuleiro(x-1,y) + tabuleiro(x,y+1) &
            + tabuleiro(x, y-1)
    end function numVizinhos


    subroutine geraPonto(z, tabuleiro, numPontos)
        integer :: x, y, tabuleiro(-100:100,0:100), numPontos
        integer, intent(out) :: z
        real(8) :: numAleatorio
        ! y0 pertence [yMin - dy, yMin + dy]
        integer :: yMin, dy
        
        ! gera x
        call random_number(numAleatorio)
        yMin = z + 5
        dy = nint(0.5d0*yMin)
        y = (yMin + nint(dy*numAleatorio)) 

        call random_number(numAleatorio)
        x = nint(200*numAleatorio-100)

        do while ( x /= 0 .and. x < 1.5d0*yMin .and. &
             abs(x) < 99 .and. abs(y) < 99 )
            call andarDoBebado(x,y)
            ! Achou local para acoplar, atualiza tabuleiro
            if ( numVizinhos(x,y,tabuleiro) > 0 ) then
                numPontos = numPontos + 1
                tabuleiro(x,y) = numPontos
                if ( y > z  ) then
                    z = y  
                end if
                call escrevePonto(x, y, numPontos, z)
                
                exit
            end if

        end do

    end subroutine geraPonto

    
end module DlaModules

program DLA
    use DlaModules
    implicit none
    integer :: tabuleiro(-100:100,0:100)
    integer :: numPontos, z = 0, i = 0
    ! Iniciamos nosso tabuleiro
    tabuleiro = 0

    open(1, file="saida-4-11820833")
    do i = -100,100
        tabuleiro(i,0) = 1
        call escrevePonto(i, 0, 0, 0)
    end do

    numPontos = 1
    
    do while (numPontos .le. 3000 .and. z < 90)
        call geraPonto(z, tabuleiro, numPontos)
    end do
    close(1)


end program DLA