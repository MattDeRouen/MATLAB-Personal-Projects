package main;
import java.lang.Math;
public class vectorizer9000 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		double magnitude= 500  ;
		double alfa= 45 ;
		double beta= 45 ;
		double gamma= 120 ;
		// input magnitude of force and projection angles 
		
		double Fx= magnitude*Math.cos(Math.toRadians(alfa));
		double Fy= magnitude*Math.cos(Math.toRadians(beta));
		double Fz= magnitude*Math.cos(Math.toRadians(gamma));
		
		System.out.println(Fx);
		System.out.println(Fy);
		System.out.println(Fz);
	}
}
