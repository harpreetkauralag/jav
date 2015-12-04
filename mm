import java.awt.*;
import java.applet.*;
import java.awt.event.*;
import javax.swing.*;
/*<applet code="Ma2.class" width=200 height=200>
</applet>*/
class Cal2 extends JFrame implements ActionListener
{double l1=1.0,l2=1.0,l3=0.0;
int n=0;
JPanel p1,p2,p3,p4;
JMenuBar mb;
long nu;
String s1="",s2="",s3="",s4="";
JMenu file;
JMenu view;
JMenuItem exit,general,sci;
JButton b1[][]=new JButton[4][6];
JTextField t;
Cal2(String tittle)
{
super(tittle);
mb=new JMenuBar();


setJMenuBar(mb);
file=new JMenu("File");
exit=new JMenuItem("Exit");
file.add(exit);
mb.add(file);
view=new JMenu("View");
general=new JMenuItem("General");
sci=new JMenuItem("Scientific");
view.add(general);
view.add(sci);
mb.add(view);
exit.addActionListener(this);
sci.addActionListener(this);
general.addActionListener(this);


p1=new JPanel();
p2=new JPanel();
p3=new JPanel();
p4=new JPanel();
p4.setLayout(new BorderLayout());
t=new JTextField(25);

p1.add(t);

p2.setLayout(new GridLayout(4,6));
p3.setLayout(new GridLayout(4,6));


int  i,j,k=1;
for(i=0;i<=2;i++)
for(j=0;j<=2;j++){
b1[i][j]=new JButton(String.valueOf(k));
k++;
}
b1[0][3]=new JButton("/");
b1[0][4]=new JButton("AC");
b1[0][5]=new JButton("%");
b1[1][3]=new JButton("*");
b1[1][4]=new JButton("DEL");
b1[1][5]=new JButton("Sqr");
b1[2][3]=new JButton("-");
b1[2][4]=new JButton("Squa");
b1[2][5]=new JButton("-/+");
b1[3][0]=new JButton(".");
b1[3][1]=new JButton("0");
b1[3][2]=new JButton("=");
b1[3][3]=new JButton("+");
b1[3][4]=new JButton("Replay");
b1[3][5]=new JButton("sci");
for(i=0;i<4;i++)
for(j=0;j<6;j++)
p2.add(b1[i][j]);
p4.add(p1,BorderLayout.NORTH);
p4.add(p2,BorderLayout.CENTER);
getContentPane().add(p4);
for(i=0;i<4;i++)
for(j=0;j<6;j++)
b1[i][j].addActionListener(this);
MyWin2 m=new MyWin2(this);
addWindowListener(m);
getContentPane().setLayout(new FlowLayout());
this.pack();
}
public void actionPerformed(ActionEvent e) 
{int i;
String  st=e.getActionCommand();int k;
if(st.equals("Exit"))
this.setVisible(false);
if(st.equals("sci")||st.equals("Scientific")){
MM2 m=new MM2("calculater");
m.setVisible(true);m.setSize(450,340);
this.setVisible(false);
}
	
	for(k=0;k<=9;k++)
	if(st.equals(String.valueOf(k))){
	s1+=String.valueOf(k);
	t.setText(s1);
	}
	try{
	for(k=0;k<=9;k++)
	if(!s1.equals("")&&!st.equals(String.valueOf(k))&&!(st.equals("-/+")))if(n==0)l1=Double.parseDouble(t.getText());
	}catch(NumberFormatException e2){t.setText("Error");s1="0";}
try{ 
	if(!s1.equals("")){
	if(st.equals("+")){
	s2="+";
	s1="";
	n++;if(n==1)
	s3=s2;}
	 if(st.equals("-")){
	s2="-";
	s1="";
	n++;if(n==1)
	s3=s2;}
	 if(st.equals("*")){
	s2="*";
	s1="";
	n++;if(n==1)
	s3=s2;      }
	 if(st.equals("/")){
	s2="/";
	s1="";
	n++;if(n==1)
	s3=s2;}
	 if(st.equals("%")){
	s2="%";
	s1="";
	n++;if(n==1)
	s3=s2;}
	if(st.equals(".")){s1+=".";t.setText(s1);}
	
	if(st.equals("DEL")){s1=t.getText();int s0=s1.length()-1;
	s1=s1.substring(0,s0);t.setText(s1);}
	if(st.equals("Squa")){l1=Double.parseDouble(t.getText());l1=Math.pow(l1,2);t.setText(String.valueOf(l1));l3=l1;s1="";}
	
	if(st.equals("-/+")){s1+="-";t.setText(s1);}
	if(st.equals("Sqr")){l1=Double.parseDouble(t.getText());l1=Math.sqrt(l1);t.setText(String.valueOf(l1));l3=l1;s1="";}	
	if(st.equals("=")){
	s2="=";
	n=2;
	}}
	
	if(!(s2.equals("")))
	try{
	for(k=0;k<=9;k++)
	if((!st.equals(String.valueOf(k)))){
	l2=Double.parseDouble(t.getText());if(n==2){s4=s2;s2=s3;s3=s4;
	if(s2.equals("/"))
	l1=l1/l2;
	if(s2.equals("*"))
	l1=l1*l2;
	
	if(s2.equals("+"))
	l1=l1+l2;
	if(s2.equals("%")){
	l1=(long)(l1)%(long)(l2);
	}
	if(s2.equals("-"))
	l1=l1-l2;
	if(s2.equals("=")){
	if(l1%1==0){ nu=(long)(l1);
	t.setText(String.valueOf(nu));l3=nu;}
	else {t.setText(String.valueOf(l1));l3=l1;}n=0;}

	
	if(l1%1==0){ nu=(long)(l1);
	t.setText(String.valueOf(nu));l3=nu;}
	else {t.setText(String.valueOf(l1));l3=l1;}

	s1="";s2="";n=1;
l1=Double.parseDouble(t.getText());
	}}}catch(NumberFormatException e2){t.setText("Error");s1="0";}
	
	
	if(st.equals("Replay")){if(l3%1==0){ nu=(long)(l3);
	t.setText(String.valueOf(nu));}
	else t.setText(String.valueOf(l3));}
	
	
	
}

catch(Exception e1){t.setText("Syntex error");s1=""; t.setText(s1);}
if(st.equals("AC")){n=0;s1="";s2="";l1=0.0;t.setText("");l3=0;}}}
class MM2 extends Cal2 
{String s2="";
JButton b2[][]=new JButton[5][6];
MM2(String aa){
super(aa);
b2[0][0]=new JButton("OR");
b2[0][1]=new JButton("Cubing");
b2[0][2]=new JButton("Abs");
b2[0][3]=new JButton("asin");
b2[0][4]=new JButton("e(x)");
b2[0][5]=new JButton("npr");
b2[1][0]=new JButton("AND");
b2[1][1]=new JButton("x^y");
b2[1][2]=new JButton("Sin");
b2[1][3]=new JButton("acos");
b2[1][4]=new JButton("Int");
b2[1][5]=new JButton("ncr");
b2[2][0]=new JButton("Ceil");
b2[2][1]=new JButton("x!");
b2[2][2]=new JButton("Cos");
b2[2][3]=new JButton("atan");
b2[2][4]=new JButton("1/x");
b2[2][5]=new JButton("toRadi");
b2[3][0]=new JButton("Floor");
b2[3][1]=new JButton("Log");
b2[3][2]=new JButton("Tan");
b2[3][3]=new JButton("Mod");
b2[3][4]=new JButton("toDeg");
b2[3][5]=new JButton("^");

int i,j;
for(i=0;i<4;i++)
for(j=0;j<6;j++)
b2[i][j].addActionListener(this);
for(i=0;i<4;i++)
for(j=0;j<6;j++)
p3.add(b2[i][j]);
p4.add(p3,BorderLayout.SOUTH);
getContentPane().add(p4);
MyWin2 m=new MyWin2(this);
addWindowListener(m);
this.pack();
}
public void actionPerformed(ActionEvent e)
{
int k;
String  st=e.getActionCommand();
if(st.equals("Exit"))
this.setVisible(false);
if(st.equals("^")||st.equals("General"))
{
Cal2 cc=new Cal2("Calculator");
cc.setVisible(true);
cc.setSize(450,230);
this.setVisible(false);}
for(k=0;k<=9;k++)
	if(st.equals(String.valueOf(k))){
	s1+=String.valueOf(k);
	t.setText(s1);
	}
try{	
	
	for(k=0;k<=9;k++)
	if(!s1.equals("")&&!st.equals(String.valueOf(k)))if(n==0){l1=Double.parseDouble(t.getText());}}catch(NumberFormatException e2){t.setText("Error");s1="0";}
if(!s1.equals(""))
	try{ if(st.equals("+")){
	s2="+";
	s1="";n++;
	if(n==1)
	s3=s2;
	}
	 if(st.equals("-")){
	s2="-";
	s1="";n++;
	if(n==1)
	s3=s2;
	}
	 if(st.equals("*")){
	s2="*";
	s1="";
	n++;if(n==1)
	s3=s2;}
	 if(st.equals("/")){
	s2="/";
	s1="";
	n++;if(n==1)
	s3=s2;}
	 if(st.equals("%")){
	s2="%";
	s1="";
	n++;if(n==1)
	s3=s2;}
	
	if(st.equals("npr"))
	{l1=Double.parseDouble(t.getText());
	s2="npr";
	s1="";n++;if(n==1)
	s3=s2;		
	}
	if(st.equals("ncr"))
	{
	s2="ncr";
	s1="";	n++;if(n==1)
	s3=s2;	
	}

	if(st.equals("-/+")){s1+="-";t.setText(s1);}
	if(st.equals(".")){s1+=".";t.setText(s1);}

	if(st.equals("DEL")){s1=t.getText();int s0=s1.length()-1;
	s1=s1.substring(0,s0);t.setText(s1);}
	if(st.equals("Squa")){l1=Double.parseDouble(t.getText());l1=Math.pow(l1,2);t.setText(String.valueOf(l1));l3=l1;s1="";}
	if(st.equals("Sqr")){l1=Double.parseDouble(t.getText());l1=Math.sqrt(l1);t.setText(String.valueOf(l1));l3=l1;s1="";}	
	if(st.equals("Cubing")){l1=Double.parseDouble(t.getText());l1=Math.pow(l1,3);t.setText(String.valueOf(l1));l3=l1;s1="";}
	if(st.equals("Ceil")){l1=Double.parseDouble(t.getText());l1=Math.ceil(l1);t.setText(String.valueOf((long)l1));l3=l1;s1="";}
	if(st.equals("Floor")){l1=Double.parseDouble(t.getText());l1=Math.floor(l1);t.setText(String.valueOf((long)l1));l3=l1;s1="";}
	if(st.equals("Log")){l1=Double.parseDouble(t.getText());l1=Math.log(l1);t.setText(String.valueOf(l1));l3=l1;s1="";}
	if(st.equals("Abs")){l1=Double.parseDouble(t.getText());l1=Math.abs(l1);t.setText(String.valueOf(l1));l3=l1;s1="";}	
	if(st.equals("Sin")){l1=Double.parseDouble(t.getText());l1=Math.sin(l1);t.setText(String.valueOf(l1));l3=l1;s1="";}
	if(st.equals("Cos")){l1=Double.parseDouble(t.getText());l1=Math.cos(l1);t.setText(String.valueOf(l1));l3=l1;s1="";}
	if(st.equals("Tan")){l1=Double.parseDouble(t.getText());l1=Math.tan(l1);t.setText(String.valueOf(l1));l3=l1;s1="";}
	if(st.equals("asin")){l1=Double.parseDouble(t.getText());l1=Math.asin(l1);t.setText(String.valueOf(l1));l3=l1;s1="";}	
	if(st.equals("acos")){l1=Double.parseDouble(t.getText());l1=Math.acos(l1);t.setText(String.valueOf(l1));l3=l1;s1="";}
	if(st.equals("atan")){l1=Double.parseDouble(t.getText());l1=Math.atan(l1);t.setText(String.valueOf(l1));l3=l1;s1="";}
	if(st.equals("Mod")){l1=Double.parseDouble(t.getText());if(l1<0)l1=l1*-1;t.setText(String.valueOf(l1));l3=l1;s1="";}
	if(st.equals("e(x)")){l1=Double.parseDouble(t.getText());l1=Math.exp(l1);t.setText(String.valueOf(l1));l3=l1;s1="";}
	if(st.equals("Int")){l1=Double.parseDouble(t.getText());t.setText(String.valueOf((long)l1));l3=l1;s1="";}
	if(st.equals("1/x")){l1=Double.parseDouble(t.getText());l1=1/l1;t.setText(String.valueOf(l1));l3=l1;s1="";}
	if(st.equals("toDeg")){l1=Double.parseDouble(t.getText());l1=Math.toDegrees(l1);t.setText(String.valueOf(l1));l3=l1;s1="";}
	if(st.equals("toRadi")){l1=Double.parseDouble(t.getText());l1=Math.toRadians(l1);t.setText(String.valueOf(l1));l3=l1;s1="";}
	if(st.equals("x!")){l1=Double.parseDouble(t.getText());l1=fact((long)(l1));t.setText(String.valueOf((long)(l1)));l3=l1;s1="";}

	if(st.equals("OR"))
	{
	s2="OR";
	s1="";n++;if(n==1)
	s3=s2;}
	if(st.equals("AND"))
	{
	s2="AND";
	s1="";n++;if(n==1)
	s3=s2;}
	if(st.equals("x^y"))
	{
	s2="x^y";
	s1="";n++;if(n==1)
	s3=s2;}
	if(st.equals("=")){n=2;}
	if(!(s2.equals(""))){
	try{
	for(k=0;k<=9;k++)
	if((!st.equals(String.valueOf(k)))){
	l2=Double.parseDouble(t.getText());if(n==2){s4=s2;s2=s3;s3=s4;
	if(s2.equals("/"))
	l1=l1/l2;
	if(s2.equals("OR"))
	l1=(long)l1|(long)l2;
	if(s2.equals("AND"))
	l1=(long)l1&(long)l2;
	if(s2.equals("*"))
	l1=l1*l2;
	if(s2.equals("x^y"))
	l1=Math.pow(l1,l2);
	if(s2.equals("+"))
	l1=l1+l2;
	if(s2.equals("%")){
	l1=(long)(l1)%(long)(l2);
	if(!st.equals("="))
	l2=0;}
	if(s2.equals("-"))
	l1=l1-l2;
	if(s2.equals("npr"))
	l1=fact((long)l1)/fact((long)(l1-l2));
	if(s2.equals("ncr"))
	l1=fact((long)l1)/(fact((long)l2)*fact((long)(l1-l2)));
	s1="";n=1;
	if(l1%1==0){ nu=(long)(l1);
	t.setText(String.valueOf(nu));l3=nu;}
	else {t.setText(String.valueOf(l1));l3=l1;}
	}}
	}catch(NumberFormatException e2){t.setText("Error");s1="0";}
	if(st.equals("Replay"))if(l3%1==0){ nu=(long)(l3);
	t.setText(String.valueOf(nu));}
	else t.setText(String.valueOf(l3));
	
	}}catch(Exception e1){t.setText("Syntex error");}
		if(st.equals("AC")){t.setText("");n=0;s1="";l1=0.0;l3=0;}
}
long fact(long x){
long f;
if(x==0||x==1)
return 1;
else
f=x*fact(x-1);
return f;}}
class MyWin2 extends WindowAdapter
{
Cal2 c;
MyWin2(Cal2 c)
{
this.c=c;
}
public void windowClosing(WindowEvent e)
{
c.setVisible(false);
}
}
public class Ma2 extends JApplet
{
Cal2 c;
public void init(){
c=new Cal2("calculator");
c.setSize(450,230);
c.setVisible(true);}
}
