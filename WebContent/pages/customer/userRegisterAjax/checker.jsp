<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
    import="java.sql.*"
%>
<%@ page import="cn.estore.entity.CustomerEntity" %>
<%@ page import="cn.estore.dao.CustomerDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
<title>Insert title here</title>
</head>
<body>
<%	
    out.clear();                                    //��յ�ǰ��������ݣ��ո�ͻ��з���
    request.setCharacterEncoding("GB2312");          //�����������ַ������ʽΪUTF-8
    String name = request.getParameter("name");     //��ȡname����
    if ((name!=null)&&(name.equals("userName"))) 
    	{name="user_name";}
    String value = request.getParameter("value");   //��ȡvalue����
    String info = null;                             //���ڱ�����ʾ���������

    //�����Ҫ�жϵ�����֤�룬����session��ʽ��֤
    if ("code".equals(name)) {
        String sessionCode = (String) session.getAttribute("_CODE_");   //��ȡsession�б������֤��
        //���ݶԱȽ�������Ӧ��Ϣ
        if (value != null && value.equals(sessionCode)) {
            out.print("1��֤����ȷ!");
        } else {
            out.print("0��֤�����!");
        }
    } else {
        //����name����ȷ����ʾ���������
        if ("user_name".equals(name)) {
            info = "�û���";
        } else if ("email".equals(name)) {
            info = "�ʼ���ַ";
        }else if ("mobile".equals(name)) {
            info = "�ֻ�����";
        }

        //�����Ƿ������ͬ��Ϣ�����Ӧ����Ӧ
        CustomerDao eDao=new CustomerDao();
        if (eDao.hasSameValue(name, value)) {
            out.print("0��" + info + "�Ѵ��ڣ������!");
        } else {
            out.print("1��" + info + "����!");
        }
    }
%>
</body>
</html>