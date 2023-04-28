program main
module fourierMod
    implicit none
    public :: escreveFrequencias

contains

    subroutine escreveFrequencias(y_t, dt, N, file)
        real*8, intent(in) :: dt, y_t(:)
        real*8 :: frequencia
        integer :: k, N, M, file
        complex*16 :: currYk

        ! M é o maior natural < N/2
        M = floor((N-1)/2.d0)
        do k = 0, M
            currYk = Yk(k, y_t, N)
            frequencia = k/(N*dt)
            write(file,'(3000F20.8)') frequencia, &
                real(currYk)**2 + aimag(currYk)**2
        end do
    end subroutine escreveFrequencias

    complex*16  function Yk(k, y_t, N)
        integer, intent(in) :: k
        integer, intent(in) :: N
        real*8:: y_t(:)
        complex*16 :: i = (0,1)
        real*8, parameter :: pi = acos(-1.d0)
        integer :: j
        Yk = (0,0)
        somatoria : do  j = 1, N
            Yk = Yk + y_t(j)*exp(2.d0*pi*i*j*k/N)
        end do somatoria
    end function Yk

end module fourierMod

end program main
