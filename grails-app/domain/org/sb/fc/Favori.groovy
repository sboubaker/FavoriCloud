package org.sb.fc

import org.bson.types.ObjectId

class Favori {
	ObjectId id
	String title
	String url
	static belongsTo = [owner:User]
    static constraints = {
		title(blank:false)
		url(blank:false)
    }
	
}
