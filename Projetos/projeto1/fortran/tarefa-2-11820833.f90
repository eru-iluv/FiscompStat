program gerarSinais
    implicit none
    real*8 :: a1, a2, w1, w2, dt
    integer :: N
    ! (a) N = 200, ∆t = 0.04, a1 = 2, a2 = 4, ω1 = 4πHz, ω2 = 2.5πHz
    ! (b) N = 200, ∆t = 0.04, a1 = 3, a2 = 2, ω1 = 4πHz, ω2 = 2.5πHz
    ! (c) N = 200, ∆t = 0.4, a1 = 2, a2 = 4, ω1 = 4πHz, ω2 = 0.2πHz
    ! (d) N = 200, ∆t = 0.4, a1 = 3, a2 = 2 ω1 = 4πHz, ω2 = 0.2πHz
    ! (e) N = 200, ∆t = 0.04, a1 = 2, a2 = 4, ω1 = 4πHz, ω2 = 1.4πHz
    ! (f) N = 200, ∆t = 0.04, a1 = 2, a2 = 4, ω1 = 4.2πHz, ω2 = 1.4πHz
    open(1, file="data.in")
    read(1,*) N, dt, a1, a2, w1, w2
    close(1)
    call escreveSinal(N, dt, a1, a2, w1, w2)

end program gerarSinais


function calculaSinal(t, a1, a2, w1, w2) result(retval)
    real*8, intent(in) :: a1, a2, w1, w2, t
    real*8 :: retval
    retval = a1*cos(w1*t) + a2*sin(w2*t)
    
end function calculaSinal


subroutine escreveSinal(N, dt, a1,  a2, w1, w2)
    real*8, intent(in) :: a1, a2, w1, w2, dt
    integer, intent(in) :: N
    real*8 :: calculaSinal
    integer :: i
    
    open(1, file="data.out")

    do i = 1, N
        write(1, *) i*dt, calculaSinal(i*dt, a1, a2, w1, w2)
    end do
    
    close(1)
end subroutine escreveSinal
