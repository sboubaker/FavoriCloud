package org.sb.fc

import java.util.Map;

import org.bson.types.ObjectId;

class FavoriService {

    static transactional = 'mongo'

	def userService
	
	def saveFavori(Favori favori){
		favori.save(flush: true);
	}
	def updateUser(User favori){
		favori.update();
	}
	def deleteFavori(Favori favori){
		favori.delete(flush: true);
	}
	def listFavorisByUserId (String id){
		User user= User.findById(ObjectId.massageToObjectId(id));
		if(!user)
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
	def addFavoriToUser(Favori favori,User user){
		saveFavori(favori)
		user.addToFavoris(favori);
		userService.saveUser(user);
	}
}
