<%@ Control Language="C#" ClassName="HomePage" %>
<%@ OutputCache Duration="120" VaryByParam="None" %>
<div class="theme-default">
    <center>
        <div id="slider" class="nivoSlider">
            <%--Image dimensions should be of 618x246 px--%>            
            <img src="<%=VirtualPathUtility.ToAbsolute("~")%>/Style/Slideshow/images/rso_building.jpg" alt="Building View" title="Rajasthan State Office (राजस्थान राज्य कार्यालय)" />
            <img src="<%=VirtualPathUtility.ToAbsolute("~")%>/Style/Slideshow/images/ioc_day.jpg" alt="Indian Oil Day" title="Indian Oil Day" />
            <img src="<%=VirtualPathUtility.ToAbsolute("~")%>/Style/Slideshow/images/rso_entrance.jpg" alt="Entrance View" title="RSO - Entrance View" />
            <img src="<%=VirtualPathUtility.ToAbsolute("~")%>/Style/Slideshow/images/map.bmp" alt="RSO Map" title="RSO Location in Map (tagged as Indian Oil)" />
        </div>
    </center>
</div>
<div class="comCol">
    <div class="insideCol">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tbody>
                <tr>
                    <td class="box2Left">
                    </td>
                    <td class="box2Middle">
                        <span class="newsImg" /><span class="padLeft">NEWS BULLETIN FOR RSO EMPLOYEES</span>
                    </td>
                    <td class="box2Right">
                    </td>
                </tr>
                <tr>
                    <td class="box2LVBrdr box2Background">
                        &nbsp;
                    </td>
                    <%--NEWS BOX MESSAGES --%>
                    <td class=" box2Background ulImage">
                        <div style="text-align: justify;">
                            <div>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tbody>
                                        <tr class="lnkHead">
                                            <td class="bullet">
                                                <img src="<%=VirtualPathUtility.ToAbsolute("~")%>/Style/Images/bullet.png" alt="Bullet"/>&nbsp;
                                            </td>
                                            <td>
                                                <a href="javascript://intranet" id="1" name="NewsPoint" title="Expand" onclick="ExpandCollapseLink(this.id)">
                                                    RSO Intranet release - Welcome to your new employee intranet</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="News1" class="lnkContent">
                                We have redesigned intranet for RSO Employees. Let us know what you like and improvement
                                you need further.
                            </div>
                            <div>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tbody>
                                        <tr class="lnkHead">
                                            <td class="bullet">
                                                <img src="<%=VirtualPathUtility.ToAbsolute("~")%>/Style/Images/bullet.png" alt="Bullet"/>&nbsp;
                                            </td>
                                            <td>
                                                <a href="javascript://intranet" id="2" name="NewsPoint" title="Expand" onclick="ExpandCollapseLink(this.id)">
                                                    Government granted <span style="color: Blue">Maharatna</span> status to Indian Oil
                                                    Corporation</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="News2" class="lnkContent">
                                Congratulations !! All RSO Employee. It's cheering time.<br />
                                <b>IOC</b> qualified for the coveted status according to the criteria laid down
                                by the Cabinet in December last year, which now empowers them to make foreign investments
                                of up to Rs 5,000 crore on their own.
                                <br />
                                According to the criteria laid down by the Cabinet, the <b>Maharatna</b> status
                                is granted to listed navaratna central public sector companies with an average annual
                                turnover of more than Rs 25,000 crore, net profit after tax of Rs 5,000 crore and
                                net worth of Rs 15,000 crore during the past three years along with listed on the
                                stock exchange.
                            </div>
                            <div>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tbody>
                                        <tr class="lnkHead">
                                            <td class="bullet">
                                                <img src="<%=VirtualPathUtility.ToAbsolute("~")%>/Style/Images/bullet.png" alt="Bullet"/>&nbsp;
                                            </td>
                                            <td>
                                                <a href="javascript://intranet" id="3" name="NewsPoint" title="Expand" onclick="ExpandCollapseLink(this.id)">
                                                    Upcoming Events in Rajasthan State Office</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="News3" class="lnkContent">
                                1. New Year Celebration
                            </div>
                            <div>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tbody>
                                        <tr class="lnkHead">
                                            <td class="bullet">
                                                <img src="<%=VirtualPathUtility.ToAbsolute("~")%>/Style/Images/bullet.png" alt="Bullet"/>&nbsp;
                                            </td>
                                            <td>
                                                <a href="javascript://intranet" id="4" name="NewsPoint" title="Expand" onclick="ExpandCollapseLink(this.id)">
                                                    Lease line expanded from 2 MB to 4 MB</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="News4" class="lnkContent">
                                Congratulations ! RSO Employees. Now you can work more smoothly and fastly as HO
                                has expanded lease line from 2 MB to 4 MB.
                                <br />
                                <b>How I'm benefited?</b><br />
                                Now onwards when you use HO websites or SAP it would take less time unlike earlier.
                                So you don't need to wait too long to get your reports or queries to execute.
                            </div>
                            <div>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tbody>
                                        <tr class="lnkHead">
                                            <td class="bullet">
                                                <img src="<%=VirtualPathUtility.ToAbsolute("~")%>/Style/Images/bullet.png" alt="Bullet"/>&nbsp;
                                            </td>
                                            <td>
                                                <a href="javascript://intranet" id="5" name="NewsPoint" title="Expand" onclick="ExpandCollapseLink(this.id)">
                                                    Microsoft Office Outlook instead of Lotus Mail</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="News5" class="lnkContent">
                                Confuse???<br />
                                Yes! This is true. In coming days you would be able to check your office mails by
                                <b>Office Outlook</b>. And there would be no need to install Lotus Mail separately.
                                All things with MS Office. Isn't it would be so easy for you too?<br />
                                Well wait for next update. Keep watching news...
                            </div>
                        </div>
                    </td>
                    <td class="box2RVBrdr  box2Background">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="box2HBrdr">
                        &nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript" src="<%=VirtualPathUtility.ToAbsolute("~")%>/Style/Slideshow/scripts/jquery-mix.js"></script>
<script type="text/javascript">
    $(window).load(function () {
        $('#slider').nivoSlider();
    });
</script>
