function SubNavChanged(tabListExtender, inactiveTab)
{
//  WriteDbg('SubNavChanged');
    if(tabListExtender._CurrentTab != null && tabListExtender._ActiveTabContainer != tabListExtender._CurrentTab)
    {
        ChangeCssOfTab($get(tabListExtender._CurrentTab.TargetControlId), "_RollOver");
         //$get(tabListExtender._CurrentTab.TargetControlId).style.zIndex = 101;
    }
    
    if(inactiveTab != null && inactiveTab != tabListExtender._ActiveTabContainer && inactiveTab != tabListExtender._CurrentTab){
        ChangeCssOfTab($get(inactiveTab.TargetControlId), "");
        //$get(inactiveTab.TargetControlId).style.zIndex = $get(inactiveTab.TargetControlId).attributes["zIndex2"].value; //To fix timer error, zindex2 remembers the og z-index
    }
    //ChangeCssOfTab(inactiveTab, "");
}


function ChangeCssOfTab(tab, cssName)
{
    for(var i = 0; i < tab.childNodes.length; i++)
    {
        if(tab.childNodes[i].nodeName == "DIV")
        {
            if(GetAttribute(tab.childNodes[i], "tabposition") != null)
            {
				if(cssName == "")
					GetAttribute(tab.childNodes[i], "class").value = "mmNav"; // + tabposition + cssName;
				else
				{
					var tabposition = GetAttribute(tab.childNodes[i], "tabposition").value;
					//tab.childNodes[i].attributes["class"].value = tab.childNodes[i].attributes["class"].value + cssName;
					GetAttribute(tab.childNodes[i], "class").value = "mmNav" + tabposition + cssName;
				}
            }
        }
    }
}