
module isingModule
    implicit none
    integer :: L = 100
    real(8) :: listaExp(-4 : 4)
    integer, allocatable :: iProx(:), iAnt(:)
    integer(1), allocatable :: spins(:,:)
contains
    
    ! Função de bernoulli
    ! Para p = 0.5, se torna um gerador
    ! de 0 ou 1 com probabilidade identica
    integer(1) function bernoulli(p)
        real(8) :: p, numAleatorio
        call random_number(numAleatorio)
        if ( numAleatorio < p ) then
            bernoulli = 1
        else 
            bernoulli = -1
        end if
    end function bernoulli
    

    integer function intAleatorio(valMax)
        real :: numAleatorio
        integer :: valMax
        call random_number(numAleatorio)
        intAleatorio = nint(valMax*numAleatorio)
    end function intAleatorio


    integer(1) function vizinhos(i, j)
        integer, intent(in) :: i, j
        
        vizinhos = spins(iAnt(i), j) + spins(iProx(i),j) &
                           + spins(i, iAnt(j)) + spins(i, iProx(j))
        
        ! write(*,*) vizinhos
    end function vizinhos

    
    subroutine iniciaListaExp(beta)
        integer :: i
        real(8) :: beta
        do i = -4, 4
            listaExp(i) = exp(-i*beta)
        end do
    end subroutine iniciaListaExp
        

    subroutine iniciaIProxIMenos()
        integer :: i

        do i = 1, L
            iProx(i) = i + 1
            iAnt(i) = i - 1
        end do

        iProx(L) = 1
        iAnt(1) = L
    end subroutine iniciaIProxIMenos

    subroutine escreveMagE(beta, magnet, E)
        real(8), intent(in) :: E, beta
        integer, intent(in) :: magnet
        
        write(2,*) beta, magnet, E

    end subroutine escreveMagE

    subroutine escreveSpins()
        character*1 isimb(-1:1)
        integer :: i, j
        isimb(1) = '+'
        isimb(0) = 'E'
        isimb(-1) = '-'
        
        do i = 1, L
            write(1,*) (isimb(spins(i,j)),j=1,L)
        end do
                    
    end subroutine escreveSpins


    subroutine iniciaMalha(magnet)
        integer :: i, j, magnet
        
        do i = 1, L
            do j = 1, L/2
                spins(i, j) = bernoulli(0.5d0)
                if ( spins(i,j) == 1 ) then
                    magnet = magnet + 1
                else 
                    magnet = magnet - 1
                end if
            end do
            do j = L/2 + 1, L
                spins(i, j) = 1
                magnet = magnet + 1
            end do
        end do
        
    end subroutine iniciaMalha


    real(8) function calculaE()

        integer :: i, j
        real(8) :: dobroE
        
        dobroE = 0.d0

        do i = 1, L
            do j = 1, L 
                dobroE = dobroE &
                    - 1.d0*spins(i,j)*vizinhos(i, j)
            end do            
        end do 
        
        calculaE = dobroE/2.d0
    end function calculaE


    subroutine alteraS(E, magnet)
        real(8) :: E, dE
        integer :: i, j, magnet
        integer(1) :: deltaM
        integer(1) :: s
        real(8) :: probMudar, numAleatorio

        i = intAleatorio(L-1) + 1 ! Gera numeros entre 1 e 60 
        j = intAleatorio(L-1) + 1 

        
        s = spins(i,j)

        deltaM = vizinhos(i,j)
        dE =  -1*s*deltaM

        probMudar = listaExp(s*deltaM) / &
                (listaExp(s*deltaM) + listaExp(-s*deltaM))
        call random_number(numAleatorio)
        
        if ( numAleatorio < probMudar) then
            spins(i, j) = -s
            magnet = magnet - 2*s
            E = E - 2*dE

        end if

    end subroutine alteraS

end module isingModule


program isingModel
    use isingModule
    implicit none
    integer :: i, iMC, magnet = 0
    real(8) :: beta = 0.d0
    real(8) :: E
    
    read(*,*) beta, L
    
    allocate(iProx(L), iAnt(L), spins(L,L))

    call iniciaIProxIMenos()
    call iniciaMalha(magnet)
    call iniciaListaExp(beta)
    E = calculaE()

    open(2, file="saida-c-2")

    do iMC = 0, 3000
        call escreveMagE(beta, magnet, E)
        
        do i = 0, 3000
            call alteraS(E, magnet)
        end do
        
        call iniciaListaExp(beta)

    end do

    close(2)

end program isingModel
