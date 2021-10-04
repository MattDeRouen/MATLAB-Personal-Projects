package main;

public class Torque_Calculator {
	
//DOUBLE CHECK ALL INPUTS FOR NEGATIVES AND CORRECT AXIS PLACEMENTS BEFORE RUNNING
	
	public static void main(String[] args) {
		
	double rx= 0 ;
	double ry= 0 ;
	double rz= .32 ;
	//input components of radius
	
	double fx= -1.57;
	double fy= 1.202 ;
	double fz= .902 ;
	//input components of force vector
	
	double Mx= ry*fz-rz*fy;
	double My= rz*fx-rx*fz;
	double Mz= rx*fy-ry*fx;
	//determines components of the torque
	
	double ur= 0 ;
	double ax= 0 ;
	double ay= 0 ;
	double az= 0 ;
	// input components of rotation axis and radius 
	
	double ux= ax/ur ;
	double uy= ay/ur ;
	double uz= az/ur ;
	//determines vector of rotational axis 
	
	double Tx=ux*Mx;
	double Ty=uy*My;
	double Tz=uz*Mz;
	// determines magnitudes of torque about axis
	
	double Tt=Tx+Ty+Tz ;
	
	System.out.println(Mx);
	System.out.println(My);
	System.out.println(Mz);
	//outputs components of torque
	
	System.out.println(Tx);
	System.out.println(Ty);
	System.out.println(Tz);
	//outputs components of torque about axis
	
	System.out.println(Tt);
	//outputs magnitude of torque about axis
	
	
	
	
	}

}

