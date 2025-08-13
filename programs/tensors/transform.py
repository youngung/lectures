"""
transform_vector using Python script with numpy package.
"""
import numpy as np
velocity_old=np.zeros(3)
velocity_new=np.zeros(3)
r=np.zeros((3,3))
velocity_old[0]=30.

th=raw_input('Type angle [in degree]: ')
th=np.pi*float(th)/180.

r[0,0]=np.cos(th)
r[0,1]=np.sin(th)
r[1,0]=-np.sin(th)
r[1,1]=np.cos(th)
r[2,2]=1.

for i in xrange(3):
    for j in xrange(3):
        velocity_new[i]=velocity_new[i]+r[i,j]*velocity_old[j]

print 'old velocity'
print velocity_old
print 'new velocity'
print velocity_new
