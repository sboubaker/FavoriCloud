package org.sb.fc

import java.util.Map;

import org.bson.types.ObjectId;

import org.sb.fc.Favori
import org.sb.fc.User

class FavoriService {

	static transactional = 'mongo'

	def userService
	
	def saveFavori(Favori favori ,ObjectId id){
		User user= User.findById(id);
		favori.save(flush: true);
		user.addToFavoris(favori);
		userService.saveUser(user);
	}
	def updateUser(User favori){
		favori.update();
	}
	def deleteFavori(Favori favori ,ObjectId id){
		favori.isdeleted=true
		favori.save(flush: true);
		User user= User.findById(id);
		user.addToFavoris(favori);
		userService.saveUser(user);
	}
	def listFavorisByUserId (ObjectId id){
		User.findById(id)?.favoris?.find { it.isdeleted == false }
	}
	def listFavoris (Map<Object,Object> map){
		Favori.list(map);
	}
	def countByUserId(ObjectId id){
		User.findById(id)?.favoris?.count { it.isdeleted == false }
	}
}
