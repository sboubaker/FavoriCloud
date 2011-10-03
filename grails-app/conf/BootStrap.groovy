
import org.sb.fc.User 
import org.sb.fc.Authority
class BootStrap {

	def init = { servletContext ->
		User admin=null;
		if(!User.findByAuthority(Authority.ROOT)){
			admin=new User(email:'boubaker.sabri@gmail.com' ,username: 'admin',
				password: 'admin',
				enabled: true, accountLocked: false,
				accountExpired: false, passwordExpired: false, isdeleted: false,description:""
				,authority:Authority.ROOT);
			admin.save(flush: true);
		}
		if (admin && admin.hasErrors()) {
			admin.errors.each { println it }
		}
	}
 
	def destroy = {
	}
}
