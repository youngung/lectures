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
