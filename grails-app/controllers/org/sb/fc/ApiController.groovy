package org.sb.fc

class ApiController {
	
	def favoriService
	def userService

	static allowedMethods = [save: "POST", update: "POST", delete: "GET"]
	
    def list = {
		def data=[msg:'ok',favoris: favoriService.listFavorisByUserId(session.uid), total: favoriService.countByUserId(session.uid)]
		render(contentType: "text/json") {json = data}
	}
	def test = {}
	def save = {
		def favoriInstance = new Favori(params)
		favoriInstance.dtCreate=new Date()
		favoriInstance.dtUpdate=new Date()
		favoriInstance.isdeleted=false
		if (favoriService.saveFavori(favoriInstance,session.uid)) {
			User user= User.findById(session.uid);
			user.addToFavoris(favoriInstance);
			userService.saveUser(user);
			render(contentType: "text/json") {json = [msg:'ok']}
		}
		else {
			render(contentType: "text/json") {json = [msg:'no']}
		}
	}
	def delete = {
		def favoriInstance = Favori.get(params.id)
		if (favoriInstance) {
			try {
				favoriService.deleteFavori(favoriInstance,session.uid)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'favori.label', default: 'Favori'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'favori.label', default: 'Favori'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'favori.label', default: 'Favori'), params.id])}"
			redirect(action: "list")
		}
	}
}
