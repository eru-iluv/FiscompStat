program gerarEspacoAmplitude
    implicit none
    complex*16, dimension(100) :: Yk
    integer :: N

    call leTabela(N, Yk)
    call escreveAmplitude(Yk, N)

end program gerarEspacoAmplitude


subroutine leTabela(N, Yk)
    real*8 ::  ignorada, Yk_real, Yk_imaginaria
    complex*16, dimension(100), intent(out) :: Yk
    integer, intent(out) :: N
    integer :: i

    open(1, file="../tarefa-1/data.out")

    do i = 1, 100
        read(1,*, end=10) ignorada, Yk_real, Yk_imaginaria
        Yk(i) = complex(Yk_real, Yk_imaginaria)
 10 end do
        N = i - 1
end subroutine leTabela

subroutine escreveAmplitude(Yk, N)
    complex*16, dimension(100), intent(in) :: Yk
    ! Aqui não temos como obter o
    ! dt de maneira mais orgânica
    real*8 :: dt = 0.04d0
    integer :: j
    complex*16 :: y_j, curr_y_j

    open(1, file="saida-4-11820833")
    do j = 1, 2*N
        curr_y_j = y_j(j, N, Yk)
        write(1,*) j*dt, real(curr_y_j)
    end do
    close(1)

end subroutine escreveAmplitude

function y_j(j, N, Yk)
    integer, intent(in) :: j
    complex*16, dimension(100), intent(in):: Yk
    integer, intent(in) :: N
    complex*16:: i = (0,1)
    complex*16 :: y_j
    real*8, parameter :: pi = 3.1415926537989
    integer :: k

    somatoria : do  k = 1, 100
        y_j = y_j + Yk(k)*exp(-2.d0*pi*i*j*k/(2*N))
    end do somatoria

    y_j = y_j/N

end function y_j
