import org.sb.fc.Status;
import org.sb.fc.User

class BootStrap {

	def init = { servletContext ->
        User admin = User.findByEmail('boubaker.sabri@gmail.com') ?:
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
