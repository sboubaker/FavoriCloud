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
		rootFavoriCkeck(controller:'favori', action:'(listall)') {
			before = {
				if(! (session.username && session.authority == Authority.ROOT )) {
					redirect(controller:"user", action:"login")
					return false
				  }
			}
			
		}
		userFavoriCkeck(controller:'favori', action:'(index|show|list|edit|update|delete)') {
			before = {
				if(! (session.username && session.authority == Authority.USER)) {
					redirect(controller:"user", action:"login")
					return false
				  }
			}
			
		}
		allFavoriCkeck(controller:'favori', action:'(show)') {
			before = {
				if(! (session.username)) {
					redirect(controller:"user", action:"login")
					return false
				  }
			}
			
		}
		
    }
    
}
