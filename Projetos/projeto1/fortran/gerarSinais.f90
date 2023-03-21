program gerarSinais
    implicit none
    real*8, parameter :: pi = 3.1415926537989
    ! (a) N = 200, ∆t = 0.04, a1 = 2, a2 = 4, ω1 = 4πHz, ω2 = 2.5πHz
    ! (b) N = 200, ∆t = 0.04, a1 = 3, a2 = 2, ω1 = 4πHz, ω2 = 2.5πHz
    ! (c) N = 200, ∆t = 0.4, a1 = 2, a2 = 4, ω1 = 4πHz, ω2 = 0.2πHz
    ! (d) N = 200, ∆t = 0.4, a1 = 3, a2 = 2 ω1 = 4πHz, ω2 = 0.2πHz
    ! (e) N = 200, ∆t = 0.04, a1 = 2, a2 = 4, ω1 = 4πHz, ω2 = 1.4πHz
    ! (f) N = 200, ∆t = 0.04, a1 = 2, a2 = 4, ω1 = 4.2πHz, ω2 = 1.4πHz
    call escreveSinal("a", 200, 0.04d0, 2.d0, 4.d0, 4.d0*pi, 2.5d0*pi)
    call escreveSinal("b", 200, 0.04d0, 3.d0, 2.d0, 4.d0*pi, 2.5d0*pi)
    call escreveSinal("c", 200, 0.4d0, 2.d0, 4.d0, 4.d0*pi, 0.2d0*pi)
    call escreveSinal("d", 200, 0.4d0, 3.d0, 2.d0, 4.d0*pi, 0.2d0*pi)
    call escreveSinal("e", 200, 0.04d0, 2.d0, 4.d0, 4.d0*pi, 1.4d0*pi)
    call escreveSinal("f", 200, 0.04d0, 2.d0, 4.d0, 4.2d0*pi, 1.4d0*pi)

end program gerarSinais


function calculaSinal(t, a1, a2, w1, w2) result(retval)
    real*8, intent(in) :: a1, a2, w1, w2, t
    real*8 :: retval
    retval = a1*cos(w1*t) + a2*sin(w2*t)
    
end function calculaSinal


subroutine escreveSinal(labelSinal, N, dt, a1,  a2, w1, w2)
    real*8, intent(in) :: a1, a2, w1, w2, dt
    integer, intent(in) :: N
    character :: labelSinal
    real*8 :: calculaSinal
    integer :: i
    
    open(1, file="../dados/arquivo_"//labelsinal//".dat")

    do i = 1, N
        write(1, *) i*dt, calculaSinal(i*dt, a1, a2, w1, w2)
    end do
    
    close(1)
end subroutine escreveSinal