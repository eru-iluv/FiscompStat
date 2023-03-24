
program tempoPorN
   implicit none
   real*8 :: t_inicio, t_fim, delta_t
   integer :: i, j, N = 50
   character*24, dimension(4) :: files
   files(1) = "tarefa-5-050-11820833.in"
   files(2) = "tarefa-5-100-11820833.in"
   files(3) = "tarefa-5-200-11820833.in"
   files(4) = "tarefa-5-400-11820833.in"

   open(2, file="../dados/tarefa-5-11820833.out")
   do i = 1, 4
      call cpu_time(t_inicio)
      do j = 1, 20
         call gerarEspacoFrequencias(files(i))
      end do
      call cpu_time(t_fim)
      delta_t = (t_fim - t_inicio)/20.d0
      write(2, *) N, delta_t, sqrt(delta_t) 
      N = N*2
   end do
end program tempoPorN

subroutine gerarEspacoFrequencias(fileName)
   implicit none
   real*8, dimension(400) :: y_t
   real*8 :: dt
   character*24 :: fileName
   integer :: N
   call leTabela(fileName, dt, y_t, N)
   call calculaFrequencias(y_t, N)

end subroutine gerarEspacoFrequencias

subroutine leTabela(fileName, dt, y_t, N)
   character*24, intent(in) :: fileName
   real*8, dimension(400), intent(out) :: y_t
   real*8, intent(out) :: dt
   integer, intent(out) :: N
   real*8 :: ignorada
   integer :: i

   open(1, file="../dados/"//fileName)

   do i = 1, 400
      read(1,*, end=1) ignorada, y_t(i)
      if ( i == 1 ) then
         dt = ignorada
      end if
   end do
  
1  close(1)

   N = i - 1
end subroutine leTabela

subroutine calculaFrequencias(y_t, N)
   real*8, dimension(400), intent(in) :: y_t
   integer :: k, N, M
   complex*16 :: Yk, currYk
   M = floor((N-1)/2.d0)

   do k = 1, M
      currYk = Yk(k, y_t, N)
   end do
end subroutine calculaFrequencias

function Yk(k, y_t, N)
   integer, intent(in) :: k
   integer, intent(in) :: N
   real*8, dimension(400):: y_t
   complex*16 :: Yk, i = (0,1)
   real*8, parameter :: pi = 3.1415926537989
   integer :: j
   Yk = (0,0)
   somatoria : do  j = 1, N
      Yk = Yk + y_t(j)*exp(2.d0*pi*i*j*k/N)
   end do somatoria

end function Yk
