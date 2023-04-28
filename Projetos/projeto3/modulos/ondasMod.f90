program main
module ondasMod
    implicit none
    public :: Gaussiana, dancaDaCadeira, propagaPresoPreso,&
      propagaPresoLivre imprimeOnda

    contains
    function Gaussiana(i, dx, x0, sigma)
        real*8, intent(in) :: dx, x0, sigma
        integer, intent(in) :: i
        real*8 :: x, Gaussiana
            x = i*dx
            Gaussiana = exp(-1*((x-x0)/sigma)**2)
    end function Gaussiana


    subroutine propagaPresoPreso(ondaAnterior, ondaAtual, ondaPosterior, r, size_x)
        real*8, intent(in) :: ondaAnterior(:), ondaAtual(:), r
        integer, intent(in) :: size_x
        real*8, intent(out) ::  ondaPosterior(:)

        ! y_n+1(i) = 2(1-r^2)*y_n(i) - y_n-1(i) + r^2*y_n(i+1) + y_n(i-1)
        ondaPosterior(2:size_x-1) =&
            2*(1-r**2)*ondaAtual(2:size_x-1) - ondaAnterior(2:size_x-1) &
            + (r**2)*(ondaAtual(3:size_x) + ondaAtual(1:size_x-2))
    end subroutine propagaPresoPreso


    subroutine propagaPresoLivre(ondaAnterior, ondaAtual, ondaPosterior, r, size_x)
        real*8, intent(in) :: ondaAnterior(:), ondaAtual(:), r
        integer, intent(in) :: size_x
        real*8, intent(out) ::  ondaPosterior(:)
        ondaPosterior(2:size_x-1) =&
            2*(1-r**2)*ondaAtual(2:size_x-1) - ondaAnterior(2:size_x-1) &
            + (r**2)*(ondaAtual(3:size_x) + ondaAtual(1:size_x-2))

        ! Derivada na ponta livre é nula
        ondaPosterior(size_x) =  ondaPosterior(size_x-1)
    end subroutine propagaPresoLivre


    subroutine dancaDaCadeira(ondaAnterior, ondaAtual,  ondaPosterior)
        real*8, intent(inout) :: ondaAnterior(:), ondaAtual(:)
        real*8, intent(out) :: ondaPosterior(:)

        ondaAnterior(:) = ondaAtual(:)
        ondaAtual(:) = ondaPosterior(:)
    end subroutine dancaDaCadeira


    subroutine imprimeOnda(ondaAtual, file, size_x)
        real*8, intent(in) :: ondaAtual(:)
        integer :: size_x, file
        integer :: i
        write(file, '(3000F16.8)') (ondaAtual(i), i=1,size_x)
    end subroutine imprimeOnda
end module ondasMod

end program main
