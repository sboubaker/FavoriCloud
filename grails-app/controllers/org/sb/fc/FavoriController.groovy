package org.sb.fc

class FavoriController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [favoriInstanceList: Favori.list(params), favoriInstanceTotal: Favori.count()]
    }

    def create = {
        def favoriInstance = new Favori()
        favoriInstance.properties = params
        return [favoriInstance: favoriInstance]
    }

    def save = {
        def favoriInstance = new Favori(params)
        if (favoriInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'favori.label', default: 'Favori'), favoriInstance.id])}"
            redirect(action: "show", id: favoriInstance.id)
        }
        else {
            render(view: "create", model: [favoriInstance: favoriInstance])
        }
    }

    def show = {
        def favoriInstance = Favori.get(params.id)
        if (!favoriInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'favori.label', default: 'Favori'), params.id])}"
            redirect(action: "list")
        }
        else {
            [favoriInstance: favoriInstance]
        }
    }

    def edit = {
        def favoriInstance = Favori.get(params.id)
        if (!favoriInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'favori.label', default: 'Favori'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [favoriInstance: favoriInstance]
        }
    }

    def update = {
        def favoriInstance = Favori.get(params.id)
        if (favoriInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (favoriInstance.version > version) {
                    
                    favoriInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'favori.label', default: 'Favori')] as Object[], "Another user has updated this Favori while you were editing")
                    render(view: "edit", model: [favoriInstance: favoriInstance])
                    return
                }
            }
            favoriInstance.properties = params
            if (!favoriInstance.hasErrors() && favoriInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'favori.label', default: 'Favori'), favoriInstance.id])}"
                redirect(action: "show", id: favoriInstance.id)
            }
            else {
                render(view: "edit", model: [favoriInstance: favoriInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'favori.label', default: 'Favori'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def favoriInstance = Favori.get(params.id)
        if (favoriInstance) {
            try {
                favoriInstance.delete(flush: true)
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
