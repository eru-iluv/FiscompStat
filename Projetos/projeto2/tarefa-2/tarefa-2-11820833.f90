program geraOnda
    use rotinasDaOnda
    implicit none
    real*8, parameter :: L = 1.d0, c = 300.d0
    real*8, parameter :: r = 2.d0, dt = 1.d0/90000.d0, dx = dt*c/r
    integer, parameter :: size_x = nint(L/dx), size_t = 6
    real*8, dimension(size_x) :: ondaAnterior, ondaAtual, ondaPosterior

    integer :: i
    open(1, file="saida-2")

    ! Enforça condição para t = 0
    do i = 1, size_x
        ondaAtual(i) = Y0(i, size_x, dx)
    end do
    ondaAnterior(:) = ondaAtual(:)

    ! Perceba que aqui efetivamente impomos as condições de contorno
    ondaPosterior = 0.d0

    call imprimeOnda(ondaAnterior, size_x)

    do i = 2, size_t
        call imprimeOnda(ondaAtual, size_x)
        call propagaOnda(ondaAnterior, ondaAtual, ondaPosterior, r, size_x)
        call dancaDaCadeira(ondaAnterior, ondaAtual, ondaPosterior)
    end do
    call imprimeOnda(ondaAtual, size_x)
    
    close(1)
end program geraOnda


module rotinasDaOnda
    implicit none

    contains
    function Y0(i, size_x, dx)
        real*8, intent(in) :: dx
        integer, intent(in) :: i, size_x
        real*8 :: x, Y0, L

        x = (i-1)*dx
        L = (size_x - 1)* dx
        if (i .le. size_x/4 + 1) then
            Y0 = x
        else
           Y0 = 1.d0/3.d0 *  (L - x)
        endif
    end function Y0


    subroutine propagaOnda(ondaAnterior, ondaAtual, ondaPosterior, r, size_x)
        real*8, intent(in) :: ondaAnterior(:), ondaAtual(:), r
        integer, intent(in) :: size_x
        real*8, intent(out) ::  ondaPosterior(:)
        ondaPosterior(2:size_x-1) =&
            2*(1-r**2)*ondaAtual(2:size_x-1) - ondaAnterior(2:size_x-1) &
            + (r**2)*(ondaAtual(3:size_x) + ondaAtual(1:size_x-2))
    end subroutine propagaOnda


    subroutine dancaDaCadeira(ondaAnterior, ondaAtual,  ondaPosterior)
        real*8, intent(inout) :: ondaAnterior(:), ondaAtual(:)
        real*8, intent(out) :: ondaPosterior(:)

        ondaAnterior(:) = ondaAtual(:)
        ondaAtual(:) = ondaPosterior(:)
    end subroutine dancaDaCadeira


    subroutine imprimeOnda(ondaAtual, size_x)
        real*8, intent(in) :: ondaAtual(:)
        integer :: size_x, i
        write(1, '(3000F16.8)') (ondaAtual(i), i=1,size_x)
    end subroutine imprimeOnda
end module rotinasDaOnda
