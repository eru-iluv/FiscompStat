program gerarEspacoFrequencias
    implicit none
    real*8, dimension(200) :: t, y_t
    character :: label
    
    read(*,*) label
    call leTabela(label, t, y_t)
    call escreveFrequencias(y_t, t)

    
end program gerarEspacoFrequencias

function Yk(k, y_t)
    integer, intent(in) :: k
    integer :: N = 200
    real*8, dimension(200):: y_t
    complex*16 :: Yk, i = (0,1)
    real*8, parameter :: pi = 3.1415926537989
    integer :: j
    Yk = (0,0)
    ! TODO: Realmente vou usar o tempo??
    somatoria : do  j = 1, 200
        Yk = Yk + y_t(j)*exp(2.d0*pi*i*j*k/N)
    end do somatoria
    
end function Yk

subroutine leTabela(label, t, y_t)
    character, intent(in) :: label
    real*8, dimension(200), intent(out) ::  t, y_t
    integer :: i

    open(1, file="dados/arquivo_"//label//".dat")
    
    do i = 1, 200
        read(1,*) t(i), y_t(i)
    end do

end subroutine leTabela

subroutine escreveFrequencias(y_t, t)
    real*8, dimension(200), intent(in) :: y_t, t
    integer :: k
    complex*16 :: Yk, currYk
    
    open(1, file="../dados/saida-4-11820833.out")
    do k = 0, 99
        currYk = Yk(k, y_t)
        write(1,*) k/(200*t(1)), real(currYk), aimag(currYk)
    end do
    
end subroutine escreveFrequencias