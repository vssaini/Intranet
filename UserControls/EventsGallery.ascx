<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EventsGallery.ascx.cs" Inherits="UserControls_EventsGallery" %>
<%@ OutputCache Duration="60" VaryByParam="None" %>
 <div id="silverlightControlHost" class="silverlight">
        <object data="data:application/x-silverlight-2," type="application/x-silverlight-2"
            width="100%" height="385px">  
            <param name="windowless" value="true" />          
            <param name="source" value="SlideShow.xap" />
            <param name="initParams" value="ConfigurationProvider=XmlConfigurationProvider;Path=Configuration.xml,DataProvider=XmlDataProvider;Path=Data.xml" />
            <param name="onError" value="onSilverlightError" />
            <param name="background" value="#FFC0C0C0" />
            <param name="minRuntimeVersion" value="3.0" />
            <param name="autoUpgrade" value="false" />            
            <div class="slInstall">
                <div class="slInstallPopupWide" style="height: 363px">
                    <div class="slPopupContentWide">
                        <div class="slScreenshotWide">
                            <img src="<%=VirtualPathUtility.ToAbsolute("~")%>/Gallery/SilverlightNotFound/images/wide/light.jpg"></div>
                        <div class="slTextContentWide">
                            <div class="slHeadlineWide">
                                Events Gallery</div>
                            <div class="slDescription">
                                <p>
                                    Experience event's pics in visually appealing gallery. Powered by the award winning
                                    Microsoft Silverlight technology. It includes:</p>
                                <ul>
                                    <li>High quality HD view of pics in slide show</li>
                                    <li>Navigation controls with thumbnails</li>
                                    <li>Gallery view in full size</li>
                                </ul>
                                <p>
                                    Click below to update your browser with Microsoft Silverlight. It takes 1 minute
                                    in installation. Or contact <b>IS Help Desk</b> for silverlight installation.</p>
                            </div>
                            <img class="slDivider" src="<%=VirtualPathUtility.ToAbsolute("~")%>/Gallery/SilverlightNotFound/images/wide/divider.png"
                                style="display: block">
                            <a class="slButtonWide" href="<%=VirtualPathUtility.ToAbsolute("~")%>/Software/Silverlight.exe"
                                style="display: block">UPDATE & ENJOY</a>
                        </div>
                    </div>
                    <div class="slPopupTopWide">
                    </div>
                    <div class="slPopupLoopWide" style="height: 17px">
                    </div>
                    <div class="slPopupBotWide">
                    </div>
                </div>
            </div>
        </object>
        <iframe id="_sl_historyFrame" style="visibility: hidden; height: 0px; width: 0px;
            border: 0px"></iframe>
    </div>
