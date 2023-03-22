program gerarEspacoFrequencias
    implicit none
    real*8, dimension(200) :: y_t
    real*8 :: dt 
    character :: label
    integer :: N
    read(*,*) label
    call leTabela(label, dt, y_t, N)
    call escreveFrequencias(y_t, dt, label, N)

    
end program gerarEspacoFrequencias

subroutine leTabela(label, dt, y_t, N)
    character, intent(in) :: label
    real*8, dimension(200), intent(out) :: y_t
    real*8, intent(out) :: dt
    integer, intent(out) :: N
    real*8 :: ignorada
    integer :: i

    open(1, file="../dados/arquivo_"//label//".dat")
    
    do i = 1, 200
        read(1,*, end=10) ignorada, y_t(i)
        if ( i == 1 ) then
            dt = ignorada
        end if
10  end do
    close(1)
    
    N = i
    
end subroutine leTabela

subroutine escreveFrequencias(y_t, dt, label, N)
    real*8, dimension(200), intent(in) :: y_t
    real*8, intent(in) :: dt
    character :: label
    integer :: k, N, M
    complex*16 :: Yk, currYk
    M = floor((N-1)/2.d0)

    open(2, file="../dados/saida-"//label//"-11820833.out")
    do k = 1, M
        currYk = Yk(k, y_t, N)
        write(1,*) k/(200*dt), real(currYk), aimag(currYk)
    end do
    close(2)
end subroutine escreveFrequencias

function Yk(k, y_t, N)
    integer, intent(in) :: k
    integer, intent(in) :: N
    real*8, dimension(200):: y_t
    complex*16 :: Yk, i = (0,1)
    real*8, parameter :: pi = 3.1415926537989
    integer :: j
    Yk = (0,0)
    somatoria : do  j = 1, N
        Yk = Yk + y_t(j)*exp(2.d0*pi*i*j*k/N)
    end do somatoria
    
end function Yk