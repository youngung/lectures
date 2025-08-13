c     need stress.inp file
c     10. 33. -3.
c     33. -5.  9.
c     -3.  9.  7

      program ev
      implicit none
      integer lwmax
      parameter(lwmax=1000)
      dimension A(3,3),W(3),work(lwmax),stress(3,3),s_new(3,3),rot(3,3),
     $     rotinv(3,3),aux33(3,3),rotaux(3,3),icols(6,2)
      real*8 A, W, WORK, STRESS,s_new,rot,phi1,phi,phi2,rotinv,aux33,
     $     dum,err,tol,rotaux,det
      parameter(tol=1e-5)
      integer i,j,k,l,lwork,info, ior,kerr,iopt,ipiv,iter,
     $     ix,jx,icols
      logical ibr
      data icols /
     $     1,2,1,2,1,2,
     $     1,3,3,3,3,3/

c---------------------------------------------------------------------
c     upper triangle matrix
      open(1,file='stress.inp',status='unknown')
      open(2,file='result.txt',status='unknown')
      do i=1,3
         read(1,*) stress(i,:)
      enddo
      close(1)
c---------------------------------------------------------------------

      A(:,:)=0d0
      A(:,:)=stress(:,:)*1d0

      do 10 i=1,3
      do 10 j=1,3
         stress(j,i)=stress(i,j)
 10   continue

c     --------
      lwork=-1
      call dsyev('V','U',3,A,3,W,work,lwork,info)
      lwork=min(lwmax,int(work(1)))
      call dsyev('V','U',3,A,3,W,work,lwork,info)
c     --------

      IF( INFO.GT.0 ) THEN
         WRITE(*,*)'The algorithm failed to compute eigenvalues.'
         STOP -1
      END IF

      write(2,'(a)')'** Principal stress values'
      write(2,'(3e11.3)')(w(i),i=1,3)

      do 15 i=1,3
      do 15 j=1,3
         rot(i,j) = a(j,i)
 15   continue
      call keep_right_handedness(rot)
      rotaux(:,:)=rot(:,:)
      iter = 1
      err=1.

c     ----------------------------
!     check if transformation matrix rotate the stress tensor correctly.

      do 20 i=1,3
      do 20 j=1,3
         s_new(i,j)=0d0
      do 20 k=1,3
      do 20 l=1,3
         s_new(i,j)=s_new(i,j)+       rot(i,k)*stress(k,l)*rot(j,l)
 20   continue

      write(2,'(a)')'** Stress tensor referred to principal space'
      do i=1,3
         write(2,'(3e11.3)')(s_new(i,j),j=1,3)
      enddo

      iopt=1
      call euler(iopt, phi1,phi,phi2,rot)

      write(2,'(a)')'** Euler angles that transform the old axes
     $to principal space'
      write(2,'(3a9)')'phi1','phi','phi2'
      write(2,'(3(f7.2,2x))')phi1,phi,phi2
      close(2)

      write(*,'(a)')'** Completed - check result.txt'
      end program ev
c----------------------------------------------------------------------
      subroutine keep_right_handedness(a)
c     If the determinant>0, the vectors form right-handedness.
      dimension a(3,3)
      real*8 a,det

      if (dabs(det(a)-1d0).lt.1e-8) return
      a(1,:)=-a(1,:)
      if (dabs(det(a)-1d0).lt.1e-8) return
      a(2,:)=-a(2,:)
      if (dabs(det(a)-1d0).lt.1e-8) return
      a(3,:)=-a(3,:)
      if (dabs(det(a)-1d0).lt.1e-8) return

      write(*,*)'could not achieve right-handedness'
      stop -1

      return
      end subroutine keep_right_handedness
c----------------------------------------------------------------------
      subroutine euler (iopt,ph,th,tm,a)
c
c     CALCULATE THE EULER ANGLES ASSOCIATED WITH THE TRANSFORMATION
c     MATRIX A(I,J) IF IOPT=1 AND VICEVERSA IF IOPT=2
c     A(i,j) TRANSFORMS FROM SYSTEM sa TO SYSTEM ca.
c     ph,th,om ARE THE EULER ANGLES (in degrees) OF ca REFERRED TO sa.
c *****************************************************************************

c     tm:3 (phi2)
c     th:2 (phi)
c     ph:1 (phi1)

      dimension a(3,3)
      real*8 a,ph,th,tm
      integer iopt

      pi=4.*atan(1.d0)

      if(iopt.eq.1) then
         th=acos(a(3,3))
         if(abs(a(3,3)).ge.0.9999) then
            tm=0.
            ph=atan2(a(1,2),a(1,1))
         else
            sth=sin(th)
            tm=atan2(a(1,3)/sth,a(2,3)/sth)
            ph=atan2(a(3,1)/sth,-a(3,2)/sth)
         endif
         th=th*180./pi
         ph=ph*180./pi
         tm=tm*180./pi
      else if(iopt.eq.2) then
         sph=sin(ph*pi/180.)
         cph=cos(ph*pi/180.)
         sth=sin(th*pi/180.)
         cth=cos(th*pi/180.)
         stm=sin(tm*pi/180.)
         ctm=cos(tm*pi/180.)
         a(1,1)=ctm*cph-sph*stm*cth !!  c3*c1 - s1*s3*c2
         a(2,1)=-stm*cph-sph*ctm*cth !! -s3*c1 - s1*c3*c2
         a(3,1)=sph*sth         !!  s1*s2
         a(1,2)=ctm*sph+cph*stm*cth !!  c3*s1 + c1*s3*c2
         a(2,2)=-sph*stm+cph*ctm*cth !! -s1*s3 + c1*c3*c2
         a(3,2)=-sth*cph        !! -s2*c1
         a(1,3)=sth*stm         !!  s2*s3
         a(2,3)=ctm*sth         !!  c3*s2
         a(3,3)=cth             !!  c2
      endif

      return
      end subroutine euler

c----------------------------------------------------------------------
      real*8 function det(a)
      dimension a(3,3)
      real*8 a

      det=a(1,1)*a(2,2)*a(3,3)
     $     +a(1,2)*a(2,3)*a(3,1)
     $     +a(1,3)*a(2,1)*a(3,2)
     $     -a(1,3)*a(2,2)*a(3,1)
     $     -a(2,3)*a(3,2)*a(1,1)
     $     -a(1,2)*a(2,1)*a(3,3)
      return
      end function det
