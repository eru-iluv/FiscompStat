module rotinasDaOnda
    implicit none
    
    contains
    function Y0(i, size_x, dx, x0, sigma)
        real*8, intent(in) :: dx, x0, sigma
        integer, intent(in) :: i, size_x
        real*8 :: x, Y0
        ! Impõe as condições iniciais e
        ! de contorno
        if ( i /= 0 .and. i /= size_x  ) then
            x = i*dx 
            Y0 = exp(-1*((x-x0)/sigma)**2)        
        else 
            Y0 = 0.d0
        end if
    end function Y0
    

    subroutine preencheOndaPosterior(ondaAnterior, ondaAtual, ondaPosterior, r, size_x)
        real*8, intent(in) :: ondaAnterior(:), ondaAtual(:), r
        integer, intent(in) :: size_x
        real*8, intent(out) ::  ondaPosterior(:)
        ondaPosterior(2:size_x-1) = 2*(1-r**2)*ondaAtual(2:size_x-1) - ondaAnterior(2:size_x) &
            + (r**2)*(ondaAtual(3:size_x) + ondaAtual(1:size_x-2))
    end subroutine preencheOndaPosterior


    subroutine dancaDaCadeira(ondaAnterior, ondaAtual,  ondaPosterior)
        real*8, intent(inout) :: ondaAnterior(:), ondaAtual(:)
        real*8, intent(out) :: ondaPosterior(:)
        
        ondaAnterior(:) = ondaAtual(:)
        ondaAtual(:) = ondaPosterior(:)
    end subroutine dancaDaCadeira


    subroutine imprimeOnda(ondaAtual, size_x)
        real*8, intent(in) :: ondaAtual(:)
        integer :: size_x, i
        write(1, '(3000F15.8)') (ondaAtual(i), i=1,size_x)
    end subroutine imprimeOnda
end module rotinasDaOnda


program geraOnda
    use rotinasDaOnda
    implicit none
    real*8, parameter :: L = 1.d0, c = 300.d0
    real*8, parameter :: r = 1.d0, dt = 1.d0/90000.d0, dx = dt*c/r
    integer, parameter :: size_x = nint(L/dx), size_t = 310
    real*8, dimension(size_x) :: ondaAnterior, ondaAtual, ondaPosterior
        
    integer :: i
    open(1, file="saida-1")

    do i = 1, size_x 
        ondaAnterior(i) = Y0(i, size_x, dx, L/3.d0, L/30.d0)
    end do
    do i = 1, size_x
        ondaAtual(i) = Y0(i, size_x, dx, L/3.d0, L/30.d0) 
    end do
    ondaPosterior = 0.d0
    
    call imprimeOnda(ondaAnterior, size_x)
    do i = 2, size_t
        call imprimeOnda(ondaAtual, size_x)            
        call preencheOndaPosterior(ondaAnterior, ondaAtual, ondaPosterior, r, size_x)
        call dancaDaCadeira(ondaAnterior, ondaAtual, ondaPosterior)
        
    end do
    close(1)
    call imprimeOnda(ondaAtual, size_x)

end program geraOnda

