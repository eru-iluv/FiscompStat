program gerarSinais
    implicit none
    real*8, parameter :: pi = 3.1415926537989
    ! (a) N = 200, ∆t = 0.04, a1 = 2, a2 = 4, ω1 = 4πHz, ω2 = 2.5πHz
    ! N = 50
    ! N = 100
    ! N = 200
    ! N = 400
    call escreveSinal(50, 0.04d0, 2.d0, 4.d0, 4*pi, 2.5*pi, "050")
    call escreveSinal(100, 0.04d0, 2.d0, 4.d0, 4*pi, 2.5*pi, "100")
    call escreveSinal(200, 0.04d0, 2.d0, 4.d0, 4*pi, 2.5*pi, "200")
    call escreveSinal(400, 0.04d0, 2.d0, 4.d0, 4*pi, 2.5*pi, "400")

end program gerarSinais


function calculaSinal(t, a1, a2, w1, w2) result(retval)
    real*8, intent(in) :: a1, a2, w1, w2, t
    real*8 :: retval
    retval = a1*cos(w1*t) + a2*sin(w2*t)
    
end function calculaSinal


subroutine escreveSinal(N, dt, a1,  a2, w1, w2, Nchar)
    character*3 :: Nchar
    real*8, intent(in) :: a1, a2, w1, w2, dt
    integer, intent(in) :: N
    real*8 :: calculaSinal
    integer :: i
    
    open(1, file="../dados/tarefa-5-"//Nchar//"-11820833.in")

    do i = 1, N
        write(1, *) i*dt, calculaSinal(i*dt, a1, a2, w1, w2)
    end do
    
    close(1)
end subroutine escreveSinal