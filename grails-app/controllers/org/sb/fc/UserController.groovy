package org.sb.fc

import org.sb.fc.User



class UserController {

	def userService

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index = {
		redirect(controller:"favori", action: "list", params: params)
	}
	def create = {
		def userInstance = new User()
		userInstance.properties = params
		return [userInstance: userInstance]
	}

	def save = {
		def userInstance = new User(params)
		userInstance.enabled=true
		userInstance.accountExpired=false
		userInstance.accountLocked=true
		userInstance.passwordExpired=false
		userInstance.authority=Authority.USER
		if (userService.saveUser(userInstance)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
			redirect(action: "login")
		}
		else {
			render(view: "create", model: [userInstance: userInstance])
		}
	}

	def show = {
		def userInstance = userService.getUserById(params.id)
		if (!userInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "list")
		}
		else {
			[userInstance: userInstance]
		}
	}

	def edit = {
		def userInstance = userService.getUserById(params.id)
		if (!userInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [userInstance: userInstance]
		}
	}

	def update = {
		def userInstance = userService.getUserById(params.id)
		if (userInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (userInstance.version > version) {

					userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'user.label', default: 'User')]
					as Object[], "Another user has updated this User while you were editing")
					render(view: "edit", model: [userInstance: userInstance])
					return
				}
			}
			userInstance.properties = params
			userInstance.authority=Authority.USER
			if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
				redirect(action: "show", id: userInstance.id)
			}
			else {
				render(view: "edit", model: [userInstance: userInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "list")
		}
	}
	def login = {
		if(session.username ){
			if(session.authority == Authority.USER){
				redirect(controller: "favori", action: "list",id: session.uid)
			}else{
			redirect(controller: "admin", action: "list")
			}
	  }
	}
	def authenticate = {
		User user= userService.getUserByEmail(params.email)
		if(!user){
		user= userService.getUserByUsername(params.email)
		}
		if(user){
			if(user.password == params.password ){
					if(!user.accountLocked){
					session.username = user.username
					session.authority = user.authority
					session.uid = user.id
					if(session.authority== Authority.USER){
						redirect(controller: "favori", action: "list",id: session.uid)
					}else{
						redirect(controller: "admin", action: "list")
					}
					}else{
					flash.message = "${message(code: 'error.account.locked')}"
					redirect(action: "login")
					}
				}else{
					flash.message = "${message(code: 'error.password.message')}"
					redirect(action: "login")
				}
			
		}else{
			flash.message = "${message(code: 'error.email.message')}"
			redirect(action: "login")
		}
	}
	def logout = {
		session.username = null
		session.authority = null
		session.uid = null
		redirect(action: "login")
	}
}
