package org.sb.fc

import org.bson.types.ObjectId

class UserService {

	static transactional = 'mongo'

	def getUserByEmail(String email) {
		User.findByEmail(email);
	}
	def getUserById(String id) {
		User.findById(ObjectId.massageToObjectId(id));
	}
	def saveUser(User user){
		user.save(flush: true);
	}
	def deleteUser(User user){
		user.delete(flush: true)
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
