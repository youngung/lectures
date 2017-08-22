c     This subroutine has been downloaded from the link below:
c     http://pajarito.materials.cmu.edu/rollett/texture_subroutines/euler.f
c
c  -------------------
c
      subroutine euler(a,iopt,nomen,d1,d2,d3,ior,kerr)
      implicit none
c                          Last revision 20nov90 UFK
c                          Revision by YJ for his lectures at CWNU
c      common a(3,3),grvol(1152),epsga(5),ist1,ist2,sqr3,sqrh,ident(3,3)
c  SPECIAL VERSION WITHOUT COMMON BLOCK
      integer iopt,ior,kerr,kor
      real*8 dps,rad
      real*8 a(3,3),d1,d2,d3,th,sth,cth,sph,cph,sps,cps,ps,ph,dth,dph,dps
      character nomen
      save kor
      rad=57.29578
c
c *** this subroutine calculates the euler angles associated with the
c     transformation matrix a(i,j) if iopt=1 and viceversa if iopt=2
c ***  Note that a is sample (rows) in terms of crystal (columns);
c      -- opposite of standard g (e.g.Bunge) - this is Canova's
c ***  Note that in this version, the Euler angles are defined symmetrically:
c      so that interchanging phi and psi means transposing a.
c      ("Kocks" nomen: defined going from +X to +Y in both COD and SOD)
c ***  However, other angle conventions are translated, according to
c  nomen="K" - Kocks (as internally) -- also sometimes "N"...
c        "R" - Roe          (Psi=psi, Phi=180-phi)
c        "B" - Bunge        (phi1=90+psi, Phi=Theta, phi2=90-phi)
c        any other - Canova (Theta first, phiC=90+phi, omega=90-psi)
c ***   Note: only in symm. notation does a point with all Euler angles
c             between 0 and 90 deg appear in the +x,+y quadrant!
c       If you want to see an individual point in this quadrant and are:
c       using Roe,    the third angle must be between 90 and 180;
c             Bunge,      first                                 ;
c             Canova,     second                                .
c ***  Input and output Euler angles d1,d2,d3 in degrees
c
      goto(5,20),iopt
    5 if(abs(a(3,3)) .ge. 0.999) goto 10
      th=acos(a(3,3))
      sth=sin(th)
      ps=atan2(a(2,3)/sth,a(1,3)/sth)
      ph=atan2(a(3,2)/sth,a(3,1)/sth)
ccccc   if it bombs out here, both a-components in one arg. are zero
c       (this should not be possible, but has happened, probably fixed)
      go to 15
c
   10 ps=0.5*atan2(a(1,2),-a(1,1))
      ph=-ps
c       The above still have the problem that they give too many
c       equivalents of the same grain in DIOROUT and density file. Therefore:
      if(kerr.eq.1.and.kor.ne.ior) then
      print*,'NOTE: grain',ior,' has Theta < 1 deg.: sometimes problems'
        print*
        kor=ior
      endif
c
   15 dth=th*rad
      dph=ph*rad
      dps=ps*rad
      d1=dps
      d2=dth
      if(nomen.eq.'K'.or.nomen.eq.'N') then
        d3=dph
      elseif(nomen.eq.'R') then
        d3=180.-dph
      elseif(nomen.eq.'B') then
        d1=dps+90.
        d3=90.-dph
      else
        d1=dth
        d2=dph+90.
        d3=90.-dps
      endif
      if(d1.ge.360.) d1=d1-360.
      if(d3.ge.360.) d3=d3-360.
      if(d1.lt.0.) d1=d1+360.
      if(d3.lt.0.) d3=d3+360.
      return
c  *************************************
   20 dth=d2
      dps=d1
      if(nomen.eq.'K') then
        dph=d3
      elseif(nomen.eq.'R') then
        dph=180.-d3
      elseif(nomen.eq.'B') then
        dps=d1-90.
        dph=90.-d3
      else
        dth=d1
        dph=d2-90.
        dps=90.-d3
      endif
      ph=dph/rad
      th=dth/rad
      ps=dps/rad
      sph=sin(ph)
      cph=cos(ph)
      sth=sin(th)
      cth=cos(th)
      sps=sin(ps)
      cps=cos(ps)
      a(1,1)=-sps*sph-cph*cps*cth
      a(2,1)=cps*sph-cph*sps*cth
      a(3,1)=cph*sth
      a(1,2)=sps*cph-sph*cps*cth
      a(2,2)=-cph*cps-sph*sps*cth
      a(3,2)=sth*sph
      a(1,3)=sth*cps
      a(2,3)=sps*sth
      a(3,3)=cth
      return
      end
c
c  &&&&&&&&&&&&&&
c
