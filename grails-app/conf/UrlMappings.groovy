class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?/$json?"{
			constraints {
				// apply constraints here
			}
		}
		"/"(controller:"user", action:"login")
		"500"(view:'/error')
	}
}
