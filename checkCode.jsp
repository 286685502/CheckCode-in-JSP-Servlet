//我的github:https://github.com/ygj0930
//我的博客：http://www.cnblogs.com/ygj0930/

<%@ page contentType="image/jpeg" %>
<%@ page import="java.awt.Color,java.awt.Font,java.awt.Graphics2D"%> 
<%@ page import="java.awt.image.BufferedImage,java.util.Random,javax.imageio.ImageIO"%> 
<%@ page import="javax.servlet.*,javax.servlet.http.*"%> 
<%
int width = 62, height = 22;
String[] ops={"+","-","*","/","="};
BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
Graphics2D g = buffImg.createGraphics();

g.setColor(Color.WHITE);
g.fillRect(0, 0, width, height);

g.setColor(Color.BLACK);
g.drawRect(0, 0, width - 1, height - 1);

g.setColor(Color.GRAY);
Random random = new Random();			
for (int i = 0; i < 40; i++) {		
    int x1 = random.nextInt(width);
    int y1 = random.nextInt(height);
    int x2 = random.nextInt(10);
    int y2 = random.nextInt(10);			
    g.drawLine(x1, y1, x1 + x2, y1 + y2);
}

Font font = new Font("Times New Roman", Font.PLAIN, 18);
g.setFont(font);

    int num1=random.nextInt(10);
    String strRand1 = String.valueOf(num1);
	int red1 = random.nextInt(255);
	int green1 = random.nextInt(255);
	int blue1 = random.nextInt(255);
	g.setColor(new Color(red1, green1, blue1));            
	g.drawString(strRand1, 13 *0 + 6, 16);
   
    int op_num=random.nextInt(4);
	System.out.println(op_num);
	String strRand2 =(String)ops[op_num];
	int red2 = random.nextInt(255);
	int green2 = random.nextInt(255);
	int blue2 = random.nextInt(255);
	g.setColor(new Color(red2, green2, blue2));            
	g.drawString(strRand2, 13 *1 + 6, 16);
   
    int num2=(random.nextInt(9)+1);	
	String strRand3 = String.valueOf(num2);
	int red3 = random.nextInt(255);
	int green3 = random.nextInt(255);
	int blue3 = random.nextInt(255);
	g.setColor(new Color(red3, green3, blue3));            
	g.drawString(strRand3, 13 *2 + 6, 16);
   
	String strRand4 =(String)ops[4] ;
	int red4 = random.nextInt(255);
	int green4 = random.nextInt(255);
	int blue4 = random.nextInt(255);
	g.setColor(new Color(red4, green4, blue4));            
	g.drawString(strRand4, 13 *3 + 6, 16);
	
	Integer randomCode=0;
    switch(op_num){
	case 0:
	        randomCode = num1+num2;
			break;
	case 1:
			randomCode = num1-num2;
			break;
	case 2:
		    randomCode = num1*num2;
			break;  
	case 3:
			randomCode = num1/num2;
			break;	
	}
    session.setAttribute("randomCode", randomCode.toString());
	
    buffImg.flush();
    g.dispose();
    response.setContentType("image/jpeg");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    ServletOutputStream outputStream = response.getOutputStream();
    ImageIO.write(buffImg, "jpeg", outputStream);
    outputStream.close();
    out.clear();   
    out = pageContext.pushBody();  
%>