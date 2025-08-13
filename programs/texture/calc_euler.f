      program calc_euler
      implicit none
      dimension a(3,3)
      real*8 a,d1,d2,d3
      integer iopt,ior,kerr,i,j
      character nomen

      nomen='B'


c------------------------------------------------------------------------c
c$$$      a(:,:)=0d0
c$$$      do i=1,3
c$$$         a(i,i)=1d0
c$$$      enddo
c$$$      call euler(a,1,nomen,d1,d2,d3,ior,kerr)
c$$$      write(*,*)'d1,d2,d3'
c$$$      write(*,*)d1,d2,d3
c------------------------------------------------------------------------c
      write(*,*)'Type d1, d2, d3 for subroutine euler'
      read(*,*) d1,d2,d3
      call euler(a,2,nomen,d1,d2,d3,ior,kerr)
      do i=1,3
         write(*,'(3f7.3)') (a(i,j),j=1,3)
      enddo


      end program calc_euler
