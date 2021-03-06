private double fractionLength = .8; 
private int smallestBranch = 11; 
private double branchAngle = .6;  
public void setup() 
{   
	size(800,600);    
	//noLoop(); 
} 
public void draw() 
{   
	background(0); ;
	strokeWeight(3);  
	stroke(255,182,193);   
	line(400,600,400,490);   
	drawBranches(400,490,120,3*(Math.PI/2));
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	//your code here 
	double angle1 = angle - branchAngle;
	double angle2 = angle + branchAngle;
	branchLength = branchLength * fractionLength;
	int endX1 = (int)(branchLength*(Math.cos(angle1)) + x);
	int endY1 = (int)(branchLength*(Math.sin(angle1)) + y);
	int endX2 = (int)(branchLength*(Math.cos(angle2)) + x);
	int endY2 = (int)(branchLength*(Math.sin(angle2)) + y);	
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	if(branchLength>smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength,angle1);
		drawBranches(endX2,endY2,branchLength,angle2);
	}
} 
public void keyTyped()
{
	if(key == 'w')
	{
		branchAngle = branchAngle -0.02;
		redraw();
	}
}
