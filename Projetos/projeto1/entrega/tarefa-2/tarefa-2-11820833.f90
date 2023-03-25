program gerarSinais
    implicit none
    real*8, parameter :: pi = 3.1415926537989
    ! (a) N = 200, ∆t = 0.04, a1 = 2, a2 = 4, ω1 = 4πHz, ω2 = 2.5πHz
    ! (b) N = 200, ∆t = 0.04, a1 = 3, a2 = 2, ω1 = 4πHz, ω2 = 2.5πHz
    ! (c) N = 200, ∆t = 0.4, a1 = 2, a2 = 4, ω1 = 4πHz, ω2 = 0.2πHz
    ! (d) N = 200, ∆t = 0.4, a1 = 3, a2 = 2 ω1 = 4πHz, ω2 = 0.2πHz

    call escreveSinal(200, 0.04d0, 2.d0, 4.d0, 4.d0*pi, 2.5d0, "a")
    call escreveSinal(200, 0.04d0, 3.d0, 2.d0, 4.d0*pi, 2.5d0, "b")
    call escreveSinal(200, 0.4d0, 2.d0, 4.d0, 4.d0*pi, 0.2d0, "c")
    call escreveSinal(200, 0.4d0, 3.d0, 2.d0, 4.d0*pi, 0.2d0, "d")
end program gerarSinais


subroutine escreveSinal(N, dt, a1,  a2, w1, w2, label)
    real*8, intent(in) :: a1, a2, w1, w2, dt
    integer, intent(in) :: N
    character, intent(in) :: label
    real*8 :: calculaSinal
    integer :: i

    open(1, file="saida-2-"//label)

    do i = 1, N
        write(1, *) i*dt, calculaSinal(i*dt, a1, a2, w1, w2)
    end do

    close(1)

end subroutine escreveSinal


function calculaSinal(t, a1, a2, w1, w2) result(retval)
    real*8, intent(in) :: a1, a2, w1, w2, t
    real*8 :: retval
    retval = a1*cos(w1*t) + a2*sin(w2*t)

end function calculaSinal
