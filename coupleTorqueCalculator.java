package main;

public class coupleTorqueCalculator {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
double rx= 3 ;
double ry= 2 ;
double rz= -2 ;
// components of the distance between tail of the two forces

double fx= -4 ;
double fy= 3 ;
double fz= -4 ;
// components of only positive force in couple

double Mx= ry*fz-rz*fy;
double My= rz*fx-rx*fz;
double Mz= rx*fy-ry*fx;
// calculating moments of torque about x,y,z axis

double T= Mx+My+Mz;
// total torque

System.out.println(Mx);
System.out.println(My);
System.out.println(Mz);
System.out.println(T);
	}

}
