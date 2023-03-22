program gerarEspacoFrequencias
    implicit none
    real*8, dimension(200) :: y_t
    real*8 :: dt 
    character :: label
    
    read(*,*) label
    call leTabela(label, dt, y_t)
    call escreveFrequencias(y_t, dt, label)

    
end program gerarEspacoFrequencias

function Yk(k, y_t)
    integer, intent(in) :: k
    integer :: N = 200
    real*8, dimension(200):: y_t
    complex*16 :: Yk, i = (0,1)
    real*8, parameter :: pi = 3.1415926537989
    integer :: j
    Yk = (0,0)
    somatoria : do  j = 1, 200
        Yk = Yk + y_t(j)*exp(2.d0*pi*i*j*k/N)
    end do somatoria
    
end function Yk

subroutine leTabela(label, dt, y_t)
    character, intent(in) :: label
    real*8, dimension(200), intent(out) :: y_t
    real*8, intent(out) :: dt
    real*8 :: ignorada
    integer :: i

    open(1, file="../dados/arquivo_"//label//".dat")
    
    do i = 1, 200
        read(1,*) ignorada, y_t(i)
        if ( i == 1 ) then
            dt = ignorada
        end if
    end do
    close(1)

end subroutine leTabela

subroutine escreveFrequencias(y_t, dt, label)
    real*8, dimension(200), intent(in) :: y_t
    real*8, intent(in) :: dt
    character :: label
    integer :: k
    complex*16 :: Yk, currYk
    
    open(1, file="../dados/saida-"//label//"-11820833.out")
    do k = 0, 99
        currYk = Yk(k, y_t)
        write(1,*) k/(200*dt), real(currYk), aimag(currYk)
    end do
    close(1)
end subroutine escreveFrequencias