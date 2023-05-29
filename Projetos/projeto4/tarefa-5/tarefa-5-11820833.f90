module RevolutionModule
    implicit none
    real(8), parameter :: pi =  acos(-1.d0)
    integer, parameter :: idx(0:8) = (/-1, -1, -1,  0, 0, 0,  1, 1, 1/),&
                          idy(0:8) = (/-1,  0,  1, -1, 0, 1, -1, 0, 1/)


    type :: vertice
        integer :: x
        integer :: y  
    contains
        procedure :: mudaVertice 
    end type

contains

    subroutine mudaVertice(this, dx, dy)
        class(vertice) :: this
        integer :: dx, dy
            this%x = this%x + dx
            this%y = this%y + dy      
    end subroutine mudaVertice


    subroutine andarDoBebado(x,  y)
        integer, intent(out) :: x, y
        real(8) ::  numAleatorio
        integer ::  idr
        
        call random_number(numAleatorio)
        idr = nint(8*numAleatorio)

        x = x + idx(idr)
        y = y + idy(idr)
    end subroutine andarDoBebado
    

    subroutine inciaTabuleiro(pontosIniciais,&
         tamanhoIniciais, tamanhoTabuleiro, p)
        type(vertice), intent(out) :: pontosIniciais(:)
        integer, intent(in) :: tamanhoTabuleiro
        real(8), intent(in) ::  p
        integer :: tamanhoIniciais, x, y, ponto, numPontos = 0
        
        percorre_tabuleiro: do x = -tamanhoTabuleiro/2, tamanhoTabuleiro/2 
            do y = -tamanhoTabuleiro/2, tamanhoTabuleiro/2
                ponto = bernoulli(p)

                if ( ponto == 1 ) then
                    numPontos = numPontos+1
                    call insereVertice(pontosIniciais,&
                        tamanhoIniciais, x, y)
                end if

            end do
        end do percorre_tabuleiro

    end subroutine inciaTabuleiro


    integer function raioQuad(x, y)
        integer, intent(in) :: x, y
        raioQuad = x**2 + y**2
    end function raioQuad

    
    integer function bernoulli(p)
        real(8) :: p, numAleatorio
        call random_number(numAleatorio)
            if ( numAleatorio < p ) then
                bernoulli = 1
            else 
                bernoulli = 0
        end if
    end function bernoulli


    subroutine insereVertice(pontos,  tamanhoPontos, x, y)
        type(vertice), intent(out) :: pontos(:)
        integer, intent(inout) ::  tamanhoPontos
        integer :: x, y

        tamanhoPontos = tamanhoPontos + 1        
        pontos(tamanhoPontos) = vertice(x,y)
    end subroutine insereVertice

    subroutine removeVertice(pontos, i, tamanhoTabuleiro)
        type(vertice), intent(in) :: pontos(:)
        integer, intent(in) ::  i, tamanhoTabuleiro
        
        ! Joga os pontos pra bem longe para não ter risco de interferência
        ! no resto do jogo
        call pontos(i)%mudaVertice(-10*tamanhoTabuleiro,-10*tamanhoTabuleiro)
    end subroutine removeVertice

    subroutine moveRevolucao(pontosRevolucao, &
                    tamanhoRevolucao)
        type(vertice), intent(in) :: pontosRevolucao(:)
        integer, intent(out) :: tamanhoRevolucao
        integer :: dx, dy, i

        dx = 0; dy = 0
        call andarDoBebado(dx, dy)
        do i = 1, tamanhoRevolucao
            call pontosRevolucao(i)%mudaVertice(dx,dy)
        end do
        
    end subroutine moveRevolucao
    
    
    subroutine aglutinaCamaradas(pontosRevolucao, pontosIniciais,&
         tamanhoRevolucao, tamanhoIniciais, tamanhoTabuleiro, rQuad)
        
        type(vertice) :: pontosRevolucao(:), pontosIniciais(:)
        integer :: tamanhoIniciais, tamanhoTabuleiro, tamanhoRevolucao
        integer :: i, j, x_i, y_i, x_r, y_r, x_trotsky, y_trotsky, tamanhoRevolucaoAtual 
        logical :: vizinho 
        real(8) :: rQuad, rQuad_i 

        tamanhoRevolucaoAtual = tamanhoRevolucao
        ! Ponto inicial do cluster
        x_trotsky = pontosRevolucao(1)%x
        y_trotsky = pontosRevolucao(1)%y


        do i = 1, tamanhoIniciais
            x_i = pontosIniciais(i)%x
            y_i = pontosIniciais(i)%y
            if ( x_i > -5*tamanhoTabuleiro ) then
            do j = 1, tamanhoRevolucaoAtual

                x_r = pontosRevolucao(j)%x
                y_r = pontosRevolucao(j)%y
                ! Checa se o ponto é vizinho de um revolucionario
                vizinho = &
                    (x_i == x_r .and. (y_i == y_r+1 .or. y_i == y_r-1)) &
                    .or. (y_i == y_r .and. (x_i == x_r+1 .or. x_i == x_r-1))

                if ( vizinho ) then
                    call insereVertice(pontosRevolucao, tamanhoRevolucao, x_i, y_i)
                    
                    rQuad_i = raioQuad(x_trotsky-x_i, y_trotsky-y_i)
                    
                    if (rQuad < rQuad_i ) then
                        rQuad = rQuad_i
                    end if
                    write(1,*) tamanhoRevolucao, sqrt(rQuad)

                    call removeVertice(pontosIniciais, i, tamanhoTabuleiro)
                    exit
                end if

            end do
            end if
        end do
        
    end subroutine aglutinaCamaradas

end module RevolutionModule

program trotskyExe
    use RevolutionModule
    real(8), parameter :: p = 0.4d0
    
    integer, parameter :: tamanhoTabuleiro = 300, &
                          tamanhoListas = 1.5*tamanhoTabuleiro**2*p
    type(vertice) :: pontosIniciais(tamanhoListas),&
                     pontosRevolucao(tamanhoListas)
    
    integer :: tamanhoIniciais = 0, tamanhoRevolucao = 0, i = 0
    real(8) :: rQuad = 0.d0
    ! Cria sociedade capitalista fadada ao fracasso
    call inciaTabuleiro(pontosIniciais, tamanhoIniciais, &
                         tamanhoTabuleiro, p)
    

    ! Um espectro ronda o tabuleiro, o espectro do comunismo
    call insereVertice(pontosRevolucao, tamanhoRevolucao, 0, 0)
    open(1, file="saida-5-11820833")


    do while (i < 50000 .and. rQuad < 0.7*(tamanhoTabuleiro/2)**2) 
        i = i + 1
        call moveRevolucao(pontosRevolucao, tamanhoRevolucao)
         call aglutinaCamaradas(pontosRevolucao, pontosIniciais,&
                 tamanhoRevolucao, tamanhoIniciais, tamanhoTabuleiro, rQuad)
    end do    
    close(1)
    
end program trotskyExe