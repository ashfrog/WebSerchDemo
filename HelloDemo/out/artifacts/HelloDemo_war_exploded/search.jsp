<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/4
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        #mydiv{
            width: 640px;
            height:36px;
            position:absolute;
            left:50%;
            top:50%;
            margin-left: -320px;
            margin-top:-147px;
            background-color:yellow;
            border:0px;
        }
        #mybutton{
            display:inline;
            width:30%;
            height:100%;
            margin-right:0px;
            border:0px;
            background-color: #3385FF;
            color:white;
        }
        .mouseover{
            background-color:red;
        }
        .tbd{
            width: 500px;
        }

        #keywords {
            width:69%;
            height:100%;
            margin-left: 0px;
            margin-top: 0px;
        }
    </style>
    <script type="text/javascript">

        var xmlHttp;
        function getmorecontents()
        {
            var content = document.getElementById("keywords");
            if(!isEmpty(content.value.trim()))
            {
                xmlHttp = createxmlhttp();
                var url="search?keywords="+encodeURI(content.value);
                xmlHttp.open("GET",url,true);//true 异步
                xmlHttp.onreadystatechange=callback;
                xmlHttp.send(null);
            }
        }

        function isEmpty(obj) {
            if (obj == null) return true;
            if (typeof obj === 'undefined') {
                return true;
            }
            if (typeof obj == 'string') {
                if (obj == "") {
                    return true;
                }
            }
            return false;
        }

        String.prototype.trim=function() {
            return this.replace(/(^\s*)|(\s*$)/g,'');
        };

        function callback() {
            if(xmlHttp.readyState ==4 ) {
                if (xmlHttp.status == 200) {
                    var result = xmlHttp.responseText;
                    var json = eval("(" + result + ")");
                    setContent(json);
                }
            }
        }

        function clearcontent()
        {
            var contentTableBody = document.getElementById("content_table_body");
            var size = contentTableBody.childNodes.length;
            for(var i=size-1;i>=0;i--)
            {
                contentTableBody.removeChild(contentTableBody.childNodes[i]);
            }
            document.getElementById("popDiv").style.border="none";
        }
        function setlocation()
        {
//            var content = document.getElementById("keywords");
//            var width = content.offsetWidth;
//            var left = content["offsetLeft"];
//            var top = content["offsetTop"]+content.offsetHeight;
            //var popdiv = document.getElementById("popDiv");
//            popdiv.style.border="black 1px solid";
//            popDiv.style.left =left+"px";
//            popDiv.style.top =top+"px";
//            popDiv.style.width =width+"px";
            //var contenttable = document.getElementById("content_table");
            //contenttable.style.width=width+"px";
        }

        function setContent(contents)
        {
            clearcontent();
            setlocation();
            for(var i=0;i<contents.length;i++)
            {
                var nextNode = contents[i];

                var tr = document.createElement("tr");

                var td = document.createElement("td");

                td.setAttribute("border","0");


                td.onmouseover=function () {
                    this.className='mouseover';
                }
                td.onmouseout=function () {

                    this.className='mouseout';
                }
                td.onclick=function () {
                    var textv = document.getElementById("keywords");
                    textv.value = this.textContent;
                    clearcontent();
                }

                var text= document.createTextNode(nextNode);

                td.appendChild(text);


                tr.appendChild(td);
                var tbody = document.getElementById("content_table_body");
                tbody.appendChild(tr);

            }
        }
        function  clickbody() {
            clearcontent();
        }
        function createxmlhttp()
        {
            var xmlhttp;
            if(window.XMLHttpRequest)
            {
                xmlhttp = new XMLHttpRequest();
            }
            if(!xmlhttp&&window.ActiveXObject)
            {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                if(!xmlhttp)
                {
                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP")
                }
            }
            return xmlhttp;
        }
    </script>
</head>
<body onclick="clearcontent()">
    <div id="mydiv" >
        <form id="myform" name="myf" action="search" >
            <span>
                <input type="text"  id="keywords" onkeyup="getmorecontents()" onclick="getmorecontents()" />
                <input type="submit" id="mybutton" value="百度一下" />
            </span>
        </form>
        <div id="popDiv" >
            <table id="content_table" bgcolor = "#663399" border="0" >
                <tbody id="content_table_body" class="tbd">

                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
