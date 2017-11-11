<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hindi.aspx.cs" Inherits="Pages_Hindi2" %>

<%@ Register Src="~/UserControls/Header.ascx" TagName="header" TagPrefix="site" %>
<%@ Register Src="~/UserControls/Footer.ascx" TagName="footer" TagPrefix="site" %>
<%@ Register Src="~/UserControls/Horizontal-Menu.ascx" TagName="horizontal" TagPrefix="menu" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Rajasthan State Office - Intranet</title>
    <link rel="Stylesheet" href="../Style/General.css" type="text/css" />
    <link rel="Stylesheet" href="../Style/Hindi/hindi.css" type="text/css" />
    <link rel="Shortcut Icon" href="../favicon.ico" />
</head>
<body onload="startclock(); startType(100, 'txtDestination');">
    <form id="master" runat="server">
    <div class="main">
        <div id="header">
            <%--HEADER--%>
            <site:header ID="siteHeader" runat="server" />
            <%--HORIZONTAL MENU--%>
            <div class="clear hideSkiplink">
                <menu:horizontal ID="horzMenu" runat="server" />
            </div>
            <%--ANNOUNCEMENT--%>
            <table class="announcement">
                <tr>
                    <asp:HiddenField ID="hfAnnounce" runat="server" Value="Welcome to RSO Intranet Portal!" />
                    <td id="txtDestination" class="annImg" />
                </tr>
            </table>
        </div>
        <div class="clear">
        </div>
        <div style="min-height: 355px; width: 100%">
            <div class="hindiBox">
                <ajax:ToolkitScriptManager ID="scriptManager" runat="server" EnablePartialRendering="true" />
                <ajax:TabContainer runat="server" ID="Tabs" Height="520px" AutoPostBack="true" ActiveTabIndex="0"
                    Width="100%" CssClass="hindi__tab_xpie7" OnActiveTabChanged="Tabs_ActiveTabChanged">
                    <ajax:TabPanel runat="server" ID="panelHome" HeaderText="मुखपृष्ठ">
                        <ContentTemplate>
                            हिन्दी, उर्दू और हिन्दी में अनूदित काव्य के इस विशाल संकलन में आपका स्वागत है। यह
                            एक खुली परियोजना है जिसके विकास में कोई भी भाग ले सकता है -आप भी! आपसे निवेदन है
                            कि आप भी इस संकलन के परिवर्धन में सहायता करें। देखिये हिन्दी विभाग में आप किस तरह
                            योगदान कर सकते हैं।
                            <div style="height: 5px;">
                            </div>
                            <div style="text-align: center">
                                <div style="font-size: 19px; font-weight: bold; color: #0080FF">
                                    सप्ताह की कविता</div>
                                <div style="font-size: 15px;">
                                    <b>शीर्षक&nbsp;: कुरुक्षेत्र : प्रथम सर्ग भाग 1 (</b>रचनाकार: <b style="color: #FE642E;">
                                        रामधारी सिंह "दिनकर" </b>)</div>
                                <img src="../Documents/Images/Hindi/Kurukshetra.jpg" style="padding-top: 3px; margin: 0 0 0 0;"
                                    alt="kurukshetra" />
                                <pre style="text-align: center; overflow: auto; height: 23em; background: none repeat scroll 0% 0% transparent;
                                    border: medium none; font-size: 13px;">वह कौन रोता है वहाँ-
इतिहास के अध्याय पर,
जिसमें लिखा है, नौजवानों के लहु का मोल है
प्रत्यय किसी बूढे, कुटिल नीतिज्ञ के व्याहार का;
जिसका हृदय उतना मलिन जितना कि शीर्ष वलक्ष है;
जो आप तो लड़ता नहीं,
कटवा किशोरों को मगर,
आश्वस्त होकर सोचता,
शोणित बहा, लेकिन, गयी बच लाज सारे देश की?

        और तब सम्मान से जाते गिने
        नाम उनके, देश-मुख की लालिमा
        है बची जिनके लुटे सिन्दूर से;
        देश की इज्जत बचाने के लिए
        या चढा जिनने दिये निज लाल हैं।

ईश जानें, देश का लज्जा विषय
तत्त्व है कोई कि केवल आवरण
उस हलाहल-सी कुटिल द्रोहाग्नि का
जो कि जलती आ रही चिरकाल से
स्वार्थ-लोलुप सभ्यता के अग्रणी
नायकों के पेट में जठराग्नि-सी।

        विश्व-मानव के हृदय निर्द्वेष में
        मूल हो सकता नहीं द्रोहाग्नि का;
        चाहता लड़ना नहीं समुदाय है,
        फैलतीं लपटें विषैली व्यक्तियों की साँस से।

हर युद्ध के पहले द्विधा लड़ती उबलते क्रोध से,
हर युद्ध के पहले मनुज है सोचता, क्या शस्त्र ही-
उपचार एक अमोघ है
अन्याय का, अपकर्ष का, विष का गरलमय द्रोह का!

        लड़ना उसे पड़ता मगर।
        औ' जीतने के बाद भी,
        रणभूमि में वह देखता है सत्य को रोता हुआ;
        वह सत्य, है जो रो रहा इतिहास के अध्याय में
        विजयी पुरुष के नाम पर कीचड़ नयन का डालता।

उस सत्य के आघात से
हैं झनझना उठ्ती शिराएँ प्राण की असहाय-सी,
सहसा विपंचि लगे कोई अपरिचित हाथ ज्यों।
वह तिलमिला उठता, मगर,
है जानता इस चोट का उत्तर न उसके पास है।

        सहसा हृदय को तोड़कर
        कढती प्रतिध्वनि प्राणगत अनिवार सत्याघात की-
        'नर का बहाया रक्त, हे भगवान! मैंने क्या किया
        लेकिन, मनुज के प्राण, शायद, पत्थरों के हैं बने।

इस दंश क दुख भूल कर
होता समर-आरूढ फिर;
फिर मारता, मरता,
विजय पाकर बहाता अश्रु है।

        यों ही, बहुत पहले कभी कुरुभूमि में
        नर-मेध की लीला हुई जब पूर्ण थी,
        पीकर लहू जब आदमी के वक्ष का
        वज्रांग पाण्डव भीम क मन हो चुका परिशान्त था।

और जब व्रत-मुक्त-केशी द्रौपदी,
मानवी अथवा ज्वलित, जाग्रत शिखा प्रतिशोध की
दाँत अपने पीस अन्तिम क्रोध से,
रक्त-वेणी कर चुकी थी केश की,
केश जो तेरह बरस से थे खुले।

        और जब पविकाय पाण्डव भीम ने
        द्रोण-सुत के सीस की मणि छीन कर
        हाथ में रख दी प्रिया के मग्न हो
        पाँच नन्हें बालकों के मुल्य-सी।

कौरवों का श्राद्ध करने के लिए
या कि रोने को चिता के सामने,
शेष जब था रह गया कोई नहीं
एक वृद्धा, एक अन्धे के सिवा।
</pre>
                            </div>
                        </ContentTemplate>
                    </ajax:TabPanel>
                    <ajax:TabPanel runat="server" ID="panelHindiDivas" HeaderText="हिन्दी दिवस">
                        <ContentTemplate>
                            <iframe id="i1" runat="server" class="iframe" frameborder="0" scrolling="auto" height="480px"
                                width="100%"></iframe>
                        </ContentTemplate>
                    </ajax:TabPanel>
                    <ajax:TabPanel runat="server" ID="panelRajbhashaNiti" HeaderText="राजभाषा नीति">
                        <ContentTemplate>
                            <iframe id="i2" runat="server" class="iframe" frameborder="0" scrolling="auto" height="480px"
                                width="100%"></iframe>
                        </ContentTemplate>
                    </ajax:TabPanel>
                    <ajax:TabPanel runat="server" ID="panelRajbhashaMargdarshan" HeaderText="राजभाषा मार्गदर्शन">
                        <ContentTemplate>
                            <iframe id="i3" runat="server" class="iframe" frameborder="0" scrolling="auto" height="480px"
                                width="100%"></iframe>
                        </ContentTemplate>
                    </ajax:TabPanel>
                    <ajax:TabPanel runat="server" ID="panelArchive" HeaderText="संग्रहण">
                        <ContentTemplate>
                            यह पृष्ठ अभी निर्माणाधीन है ।
                        </ContentTemplate>
                    </ajax:TabPanel>
                    <ajax:TabPanel runat="server" ID="panelAdmin" HeaderText="अधिकारिक क्षेत्र" Visible="false">
                        <ContentTemplate>
                            अधिकारिक क्षेत्र
                        </ContentTemplate>
                    </ajax:TabPanel>
                </ajax:TabContainer><br />
            </div>
            <div class="clear">
            </div>
            <%--FOOTER--%>
            <site:footer ID="siteFooter" runat="server" />
        </div>
    </div>
    </form>
    <script type="text/javascript" defer="defer" src="<%=VirtualPathUtility.ToAbsolute("~")%>/Style/Scripts/script.js"></script>
</body>
</html>
