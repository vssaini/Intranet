using System;
using System.Collections.Generic;
using System.Web;
using System.Xml;
using System.IO;

/// <summary>
/// Class for refreshing Gallery
/// </summary>
public class Gallery
{
    string fileName = HttpContext.Current.Server.MapPath("~/Gallery/Data.xml");
    string galleryFolder = HttpContext.Current.Server.MapPath("~/Gallery/EventsGallery");
    string[] extensions = new string[3] { ".jpg", ".jpeg", ".png"};

    public Gallery()
    { }

    /// <summary>
    /// Create new xml file
    /// </summary>
    public void CreateNewXmlFile()
    {
        // 1. Create the XmlTextWriter
        XmlTextWriter tw = new XmlTextWriter(fileName, System.Text.Encoding.UTF8);

        // 2. Set the formatting to indented
        tw.Formatting = Formatting.Indented;

        // 3. Creat root element
        tw.WriteStartDocument();
        tw.WriteStartElement("data");
        tw.WriteAttributeString("startalbumindex", "0");
        tw.WriteAttributeString("transition", "CrossFadeTransition");
        tw.WriteEndElement();
        tw.WriteEndDocument();

        // 4. Clean up
        tw.Flush();
        tw.Close();
    }

    /// <summary>
    /// Appends data to existing xml file
    /// </summary>
    public void AppendDataToXml()
    {
        string[] folders = Directory.GetDirectories(galleryFolder, "*", SearchOption.AllDirectories);

        foreach (string directory in folders)
        {
            string[] fileEntries = Directory.GetFiles(directory, "*");

            if (File.Exists(fileName))
            {
                AddElementsNodes(fileEntries, new DirectoryInfo(directory).Name);
            }            
        }
    }   

    protected void AddElementsNodes(string[] files, string albumName)
    {
        // 1. Load xml file
        XmlDocument xDoc = new XmlDocument();
        xDoc.Load(fileName);

        // 2. Get Root Node
        XmlNode rootNode = xDoc.SelectSingleNode("data");

        // 3. Create new element album
        XmlElement newElement = xDoc.CreateElement("album");
        XmlAttribute attr = xDoc.CreateAttribute("title");
        attr.Value = albumName;
        newElement.Attributes.Append(attr);

        // 4. Add New Node 
        rootNode.AppendChild(newElement);

        // 5. Make new node for each file
        foreach (string file in files)
        {
            foreach (string ext in extensions)
            {
                if (ext.Equals(Path.GetExtension(file).ToLower()))
                {
                    // 6. Append Child Nodes to New Node 
                    XmlNode xNode = xDoc.CreateNode(XmlNodeType.Element, "slide", "");
                    XmlAttribute title = xDoc.CreateAttribute("title");
                    title.Value = albumName;
                    XmlAttribute image = xDoc.CreateAttribute("image");
                    image.Value = "EventsGallery/" + albumName + "/" + Path.GetFileName(file);

                    xNode.Attributes.Append(title);
                    xNode.Attributes.Append(image);

                    // 7. Insert after following album (slide node)
                    XmlNode node = xDoc.DocumentElement.LastChild;
                    node.AppendChild(xNode);
                }
            }
        }

        // 8. Save Xml file
        xDoc.Save(fileName);
    }
}