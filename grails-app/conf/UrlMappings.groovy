class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"{
                    controller ="pax"
                    action:"create"
                }
		"500"(view:'/error')
	}
}
