module AcdModules
    implicit none
    
    public :: bernoulli, vetorBinario, &
        propagaRegra, dancaDaCadeira, imprimeConfig 
    contains

    ! Função de bernoulli
    ! Para p = 0.5, se torna um gerador
    ! de 0 ou 1 com probabilidade identica
    integer function bernoulli(p)
        real(8) :: p, numAleatorio
        call random_number(numAleatorio)
        if ( numAleatorio < p ) then
            bernoulli = 1
        else 
            bernoulli = 0
        end if
    end function bernoulli
    
    ! Converte o valor decimal em um vetor binário
    subroutine vetorBinario(vetorRegra, regra)
        integer, intent(out) ::  vetorRegra(0:7)
        integer :: regra, index, N

        N = regra
        
        do index = 0, 7
            vetorRegra(index) = mod(N,2)
            N = N/2
        end do
        
    end subroutine vetorBinario

    
    subroutine &
        propagaRegra(configAtual, configSeguinte, vetorRegra, L)        
        integer, intent(in) :: configAtual(:), &
            vetorRegra(0:7), L
        integer, intent(out) ::  configSeguinte(:)
        
        ! Se a maioria dos vizinhos
        configSeguinte(2:L-1) = & 
            vetorRegra((configAtual(1:L-2)*2**2 &
            + configAtual(2:L-1)*2 + configAtual(3:L)))
        

        ! Ajusta as bordas
        configSeguinte(1) = &
            vetorRegra(configAtual(L)*2**2 &  
            + configAtual(1)*2 + configAtual(2))

        configSeguinte(L) = &
            vetorRegra(configAtual(L-1)*2**2 &
            +  configAtual(L-2)*2 + configAtual(1))
    end subroutine propagaRegra


    subroutine dancaDaCadeira(configAtual, configSeguinte)
        integer, intent(inout) :: configAtual(:), configSeguinte(:)
        configatual(:) = configSeguinte(:)
    end subroutine dancaDaCadeira


    subroutine imprimeConfig(configAtual, file, L)
        integer, intent(in) :: configAtual(:)
        integer :: L, file
        integer :: i
        character :: ascii(0:1)
        
        ascii(0) = "."
        ascii(1) = '$'
        write(file, *) (ascii(configAtual(i)), i=1, L)
    end subroutine imprimeConfig

    subroutine setConfig(configAtual, config,  L)
        integer, intent(in) :: config, L
        integer, intent(out) :: configAtual(:)
        integer :: i

        if ( config == 0 ) then
            configAtual = 0
        else if ( config == 1 ) then
            configAtual = 1
        else if ( config == -1 ) then
            do i = 1, L
                configAtual(i) = bernoulli(0.5d0)           
            end do 
        end if    
        
    end subroutine setConfig

    subroutine acdRegra(regra, config)
        integer, intent(in) :: regra, config
        integer, parameter :: L = 200
        integer :: vetorRegra(0:7), configAtual(L), configSeguinte(L)
        integer :: i
        character(len=26) :: filename
        

        write (filename, "(A16, I3, A5, I2)") "../saidas/saida_", regra, "_con_", config
        

        call vetorBinario(vetorRegra, regra)
        
        open(1, file = trim(filename))
        
        call setConfig(configAtual, config, L)

        do i = 0, 100
            call imprimeConfig(configAtual, 1, L)
            call propagaRegra(configAtual, configSeguinte, vetorRegra, L)
            call dancaDaCadeira(configAtual, configSeguinte)
        end do
        call imprimeConfig(configAtual, 1, L)
        close(1)
    
        
    end subroutine acdRegra

end module

program ACD
    use AcdModules

    ! Regra do Contra
    call acdRegra(51, 0)        
    call acdRegra(51, 1)        
    call acdRegra(51,-1)        
 
    ! Regra da Maioria
    call acdRegra(232, 0)        
    call acdRegra(232, 1)        
    call acdRegra(232,-1)        

    ! Regra da Infecção
    call acdRegra(254, 0)        
    call acdRegra(254, 1)        
    call acdRegra(254,-1)        
end program ACD
