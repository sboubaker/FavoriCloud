
import org.sb.fc.Status

import org.sb.fc.User 
import org.sb.fc.Authority
class BootStrap {

	def init = { servletContext ->
		User admin = User.findByAuthority(Authority.ROOT) ?:
			new User(email:'boubaker.sabri@gmail.com' ,username: 'admin',
					password: 'admin',
					enabled: true, accountLocked: false,
					accountExpired: false, passwordExpired: false,status: Status.ACTIVE
					,authority:Authority.ROOT ).save(flush: true)
 
		if (admin.hasErrors()) {
			admin.errors.each { println it }
		}
	}
 
	def destroy = {
	}
}
