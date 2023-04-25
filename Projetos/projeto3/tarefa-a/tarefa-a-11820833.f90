program tarefa_a
    use fourierMod
    use ondasMod
    implicit none

    real(8), parameter :: L = 1.d0, c = 300.d0
    real(8), parameter :: r = 1.d0, dx = 1.0/200.d0, dt = dx*r/c
    integer, parameter :: size_x = L/dx + 1, size_t = 1/(3*dt)
    real(8), dimension(size_x) :: ondaAnterior, ondaAtual, ondaPosterior
    real(8), dimension(size_t) :: pontoGravado ! y(L/4 ,t)
    integer :: i
    ondaAtual = 0.d0
    do i = 2, size_x-1
        ondaAtual(i) = Gaussiana(i-1, dx, L/2.d0, L/30.d0)
    end do
    
    ondaPosterior = 0.d0
    ondaAnterior(:) = ondaAtual(:) ! Fazemos ponto inicial
    pontoGravado(1) = ondaAnterior((size_x-1)/4+1) ! Iniciamos gravação de L/4


    do i = 2, size_t
        pontoGravado(i) = ondaAtual((size_x-1)/4+1)
        call propagaPresoPreso(ondaAnterior, ondaAtual, ondaPosterior, r, size_x)
        call dancaDaCadeira(ondaAnterior, ondaAtual, ondaPosterior)
    end do

    open(1, file="saida")
    call escreveFrequencias(pontoGravado, dt, size_t, 1)
    close(1)
end program tarefa_a
