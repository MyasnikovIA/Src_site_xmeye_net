<%@ page contentType="image/jpeg"
         import="java.awt.*,javax.imageio.ImageIO,java.util.Random,java.awt.image.BufferedImage" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.imageio.stream.ImageOutputStream" %>
<%@ page import="java.io.OutputStream" %>
<%
    //设置页面不缓存
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);

    String code = "";
    int codeLength = 4;
    int height = 20;
    int width = 60;
    Font font = new Font("Times New Roman", 0, 18);

    Random random = new Random();
    /*产生随机数验证码*/
    for (int i = 0; i < codeLength; i++) {
        code += random.nextInt(10);
    }
   /* 绘制图片设置背景颜色*/
    BufferedImage image = new BufferedImage(width, height, 1);
    Graphics graphics = image.getGraphics();
    graphics.setColor(new Color(200 + random.nextInt(50), 200 + random.nextInt(50), 200 + random.nextInt(50)));
    graphics.fillRect(0, 0, width, height);
    graphics.setFont(font);
    graphics.setColor(new Color(200 + random.nextInt(40), 200 + random.nextInt(40), 200 + random.nextInt(40)));

    for (int i = 0; i < 155; ++i) {
        int ch = random.nextInt(width);
        int y = random.nextInt(height);
        int xl = random.nextInt(12);
        int yl = random.nextInt(12);
        graphics.drawLine(ch, y, ch + xl, y + yl);
    }

    for (int i = 0; i < code.length(); ++i) {
        String var9 = code.substring(i, i + 1);
        graphics.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
        graphics.drawString(var9, 13 * i + 6, 16);
    }
    graphics.dispose();
    session.setAttribute("verificationCode", code);
   // OutputStream outputStream = response.getOutputStream();
    ImageIO.write(image, "JPEG", response.getOutputStream());
   // outputStream.flush();
   // outputStream.close();
%>
