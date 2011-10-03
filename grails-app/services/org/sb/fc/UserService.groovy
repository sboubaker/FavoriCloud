package org.sb.fc

import org.bson.types.ObjectId

import org.sb.fc.Favori
import org.sb.fc.User

class UserService {

	static transactional = 'mongo'

	def getUserByEmail(String email) {
		User.findByEmail(email);
	}
	def getUserByUsername(String name) {
		User.findByUsername(name);
	}
	def getUserById(ObjectId id) {
		User.findById(id);
	}
	def saveUser(User user){
		user.save(flush: true);
	}
	def deleteUser(User user){
		user.isdeleted= true
		user.save(flush: true);
	}
	def updateUser(User user){
		user.update();
	}
	def listUsers (Map<Object,Object> map){
		User.list(map);
	}
	def count = {
		User.count();
	}
}
