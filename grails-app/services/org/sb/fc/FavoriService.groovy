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
	def deleteFavori(Favori favori){
		favori.delete(flush: true);
	}
	def listFavorisByUserId (ObjectId id){
		User user= User.findById(id);
		if(user)
		user.favoris
		else
		null
	}
	def listFavoris (Map<Object,Object> map){
		Favori.list(map);
	}
	def count = {
		Favori.count();
	}
}
