program gerarEspacoAmplitude
    implicit none
    complex*16, dimension(200) :: Yk
    real*8 :: dt
    character :: label
    
    read(*,*) label
    call leTabela(label, Yk, dt)
    call escreveAmplitude(Yk, dt, label)
    
end program gerarEspacoAmplitude


function y_j(j, Yk)
    integer, intent(in) :: j
    complex*16, dimension(200), intent(in):: Yk 
    integer :: N = 200
    complex*16:: i = (0,1)
    complex*16 :: y_j
    real*8, parameter :: pi = 3.1415926537989
    integer :: k
    somatoria : do  k = 1, 200
        y_j = y_j + Yk(j)*exp(-2.d0*pi*i*j*k/N)
    end do somatoria
    
    y_j = y_j/200.d0

end function y_j

subroutine leTabela(label, Yk, dt)
    character, intent(in) :: label
    real*8 ::  ignorada, Yk_real, Yk_imaginaria
    complex*16, dimension(200), intent(out) :: Yk
    real*8, intent(out) :: dt
    integer :: i

    open(1, file="../dados/saida-"//label//"-11820833.out")
    
    do i = 1, 200
        read(1,*) ignorada, Yk_real, Yk_imaginaria
        Yk(i) = complex(Yk_real, Yk_imaginaria)
        
        if ( i==1 ) then
            dt = ignorada
        end if
    end do

end subroutine leTabela

subroutine escreveAmplitude(Yk, dt, label)
    complex*16, dimension(200), intent(in) :: Yk
    real*8, intent(in) :: dt
    character :: label
    integer :: j
    complex*16 :: y_j, curr_y_j
    
    open(1, file="../dados/saida-"//label//"inversa-11820833.out")
    do j = 0, 99
        curr_y_j = y_j(k, Yk)
        write(1,*) j*dt, real(currYk)
    end do
    
end subroutine escreveAmplitude