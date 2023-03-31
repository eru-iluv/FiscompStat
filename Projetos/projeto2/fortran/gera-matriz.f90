program geraOnda
    implicit none
    real*8, parameter :: L = 1.d0, c = 300.d0, dt = 1.d0/30000.d0, dx = dt*300
    integer, parameter :: size_x = nint(L/dx)  
    integer, parameter :: size_t = nint(L/dt)
    real*8, dimension(size_x, size_t) :: matrizOnda
    real*8 :: Y0
    integer :: i
    do i = 2, size_x-1 
        matrizOnda(i,1) = Y0(i, dx, L/3.d0, L/30.d0)
    end do
    matrizOnda(1,:) = 0.d0
    matrizOnda(size_x,:) = 0.d0
end program geraOnda

function Y0(i, dx, x0, sigma)
    implicit none
    real*8, intent(in) :: dx, x0, sigma
    integer, intent(in) :: i
    real*8 :: x, Y0
    x = i*dx 
    Y0 = exp(-1*((x-x0)/sigma)**2)
end function Y0