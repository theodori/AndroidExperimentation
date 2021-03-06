<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="eu.smartsantander.androidExperimentation.ModelManager" %>
<%@ page import="eu.smartsantander.androidExperimentation.entities.Plugin" %>
<%@ page import="eu.smartsantander.androidExperimentation.jsonEntities.PluginList" %>
<html>
<head>
    <title>AndroidExperimentation - SmartSantander</title>
</head>
<body>
<jsp:include page="./includes/header.html" flush="true"/>

<h2>Upload a new experiment</h2>

<p>
    Select a file to upload:
    <br>

<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">

    <table>
        <tr>
            <td>Experiment Name</td>
            <td><input type="text" name="name" size="55"/></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><textarea name="experimentDescription" rows="4" cols="54">Enter description here...</textarea></td>
        </tr>
        <tr>
            <td>Context Type</td>
            <td>
                org.ambientdynamix.contextplugins.ExperimentPlugin
                <select name="contextType" hidden="true">
                    <option value="org.ambientdynamix.contextplugins.ExperimentPlugin">
                        org.ambientdynamix.contextplugins.ExperimentPlugin
                    </option>
                    <%--                   <%


                                           List<Plugin> pList = pl.getPluginList();

                                           for (Plugin p : pList) {
                                               out.println("<option value=\">" + p.getName() + "\" >" + p.getName() + "</option>");
                                           }

                                       %>--%>
                </select>
            </td>
        </tr>
        <tr>
            <td>Sensor Dependencies</td>
            <td>
                <ul>
                    <select name="dependencies" multiple>
                        <%
                            PluginList pList = ModelManager.getPlugins();
                            for (Plugin p : pList.getPluginList()) {
                                if (p.getName().equals("plugs.xml") == false)
                                    out.println("<option value=\"" + p.getContextType() + "\" >" + p.getName() + "</option>");
                                //out.println("<li><option type=\"checkbox\" name=\"sensorD\">" + p.getName() + "</input></li>");
                            }

                        %>
                    </select>
                </ul>
            </td>
        </tr>
        <tr>
            <td>Public data</td>
            <td><input type="checkbox" name="isPublic"/></td>
        </tr>
        <tr>
            <td>Starting at:</td>
            <td><input type="datetime-local" name="startingTime"/></td>
        </tr>
        <tr>
            <td>Ending at:</td>
            <td><input type="datetime-local" name="endingTime"/></td>
        </tr>
        </tr>
        <tr>
            <td>Experiment File</td>
            <td><input type="file" name="experimentFile" size="55"/></td>
        </tr>


    </table>


    <br/>
    <input type="submit" value="Upload File"/>
</form>

<jsp:include page="./includes/footer.html" flush="true"/>
</body>
</html>