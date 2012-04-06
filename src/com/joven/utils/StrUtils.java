package com.joven.utils;

public class StrUtils {
	public static String HtmlEncode(String theString) {
		theString = theString.replace(">", "&gt;");
		theString = theString.replace("<", "&lt;");
		theString = theString.replace(" ", " &nbsp;");
		theString = theString.replace(" ", " &nbsp;");
		theString = theString.replace("\"", "&quot;");
		theString = theString.replace("\'", "&#39;");
		theString = theString.replace("\n", "<br/> ");
		return theString;
	}

	public static String HtmlDiscode(String theString) {
		theString = theString.replace("&gt;", ">");
		theString = theString.replace("&lt;", "<");
		theString = theString.replace("&nbsp;", " ");
		theString = theString.replace(" &nbsp;", " ");
		theString = theString.replace("&quot;", "\"");
		theString = theString.replace("&#39;", "\'");
		theString = theString.replace("<br/> ", "\n");
		return theString;
	}

}
