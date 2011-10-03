package org.sb.fc

import org.sb.fc.Authority

import org.bson.types.ObjectId

class User {
	ObjectId id
	String email
	String username
	String password
	String description
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	boolean isdeleted
	Authority authority
	static hasMany = [ favoris : Favori ]
	static constraints = {
		email blank: false, unique: true
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}
}
