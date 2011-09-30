package org.sb.fc

class UserFilters {

    def filters = {
        userUserCkeck(controller:'user', action:'(show|edit|update|delete)') {
            before = {
				if(! (session.username && session.authority == Authority.USER)) {
					redirect(controller:"user", action:"login")
					return false
				  }
            }
           
        }
		rootUserCkeck(controller:'admin', action:'*') {
			before = {
				if(! (session.username && session.authority == Authority.ROOT)) {
					redirect(controller:"user", action:"login")
					return false
				  }
			}
			
		}
		userFavoriCkeck(controller:'favori', action:'*') {
			before = {
				if(! (session.username && session.authority == Authority.USER)) {
					redirect(controller:"user", action:"login")
					return false
				  }
			}
			
		}
    }
    
}
